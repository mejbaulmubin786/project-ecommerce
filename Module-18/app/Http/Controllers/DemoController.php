<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

// It's good to include the base Controller

class DemoController extends Controller {
    public function DemoAction() { // Use 'public' visibility and follow proper naming conventions
        $products = DB::table('products')->select('title', 'price')->get();


        return $products;
    }
}
