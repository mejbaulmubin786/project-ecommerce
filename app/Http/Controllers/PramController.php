<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PramController extends Controller {
    function PramAction(Request $request) {
        $name = $request->name;
        $age = $request->age;

        return "My name is = {$name} and my age is {$age}";
    }
}

class UserController extends Controller {
    public function show(Request $request) {
        return "User ID is: " . $request->id;
    }
}
