<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductController extends Controller {
    function Demo1(Request $request) {
        return "demo1";
    }

    function Demo2(Request $request) {
        return "demo2";
    }

    function Demo3(Request $request) {
        return "demo3";
    }
}
