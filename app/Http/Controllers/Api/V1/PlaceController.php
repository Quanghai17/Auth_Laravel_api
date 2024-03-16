<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Place;

class PlaceController extends Controller
{
    public function index() {
        $places = Place::get();
        return response()->json($places);
    }
}

