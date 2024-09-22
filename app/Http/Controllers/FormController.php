<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FormController extends Controller {
    public function submit(Request $request) {
        // ফর্মের ইনপুট ভ্যালিডেশন
        $request->validate([
            'name' => 'required|string|max:255',
            'age' => 'required|integer|min:1|max:120',
            'email' => 'required|email',
            'password' => 'required|string|min:8',
            'gender' => 'required|string',
            'interests' => 'array',
            'country' => 'required|string',
            'bio' => 'nullable|string',
            'dob' => 'nullable|date',
            'resume' => 'nullable|file|mimes:pdf,doc,docx|max:2048', // সর্বাধিক 2MB
        ]);

        // ডেটা প্রসেস করা (যেমন: ডাটাবেসে সেভ করা বা অন্য কিছু)
        // উদাহরণস্বরূপ, কনসোলে ডেটা আউটপুট করা
        $data = $request->all(); // সব ইনপুট ডেটা নিন

        // এখানে আপনি ডেটা ডাটাবেসে সেভ করতে পারেন
        // User::create($data); // এই লাইনটি শুধু উদাহরণ

        // ডেটা পরিদর্শন
        return view('form-output', compact('data')); // 'form-output' ভিউতে ডেটা পাঠান
    }
}
