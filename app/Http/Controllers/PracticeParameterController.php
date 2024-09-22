<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PracticeParameterController extends Controller {
    function practiceparamitar(Request $request) {
        $country = $request->country;
        return "<h1>My country name is {$country}</h1>";
    }
}
