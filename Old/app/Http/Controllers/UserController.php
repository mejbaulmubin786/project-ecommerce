<?php
// app/Http/Controllers/UserController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller {
    public function submit(Request $request) {
        if ($request->isMethod('post')) {
            // POST রিকোয়েস্টের ক্ষেত্রে ফর্ম ডেটা প্রক্রিয়া করা হবে
            $name = $request->input('name');
            $email = $request->input('email');

            return response()->json([
                'message' => 'Form submitted successfully!',
                'name' => $name,
                'email' => $email,
            ]);
        } else {
            // GET রিকোয়েস্টের ক্ষেত্রে ফর্মটি দেখানো হবে
            return view('form');
        }
    }
}
