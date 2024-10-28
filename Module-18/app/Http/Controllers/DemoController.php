<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

// It's good to include the base Controller

class DemoController extends Controller {
    public function DemoAction() { // Use 'public' visibility and follow proper naming conventions
        $result = DB::table('products')->min('price'); // Store the query result in a variable
        return $result; // Return as JSON for better API response handling
    }
}
