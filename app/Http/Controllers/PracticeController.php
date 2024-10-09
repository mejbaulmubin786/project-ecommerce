<?php

namespace App\Http\Controllers;

class PracticeController extends Controller {
    function practice() {
        $p = request()->segment(2);
        $q = request()->segment(1);
        return "$p and $q";
    }
}
