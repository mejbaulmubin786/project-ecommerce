Laravel-এ একটি `Middleware`-কে রাউট গ্রুপে কিভাবে ব্যবহার করা যায়, তা সহজ করে নিচে বোঝানো হলো। 

## ১. Middleware পরিচিতি
`Middleware` হলো একটি ফিল্টার যা রিকোয়েস্ট এবং রেসপন্সের মাঝে কাজ করে। এটি নির্দিষ্ট শর্ত পূরণ করলে রিকোয়েস্টকে কন্ট্রোলারে পৌঁছাতে দেয়, অন্যথায় তা ব্যর্থ হয়। সাধারণত সুরক্ষা, অথেনটিকেশন বা নির্দিষ্ট যাচাইয়ের জন্য ব্যবহার করা হয়।

### উদাহরণ: নির্দিষ্ট রাউটে Middleware ব্যবহার
```php
Route::get('/hello1/{key}', [DemoController::class, 'DemoAction1'])->middleware([CheckRequestDetails::class]);
Route::get('/hello2/{key}', [DemoController::class, 'DemoAction2'])->middleware([CheckRequestDetails::class]);
```
উপরের কোডে প্রতিটি রাউটে আলাদাভাবে `CheckRequestDetails` Middleware প্রয়োগ করা হয়েছে। অনেকগুলো রাউটে একের পর এক এভাবে Middleware যুক্ত করলে কোডের পুনরাবৃত্তি হয়।

## ২. Route Group এর মাধ্যমে Middleware ব্যবহার
বার বার Middleware যুক্ত না করে, আমরা একটি `Route Group` তৈরি করতে পারি এবং সেখানে একবার Middleware প্রয়োগ করলেই পুরো গ্রুপে তা প্রযোজ্য হবে।

### রাউট গ্রুপ তৈরি
Laravel-এ `Route::group()` ফাংশনটি ব্যবহার করে রাউটগুলিকে একটি গ্রুপের মধ্যে যুক্ত করা যায় এবং পুরো গ্রুপের উপর একটি বা একাধিক `Middleware` প্রয়োগ করা যায়।

#### কোড উদাহরণ:
```php
Route::middleware(['check'])->group(function () {
    Route::get('/hello1/{key}', [DemoController::class, 'DemoAction1']);
    Route::get('/hello2/{key}', [DemoController::class, 'DemoAction2']);
    Route::get('/hello3/{key}', [DemoController::class, 'DemoAction3']);
    Route::get('/hello4/{key}', [DemoController::class, 'DemoAction4']);
    Route::get('/hello5/{key}', [DemoController::class, 'DemoAction5']);
});
```

এখানে `/hello1`, `/hello2`, `/hello3`, `/hello4`, এবং `/hello5` রাউটগুলিতে `check` নামে একটি Middleware প্রয়োগ করা হয়েছে। 

### একাধিক Middleware যুক্ত করা
Laravel-এ একই সাথে একাধিক Middleware একটি রাউট গ্রুপে প্রয়োগ করা সম্ভব। এজন্য আমরা `middleware()` ফাংশনে একটি অ্যারের মধ্যে একাধিক Middleware উল্লেখ করতে পারি:

```php
Route::middleware(['auth', 'check'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index']);
    Route::get('/profile', [ProfileController::class, 'show']);
});
```
উপরের কোডে, `auth` এবং `check` নামে দুটি Middleware পুরো গ্রুপের রাউটগুলিতে প্রয়োগ হয়েছে। যদি এই দুটির শর্ত পূরণ হয়, তাহলে রিকোয়েস্ট কন্ট্রোলারে পৌঁছাতে পারবে।

## ৩. Kernel.php-এ Middleware নিবন্ধন
Middleware ব্যবহারের আগে তা `Kernel.php`-তে নিবন্ধন করতে হবে। 

### Middleware নিবন্ধন
`app/Http/Kernel.php` ফাইলে `$middlewareAliases` প্রপার্টিতে Middleware-গুলিকে একটি নাম বা এলিয়াস দিয়ে নিবন্ধন করতে হয়, যেন সহজে সেই নাম ব্যবহার করা যায়।

```php
protected $middlewareAliases = [
    'check' => \App\Http\Middleware\CheckRequestDetails::class, // check এলিয়াসটি CheckRequestDetails Middleware কে নির্দেশ করছে
    'auth' => \App\Http\Middleware\Authenticate::class,
    'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,
    'verified' => \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class,
];
```

এখানে `check` নামে একটি এলিয়াস তৈরি করা হয়েছে, যা `CheckRequestDetails` ক্লাসকে নির্দেশ করছে। এখন যেকোনো রাউট বা রাউট গ্রুপে এই এলিয়াস ব্যবহার করে Middleware প্রয়োগ করা যাবে।

```php
//CheckRequestDetails.php
<?php

namespace App\Http\Middleware;

  

use Closure;

use Illuminate\Http\Request;

use Symfony\Component\HttpFoundation\Response;

  

class CheckRequestDetails {

  

    public function handle(Request $request, Closure $next): Response {

        $key = $request->key;

  

        if ($key == "123") {

            return $next($request);

        } else {

            return response()->json("unauthorized", 401);

        }

    }

}
```

## ৪. Route Group এর সুবিধা
রাউট গ্রুপের মাধ্যমে আমরা নিম্নলিখিত সুবিধা পাই:
- **কোড পুনরাবৃত্তি কমানো:** আলাদাভাবে প্রতিটি রাউটে Middleware প্রয়োগ করার বদলে, একবার গ্রুপে প্রয়োগ করলেই সব রাউটে কার্যকর হয়।
- **সহজ রক্ষণাবেক্ষণ:** Middleware পরিবর্তন বা আপডেট করতে হলে কেবল গ্রুপের উপর পরিবর্তন করতে হবে।
- **সহজ এক্সটেন্ডিবিলিটি:** রাউট গ্রুপে নতুন রাউট যোগ করা হলে অটোমেটিক্যালি Middleware প্রয়োগ হয়ে যাবে।

---

Laravel-এ রাউট গ্রুপের সাথে Middleware ব্যবহারের পদ্ধতি এইভাবেই সহজ এবং সংগঠিত।