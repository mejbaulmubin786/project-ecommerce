<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

class DemoController extends Controller {
    function DemoAction(Request $request): array {

        return $request->getAcceptableContentTypes();
    }
}
