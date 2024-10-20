<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CollectAllDta extends Controller {
    function action(Request $request) {
        $pin = $request->header('pin');
        $city = $request->input('city');
        $postcode = $request->input('postcode');
        $name = $request->name;
        $age = $request->age;

        return [$pin, $city, $postcode, $name, $age];

    }
}
