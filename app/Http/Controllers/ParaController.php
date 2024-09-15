<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ParaController extends Controller {
    function ParaAction(Request $request) {
        $name = $request->name;
        $age = $request->age;
        return "Name is ${name}, age is = ${age}";
    }
}
