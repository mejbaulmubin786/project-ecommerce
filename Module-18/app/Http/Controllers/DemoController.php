<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

// It's good to include the base Controller

class DemoController extends Controller {
    public function DemoAction() { // Use 'public' visibility and follow proper naming conventions
        $count = DB::table('products')->count();

        // টেবিলের price কলামের সর্বোচ্চ মান
        $maxPrice = DB::table('products')->max('price');

        // টেবিলের price কলামের সর্বনিম্ন মান
        $minPrice = DB::table('products')->min('price');

        // টেবিলের price কলামের গড় মান
        $averagePrice = DB::table('products')->avg('price');

        // টেবিলের price কলামের সমস্ত মানের যোগফল
        $totalPrice = DB::table('products')->sum('price');

        return [
            'Total Rows' => $count,
            'Max Price' => $maxPrice,
            'Min Price' => $minPrice,
            'Average Price' => $averagePrice,
            'Total Price Sum' => $totalPrice,
        ];
    }
}
