<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PramController extends Controller {
    function PramAction(Request $request) {

        return $request->header();
    }
}
