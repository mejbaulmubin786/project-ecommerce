<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller {
    function page(Request $request) {

        return view('home');
    }
}
