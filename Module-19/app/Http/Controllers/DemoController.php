<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use Illuminate\Http\Request;

class DemoController extends Controller {
    public function DemoAction(Request $request) {
        Brand::create($request->input());

    }
}

// এখানে যখন আমরা কুয়েরি বিল্ডার এ শিখি তখন আমরা DB দিয়ে সেখান থেকে টেবিল কল করে ছিলাম। এখানে যেহেতু মডেল টা টেবিল কে রিপেজেন্ট করছে তাই আলাদা করে টেবিলের নাম মেনশন করার কোন প্রয়োজন নেই।
// যেহুতু Brand:: নামে যে মডেলটা আছে সে একটি টেবিল কে রিপ্রেজেন্ট করছে তাই সেখান থেকে create মেথড কে কল করে আমরা সহজে ডাটাবেইজে ডাটা ইনসার্ট করতে পারি।
