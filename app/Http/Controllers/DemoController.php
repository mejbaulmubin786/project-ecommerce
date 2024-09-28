<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class DemoController extends Controller {
    function DemoAction(Request $request): int {
        $num1 = $request->num1;
        $num2 = $request->num2;
        $sum = $num1 + $num2;
        Log::info("$num1 + $num2 = " . $sum);
        return $sum;
    }
}
