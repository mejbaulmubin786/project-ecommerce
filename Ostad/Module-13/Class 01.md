1. আমরা জানি লারাভেল যদিও বলা হয় MVC আরকিটেকচারে গঠিত । তবে পুরোপুরি MVC মিলাতে গেলে কোন মতোই মিলবে না। কারণ লারাভেল দিয়ে পুরো ফুলস্যাক করলে মানে মনোলিথ এপ্লিকেশন ডেভেলপ করলে তার পারফরমেন্স ভালো হবে না।

2. লারাভেল দিয়ে যদি শুথু আমরা ব্যক এন্ড ডেভেলপ করি তখন এটি আর MVC থাকবে না এটি হবে MC

3. আবার যদি আমরা শুধু SSR Front End--> VC

4. Front End এর জন্য লারাভেল এ আছে Blade Template Engine এটি ছাড়া লারাভেল এর সবি ব্যক এন্ড এর জন্য দরকারি। লারাভেল এর এই বিশাল আরকিটেকচার এর ভেতর resources ফোল্ডার টাই মুলত Front End এর কাজে লাগে আর বাকি সকল কিছু ব্যাক এন্ড এর জন্য প্রোজনিয়।

main topic start

যেহুতু আমরা বলেছি লারাভেল হচ্ছে MVC মেনে চলে তাহলে লারাভেল এর এই বিশার আরকিটেকচার এর মাঝে কোন গুলো কনট্রোলার
লারাভেল এ কন্ট্রোলার, মাইগ্রেশন ও মিডলওয়্যার, মডেল ও অন্যান্য যা যা প্রয়োজন সবগুলোর নেমিং কনেভেনশন উল্লেখ হবে এখানে।

1. Laravel এ Request-Response Model এর জন্য (Route and controller দ্বায়ী)
   স্বাধারণ ভাবে কন্ট্রোলার যা রিটার্ন করে তাই রেসপ্সস

    Request----> (Routing)----> (Controller)----> (return)----> Response

ধরুন আমরা কমান্ড দিয়ে নিচের DemoController টি তৈরি করলাম এবং এতে Demo1, Demo2, Demo3 নামের তিনটি ফাংশন তৈরি করলাম এখন এই ফাংশন গুলোয় রিটার্ন স্টেটমেন্ট যুক্ত করার পর আমরা কম্পিলট করবো (Controller)----> (return)----> Response । এখন বাকি আছে Request----> (Routing)----> অংশ।
এখন কন্ট্রোলার তৈরি করলে সেটি নিজে নিজে কাজ করে না সেটিকে কোন না কোন রাউটিং এর সাথে যুক্ত করতে হয়।

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductController extends Controller {
    function Demo1(Request $request) {
        return "demo1";
    }

    function Demo2(Request $request) {
        return "demo2";
    }

    function Demo3(Request $request) {
        return "demo3";
    }
}

```

এবার আমরা শেষ করবো (Routing)----> অংশ।

```php
//web.php
<?php
use App\Http\Controllers\ProductController;
Route::get("/demo1", [ProductController::class, 'Demo1']);
Route::get("/demo2", [ProductController::class, 'Demo2']);
Route::get("/demo3", [ProductController::class, 'Demo3']);
```

এবর আমাদের মেইন বিষয় বাকি তা হলো Request----> এটি আমরা কোথা থেকে করবো হয় ব্রাউজার থেকে নয় পোস্টম্যান থেকে আমরা যদি ব্রাউজার থেকে রিকোয়েস্ট করি http://127.0.0.1:8000/demo1 তবে আমাদের আউটফুট চলে আসবে demo1। এই পুরো আলোচনা থেকে বুঝা যাচ্ছে রিকোয়েস্ট প্রথম যারে রাউট এর কাছে তার পরবতি ধাপ গুলো শেষ করে রেসপন্স পাবো। এই রিকোয়েস্ট থেকে রেসপন্স পাওয়া পর্যন্ত একটি সাইকেল পূর্ন হয় এটি কে আমরা বলতে পারি রিকোয়েস্ট রেসপ্ন্স সাইকেল। এখানে রিকোয়েস্ট রেসপ্ন্স টেস্ট করার জন্য লারাভেল এর বিল্ট ইন CSRF সিকুরিটি অফ করতে হবে। এটি এনেবল থাকলে উইদাউট CSRF সিকুরিটি মানে যে গুলো আছে যেমন গেট মেথডে কাজ করবে বাকি পোস্ট, পুট ইত্যাদি মেথকে পেকটিস করতে দেবে না। এর জন্য আমরা শেখার সময় ও ডেভেলপমেন্ট করার সময় অফ করে রাখবো ফাইনার কাজ শেষ হলে এটিকে আমার এনেবল করে দিতে হবে। এটিকে ডিজেবল বা এনেবল করতে আমরা যা করতে পারি। আমরা লারাভেল এর bootstrap এ গিয়ে .........laravel 10 ও Laravel 11 দুটর জন্যই এখানে দেখানো হলো।

আমরা যা আগে বলেছি কন্টোলার যা রিনাট করে তাই রেসপন্স তাহলে কন্ট্রোলার কি কি রিটার্ন করতে পারে। রিটার্ন করতে পারে িইন্টিজার স্ট্রি, নাল( প্রকৃত রিনাটে কিছুই থাকে না অনেক সময় এই খালি রিনার্ট করা প্রন্ট এন্ড এর বিপদে পড়তে হয়।), বুলিয়ান( এই রিটাণে ও মনে রাখতে হবে টু রিটার্ন করলে রিটার্ন হয় 1 আর ফলস রিটান করলে ও হয় ফাকা ), এরে রিটার্ন করা যায় এখানে একটি বিষয় মনে রাখা দরকার লারাভেল যদি কোন এসোসিয়েটিভ এরে রিটার্ন করে তবে অটমিটিক্যালি জেসন অবজেক্ট হিসেবে রিটার্ন হয়। আর যদি মাল্ডি ডাইমেন শনাল এরে রিটার্ন করে তবে সে হয়ে যায় জেসন এরে।
এর পরের আলোচনার বিষয় হবে রিডাইরেকশন। আবার আমরা চাইলে রিটার্ন করতে পারি একটি ফাইল

return response()->file("img.png"); এভারে বাইনারি লার্জ অবজেক্ট না চাইলে ডাউনলোড রেসপ্ন করা যায় এতে অটোমেটির ঐ রাউটে গেলে ফাইল ডাউনলোড হয়ে যাবে এক্ষেত্রে ফাইলের প্রিভিউ আর দেখা যাবে না। ।

এবার আলোচনা লারাভেল রিকোয়েস্ট
রিকোয়েস্ট এর প্রথম আলোচনা হচ্ছে মেথড(get, post, put, patch, delete)

//request methods

```php
//web.php
<?php
use App\Http\Controllers\ProductController;
Route::get("/request1", [ProductController::class, 'request1']);
Route::get("/request2", [ProductController::class, 'request1']);
```

এখন ধরুন আমাদের রাউন এক মেথডে যেমন পুট মেথডে আছে আমরা যদি অন্য মেথডে রিকোয়েস্ট করে তবে আমরা কাক্ষিত ফল পাবো না। এখানে একটি এরোর কোড আসবে এই রকম কয়েকটি এরোর কোড সম্পর্কে বলুন এগুলো লারাভেল এ বিল্ট ইন।
এই রিকোয়েস্ট এর সাথে আমরা পেরামিটার পাঠাতে পারি কুয়েরি স্ট্রিং পাঠাতে পারি বডি পাঠাতে পারি হেডার পাঠাতে পারি

//URL Parameter Passing

```php
//web.php
<?php
use App\Http\Controllers\DemoController;
Route::get("/ostad/{name}/{city}/{code}", [DemoController::class, 'OSTAD1']);
```

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    function OSTAD1(Request $request) {
       $name = $request->name;
       $city = $request->city;

       return [$name, $city, $code];
    }

}

```

//JESON body passing

ধরুন আমারা প্রন্ট এন্ড থেকে জেসন পাঠাচ্ছি । আমরা যখন প্রন্ট এন্ড এ ভিউ সেএস বা রিয়েক্ট জেএস ব্যবহার করবো তবে নিচের মতো আমাদের রিকোয়েস্ট যাবে

{
"fname":"Mejbaul",
"lname":"Mubin",
"course_name":"Laravel Vue.js"
"batch_no":04,
"instructor":"Mejbaul Mubin (Rubel)"
}

লারাভেল এর এই রিকোয়েস্ট কি করে ব্যাক এন্ড এ ধরতে হবে

```php
//web.php
<?php
use App\Http\Controllers\DemoController;
Route::get("/ostad", [DemoController::class, 'OSTAD1']);
```

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    function OSTAD1(Request $request) {
      return $request->input();  // সবগুলো একসাথে পিক করার জন্য


    }

}
// আলাদা আলাদা করে পিক করতে চাইলে return $request->input('fname');

```

এবার আলোচনা হবে রিকোয়েস্ট হেডার।

return $request->header(); // এভাবে হলে সবগুলো প্রোপাটি ধরবে
নির্দিষ্ট কয়েকটাকে ধরতে return $request->header('token');

এবার রিকোয়েস্ট কুয়েরি সিট্রং
