<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Customer;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Validation\Rules;
use Illuminate\Http\JsonResponse;
use Illuminate\Auth\Events\Registered;

class AuthController extends Controller
{
    public function __construct()
    {
        
    }

    public function register(Request $request): JsonResponse
    {
        // Validate the incoming request data
        $validatedData = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:'.Customer::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'device_name' => 'required',
        ]);

        // Create a new user with the validated data
        $user = Customer::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => Hash::make($validatedData['password']),
        ]);

        // Fire the Registered event
        event(new Registered($user));

        $newUserToken = $user->createToken($request->device_name)->plainTextToken;

        // Return a JSON response indicating success
        return response()->json([
            'message' => 'Registration successful',
            'user' => $user,
            'newUserToken' =>$newUserToken
        ], 200);
    }

    public function login(Request $request): JsonResponse
    {
        // Validate the incoming request data
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
            'device_name' => 'required',
        ]);

        // Attempt to log in the user
        if (Auth::attempt($credentials)) {
            // If authentication is successful, generate token
            $token = $request->user()->createToken($request->device_name)->plainTextToken;

            // Return user data along with the token
            return response()->json([
                'user' => $request->user(),
                'token' => $token,
            ], 200);
        }

        // If authentication fails, return error message
        throw ValidationException::withMessages([
            'email' => ['The provided credentials are incorrect.'],
        ]);
    }

    public function logout(Request $request)
    {
        $user = Customer::where('email', $request->email)->first();

        if ($user) {
            $user->tokens()->delete();
        }

        return response()->noContent();
    }
}