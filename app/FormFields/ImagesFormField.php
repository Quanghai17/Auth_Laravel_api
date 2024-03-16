<?php

namespace App\FormFields;

use TCG\Voyager\FormFields\AbstractHandler;

class ImagesFormField extends AbstractHandler
{
  protected $codename = 'Multiple Image Customs';

  public function createContent($row, $dataType, $dataTypeContent, $options)
  {
    return view('formfields.images', [
      'row' => $row,
      'options' => $options,
      'dataType' => $dataType,
      'dataTypeContent' => $dataTypeContent
    ]);
  }
}