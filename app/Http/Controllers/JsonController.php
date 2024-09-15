<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class JsonController extends Controller {
    function JsonAction(Request $request): array {

        return $request->input();
    }
}
