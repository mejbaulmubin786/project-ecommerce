<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

class DemoController extends Controller {
    function DemoAction(Request $request) {
        $name = $request->route('countryname');
        return "$name";

    }

    function DemoActionOp(Request $request) {
        $name = $request->name ?? 'Unknown';
        $age = $request->age;

        return "My name is {$name} and my age is {$age}";

    }

    function BodyPractice(Request $request) {
        $name = $request->input('name');
        $age = $request->input('age');
        $city = $request->input('address.city');
        $postcode = $request->input('address.postcode');

    }
}

/*

class DemoController extends Controller {
function DemoAction($name) {

return "$name";

}
}
 */
