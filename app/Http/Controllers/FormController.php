<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FormController extends Controller {
    public function showForm() {
        return view('form'); // ফর্ম দেখানোর জন্য
    }

    public function handleSubmit(Request $request) {
        // ফর্ম ডেটা ভ্যালিডেশন
        $validatedData = $request->validate([
            'name' => 'required|max:255',
        ]);

        // সফলভাবে ফর্ম সাবমিট হলে রিডিরেক্ট করা হবে
        return redirect()->route('form.show')->with('success', 'Form submitted successfully!');
    }
}
