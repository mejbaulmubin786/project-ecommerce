<?php

namespace App\Http\Controllers;

class GreetingController extends Controller {
    public function showGreeting() {
        return response()->json([
            'message' => 'Hello! This is a Laravel Request-Response example.',
        ]);
    }
}
