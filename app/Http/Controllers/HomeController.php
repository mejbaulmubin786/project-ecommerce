<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller {
    function page(Request $request) {
        $num1 = $request->num1;
        $num2 = $request->num2;
        $sum = $num1 + $num2; // যে যোগ ফল আসবে আমি চাচ্ছি সেটি কে পাস করে দিবো

        $data = ['result' => $sum]; //ডাটাটা যেহুতু ভিউ এর মাঝে পাস করে দিয়েছি।
        return view('home', $data);
    }
}
