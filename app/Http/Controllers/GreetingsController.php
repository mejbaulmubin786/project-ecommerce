<?php

namespace App\Http\Controllers;

class GreetingsController extends Controller {
    function sayHi() {
        return response("Controller: Hello, How are you");
    }
}

Route::post('/form-submit', function (Request $request) {

    $email = $request->input('email');

    if ($email) {

        return response()->json([
            "status" => "success",
            "message" => "Form submitted successfully.",
            "email" => $email,
        ]);

    } else {

        return response()->json([
            "status" => "failed",
            "message" => "Form submission failed.",
        ]);

    }

});
