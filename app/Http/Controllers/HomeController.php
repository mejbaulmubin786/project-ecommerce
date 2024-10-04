<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller {
    function page(Request $request) {
        $data = [ // প্রথমেই আমি একটি এরে তৈরি করে নিচ্চি এটি একটি মাল্টি ডাইমেনশনাল এরে।
            ['name' => 'Jhon', 'city' => 'London'],
            ['name' => 'Jack', 'city' => 'Paris'],
            ['name' => 'Tailor', 'city' => 'newwork'],
            ['name' => 'Anglina', 'city' => 'Delhi'],
        ];
        return view('home', ['users' => $data]);
    }
}
