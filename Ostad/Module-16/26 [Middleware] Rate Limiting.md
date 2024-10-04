## Laravel Middleware: রিকোয়েস্ট রেট লিমিটিং (Throttle Requests)

রেট লিমিটিং Middleware বা থ্রোটলিং Laravel-এ অত্যন্ত গুরুত্বপূর্ণ একটি সুরক্ষা ব্যবস্থা। এর মাধ্যমে অ্যাপ্লিকেশনকে সুরক্ষিত করা হয় অতি বেশি সংখ্যক রিকোয়েস্ট বা ডিস্ট্রিবিউটেড ডিনায়েল অফ সার্ভিস (DoS) আক্রমণ থেকে। Laravel-এর `throttle` Middleware ব্যবহার করে খুব সহজেই নির্দিষ্ট সময়ের মধ্যে কতগুলি রিকোয়েস্ট আসতে পারে তা সীমিত করা যায়।

### রেট লিমিটিং কেন প্রয়োজন?

একটি API বা ওয়েব অ্যাপ্লিকেশনে অপ্রত্যাশিতভাবে অতি বেশি রিকোয়েস্ট আসা আপনার সার্ভারের পারফরম্যান্সকে কমিয়ে দিতে পারে এবং এটি ডাউন হয়ে যেতে পারে। এই সমস্যাটি এড়ানোর জন্যই রেট লিমিটিং Middleware ব্যবহার করা হয়:

-   **DoS আক্রমণ প্রতিরোধ**: সার্ভারকে অতিরিক্ত রিকোয়েস্ট থেকে রক্ষা করা।
-   **রিসোর্স ব্যবহারে সীমাবদ্ধতা আরোপ**: ইউজারদের নির্দিষ্ট সময়ের মধ্যে নির্দিষ্ট সংখ্যক রিকোয়েস্ট করতে বাধ্য করা।
-   **অ্যাপ্লিকেশনের সুরক্ষা বৃদ্ধি**: সার্ভারের উপর অবাঞ্ছিত চাপ কমিয়ে রাখা।

---

### ১. একটি নির্দিষ্ট রাউটে রেট লিমিটিং প্রয়োগ

Laravel রেট লিমিটিং Middleware খুব সহজে যেকোনো রাউটে প্রয়োগ করা যায়। নিচের উদাহরণে আমরা দেখবো কিভাবে `throttle` Middleware একটি নির্দিষ্ট রাউটে ব্যবহার করা হয়।

প্রথমে আমরা একটি সাধারণ কন্ট্রোলার তৈরি করি:

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {

    function DemoAction(Request $request): string {
        return "Hello";
    }

}
```

এখন এই কন্ট্রোলারকে একটি রাউটের সাথে সংযুক্ত করি:

```php
use App\Http\Controllers\DemoController;
use Illuminate\Support\Facades\Route;

Route::get('/hello', [DemoController::class, 'DemoAction']);
```

এই উদাহরণে আমরা কোনো রেট লিমিটিং প্রয়োগ করিনি, ফলে ব্যবহারকারী যতবার ইচ্ছা রিকোয়েস্ট করতে পারে।

### ২. রেট লিমিটিং Middleware প্রয়োগ

Laravel-এর `throttle` Middleware ব্যবহার করে রেট লিমিটিং প্রয়োগ করা যায়। নিচের উদাহরণে, আমরা `/hello` রাউটে রেট লিমিটিং প্রয়োগ করেছি, যেখানে এক মিনিটে ৫টি রিকোয়েস্ট করা যাবে।

```php
use App\Http\Controllers\DemoController;
use Illuminate\Support\Facades\Route;

Route::get('/hello', [DemoController::class, 'DemoAction'])->middleware('throttle:5,1');
```

-   `throttle:5,1` এর মানে হলো:
    -   **5**: ইউজার প্রতি মিনিটে সর্বোচ্চ ৫টি রিকোয়েস্ট করতে পারবে।
    -   **1**: সময়ের ইউনিট হিসেবে ১ মিনিট নির্ধারণ করা হয়েছে।

এই Middleware-টি প্রতিটি ইউজারের জন্য পৃথকভাবে কাজ করে এবং নির্দিষ্ট সময়ের মধ্যে রিকোয়েস্ট সংখ্যা সীমাবদ্ধ করে।

### ৩. রাউট গ্রুপে রেট লিমিটিং প্রয়োগ

Laravel-এ শুধুমাত্র একটি রাউট নয়, বরং রাউট গ্রুপের উপরেও রেট লিমিটিং প্রয়োগ করা যায়। উদাহরণস্বরূপ, আমরা যদি `/api` রাউট গ্রুপে রেট লিমিটিং প্রয়োগ করতে চাই, তাহলে নিচের মতো কোড লিখতে পারি:

```php
Route::middleware('throttle:60,1')->group(function () {
    Route::get('/hello1', [DemoController::class, 'DemoAction1']);
    Route::get('/hello2', [DemoController::class, 'DemoAction2']);
});
```

এখানে রাউট গ্রুপের প্রতিটি রাউটে রেট লিমিটিং প্রয়োগ করা হয়েছে। এক্ষেত্রে প্রতি মিনিটে সর্বোচ্চ ৬০টি রিকোয়েস্ট করা যাবে।

---

### ৪. Kernel.php এ গ্লোবাল রেট লিমিটিং

Laravel-এর `app/Http/Kernel.php` ফাইলে বিভিন্ন Middleware সেট করা থাকে। আমরা চাইলে `web` বা `api` রাউট গ্রুপের উপর গ্লোবাল রেট লিমিটিং প্রয়োগ করতে পারি। নিচে উদাহরণ হিসেবে `web` এবং `api` গ্রুপের উপর রেট লিমিটিং দেখানো হলো:

```php
protected $middlewareGroups = [
    'web' => [
        'throttle:60,1', // প্রতি মিনিটে ৬০টি রিকোয়েস্ট সীমা
        \App\Http\Middleware\EncryptCookies::class,
        \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
        \Illuminate\Session\Middleware\StartSession::class,
        \Illuminate\View\Middleware\ShareErrorsFromSession::class,
        \Illuminate\Routing\Middleware\SubstituteBindings::class,
    ],

    'api' => [
        'throttle:60,1', // প্রতি মিনিটে ৬০টি রিকোয়েস্ট সীমা
        \Illuminate\Routing\Middleware\ThrottleRequests::class.':api',
        \Illuminate\Routing\Middleware\SubstituteBindings::class,
    ],
];
```

এখানে:

-   **`web`** গ্রুপে প্রতি মিনিটে সর্বোচ্চ ৬০টি রিকোয়েস্ট করার অনুমতি দেওয়া হয়েছে।
-   **`api`** গ্রুপেও একইভাবে প্রতি মিনিটে ৬০টি রিকোয়েস্ট করার অনুমতি দেওয়া হয়েছে।

এভাবে `Kernel.php` ফাইলে রেট লিমিটিং প্রয়োগ করলে, অ্যাপ্লিকেশনের প্রতিটি `web` এবং `api` রাউটে গ্লোবালি এই থ্রোটলিং কার্যকর হবে।

---

### ৫. কাস্টম রেট লিমিটিং

Laravel-এর রেট লিমিটিং সিস্টেম কাস্টমাইজও করা যায়। আপনি চাইলে রেট লিমিটের শর্ত পরিবর্তন করতে পারেন, যেমন অ্যাপ্লিকেশন ভিত্তিক লিমিট সেট করা, ইউজারের রোল অনুযায়ী রেট লিমিটিং করা ইত্যাদি।

```php
RateLimiter::for('global', function (Request $request) {
    return Limit::perMinute(100)->by($request->user()->id ?: $request->ip());
});
```

এখানে:

-   **`Limit::perMinute(100)`**: প্রতি মিনিটে ১০০টি রিকোয়েস্টের সীমা নির্ধারণ করা হয়েছে।
-   **`by($request->user()->id ?: $request->ip())`**: যদি ইউজার লগ-ইন করা থাকে, তাহলে তার আইডি অনুযায়ী রেট লিমিট হবে, অন্যথায় আইপি এড্রেস অনুযায়ী।

---

### উপসংহার

Laravel-এর রেট লিমিটিং Middleware (Throttle Middleware) অ্যাপ্লিকেশনকে নিরাপদ রাখার জন্য অত্যন্ত কার্যকরী একটি টুল। এটি রাউটিং সিস্টেমের অংশ হিসেবে ব্যবহার করে সহজেই ডস আক্রমণ থেকে রক্ষা করা যায় এবং সার্ভারের উপর অত্যধিক রিকোয়েস্টের চাপ কমানো সম্ভব।
