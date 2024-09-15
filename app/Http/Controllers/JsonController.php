<?php

namespace App\Http\Controllers;

use Illuminate\Httpgi\Request;

class JsonController extends Controller {
    function JsonAction(Request $request) {
        $name = $request->name;
        $age = $request->age;
        return "Name is ${name}, age is = ${age}";
    }
}
