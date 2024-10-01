<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    // সেশনে ডাটা সংরক্ষণ করা
    public function StoringData(Request $request, $email): bool {
        // সেশনে 'user_email' কীগুলোর মাধ্যমে ডাটা সংরক্ষণ করা হচ্ছে
        $request->session()->put('user_email', $email);
        return true;
    }

    // সেশন থেকে ডাটা রিট্রিভ করা
    public function RetrievingData(Request $request): string {
        // 'user_email' থেকে ডাটা রিট্রিভ করা হচ্ছে, যদি না থাকে 'default' রিটার্ন করবে
        return $request->session()->get('user_email', 'default');
    }

    // সেশন থেকে ডাটা মুছে ফেলা
    public function DeletingData(Request $request): bool {
        // 'user_email' ডাটা সেশন থেকে মুছে ফেলা হচ্ছে
        $request->session()->forget('user_email');
        return true;
    }

    // ফ্ল্যাশ ডাটা সংরক্ষণ করা এবং মুছে ফেলা
    public function FlashData(Request $request): bool {
        // সেশন থেকে সব ডাটা মুছে ফেলা হচ্ছে
        $request->session()->flush();
        return true;
    }
}
