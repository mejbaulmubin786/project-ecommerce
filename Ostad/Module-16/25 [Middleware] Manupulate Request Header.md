## Laravel Middleware: রিকোয়েস্ট হেডার ম্যানিপুলেশন

Middleware Laravel অ্যাপ্লিকেশনে একটি অত্যন্ত গুরুত্বপূর্ণ ভূমিকা পালন করে, কারণ এটি রিকোয়েস্ট (Request) এবং রেসপন্স (Response) এর মাঝখানে বিভিন্ন ধরণের যাচাই এবং পরিবর্তন করার সুযোগ দেয়। Middleware ব্যবহার করে আমরা সহজেই রিকোয়েস্টের হেডার ম্যানিপুলেট করতে পারি। এখানে আমরা দেখবো কিভাবে রিকোয়েস্টের হেডার থেকে:
- নতুন প্রোপার্টি যোগ করা,
- বিদ্যমান প্রোপার্টি মুছে ফেলা,
- বিদ্যমান প্রোপার্টি পরিবর্তন করা ইত্যাদি কার্যকর করা যায়।

### Middleware দিয়ে রিকোয়েস্ট হেডার ম্যানিপুলেট করার উদ্দেশ্য

অনেক সময় আমাদের প্রয়োজন হয়:
- নতুন হেডার প্রোপার্টি যোগ করা।
- হেডারের কোনো মান পরিবর্তন করা।
- সিকিউরিটি বা অথেনটিকেশন সম্পর্কিত কাস্টম ভ্যালু মুছে ফেলা।
- হেডারের কাস্টম ভ্যালু সেট করা যেটি নির্দিষ্ট শর্ত পূরণ হলে কার্যকর হবে।

Laravel Middleware দিয়ে এসব কাজ খুবই সহজে করা যায়। নিচে ধাপে ধাপে এই প্রক্রিয়াটি ব্যাখ্যা করা হলো।

---

### ১. Controller তৈরি এবং রাউট সেটআপ

প্রথমে আমরা একটি সাধারণ কন্ট্রোলার তৈরি করেছি যা রিকোয়েস্টের সমস্ত হেডারকে আউটপুট করবে। এই উদাহরণে, কন্ট্রোলারটি রিকোয়েস্ট হেডারের ডাটা রিটার্ন করবে।

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    function DemoAction1(Request $request): array {
        // রিকোয়েস্ট থেকে সব হেডার রিটার্ন করবে
        return $request->header();
    }
}
```

এখন আমরা এই কন্ট্রোলারটি একটি রাউটের সাথে সংযুক্ত করছি:

```php
use App\Http\Controllers\DemoController;
use App\Http\Middleware\CheckRequestDetails;
use Illuminate\Support\Facades\Route;

// রাউট তৈরি এবং Middleware যুক্ত করা
Route::get('/hello', [DemoController::class, 'DemoAction1'])->middleware([CheckRequestDetails::class]);
```

এখন যদি আমরা `/hello` রাউটে কোনো রিকোয়েস্ট পাঠাই, তাহলে হেডারে যা কিছু থাকবে, সেগুলি প্রদর্শিত হবে।

---

### ২. Middleware তৈরি

Middleware তৈরি করার জন্য `php artisan make:middleware CheckRequestDetails` কমান্ডটি চালানো যেতে পারে। এই Middleware-টি রিকোয়েস্টকে প্রসেস করার আগে বা পরে কোনো ধরণের যাচাই বা ম্যানিপুলেশন করতে পারে।

```php
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRequestDetails {
    public function handle(Request $request, Closure $next): Response {
        // Middleware দিয়ে কোনো পরিবর্তন না হলে, রিকোয়েস্টের হেডার মূল অবস্থায় থাকবে
        return $next($request);
    }
}
```

এই কোডটি রিকোয়েস্ট হেডারকে কোনো ম্যানিপুলেশন ছাড়াই কন্ট্রোলারের কাছে পৌঁছে দেবে। ফলে আউটপুট হবে রিকোয়েস্টের হেডারে যা কিছু থাকবে তা।

---

### ৩. রিকোয়েস্ট হেডার ম্যানিপুলেশন

এখন আমরা Middleware-এ রিকোয়েস্ট হেডার ম্যানিপুলেট করবো। ধরুন, আমাদের প্রয়োজন হলো একটি নতুন হেডার প্রোপার্টি যুক্ত করা। আমরা নিচের কোডের মাধ্যমে `email` নামে একটি নতুন প্রোপার্টি যুক্ত করবো।

```php
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRequestDetails {

    public function handle(Request $request, Closure $next): Response {
        // নতুন হেডার প্রোপার্টি যুক্ত করা হচ্ছে
        $request->headers->add(['email' => 'uopeople@uopeople.com']);
        
        // পরবর্তী প্রসেসে রিকোয়েস্ট পাঠানো হচ্ছে
        return $next($request);
    }
}
```

এই Middleware-টি রিকোয়েস্টের হেডারে একটি নতুন প্রোপার্টি `email` যুক্ত করবে। এখন `/hello` রাউটে রিকোয়েস্ট করলে আউটপুটে দেখা যাবে `email` প্রোপার্টিটি নতুনভাবে যুক্ত হয়েছে।

#### আউটপুট:

```json
{
    "host": "localhost",
    "connection": "keep-alive",
    "email": "uopeople@uopeople.com",
    ...
}
```

---

### ৪. বিদ্যমান হেডার প্রোপার্টি পরিবর্তন (Replace)

কোনো বিদ্যমান হেডার প্রোপার্টির মান পরিবর্তন করতে চাইলে আমরা `replace()` মেথড ব্যবহার করতে পারি। নিচে উদাহরণ দেয়া হলো:

```php
public function handle(Request $request, Closure $next): Response {
    // বিদ্যমান হেডার প্রোপার্টি পরিবর্তন করা হচ্ছে
    $request->headers->replace(['email' => 'newemail@example.com']);
    
    return $next($request);
}
```

এটি `email` নামে হেডার প্রোপার্টির পূর্বের মানকে পরিবর্তন করে `newemail@example.com` হিসেবে সেট করবে।

#### আউটপুট:

```json
{
    "host": "localhost",
    "connection": "keep-alive",
    "email": "newemail@example.com",
    ...
}
```

---

### ৫. হেডার থেকে প্রোপার্টি সরানো (Remove)

কোনো হেডার প্রোপার্টি সরানোর প্রয়োজন হলে `remove()` মেথড ব্যবহার করা হয়। নিচের উদাহরণে দেখানো হয়েছে কিভাবে `email` প্রোপার্টি সরানো হয়:

```php
public function handle(Request $request, Closure $next): Response {
    // রিকোয়েস্ট হেডার থেকে 'email' প্রোপার্টি সরানো হচ্ছে
    $request->headers->remove('email');
    
    return $next($request);
}
```

এটি `email` নামে হেডার প্রোপার্টি সরিয়ে ফেলবে, ফলে হেডারে আর এটি থাকবে না।

#### আউটপুট:

```json
{
    "host": "localhost",
    "connection": "keep-alive",
    ...
}
```

---

### Middleware-এ হেডার ম্যানিপুলেশন উপসংহার

Middleware-এ রিকোয়েস্ট হেডার ম্যানিপুলেশন করা খুবই কার্যকরী, বিশেষ করে যদি আপনার প্রয়োজন হয় কোনো কাস্টম লজিক প্রয়োগ করে হেডার থেকে ডাটা পরিবর্তন বা মুছে ফেলার। Laravel Middleware-এ আপনি নিম্নলিখিত কাজ করতে পারেন:
- **হেডারে নতুন প্রোপার্টি যুক্ত করা**: `$request->headers->add(['key' => 'value'])`
- **হেডারের বিদ্যমান মান পরিবর্তন করা**: `$request->headers->replace(['key' => 'new_value'])`
- **হেডার থেকে প্রোপার্টি সরানো**: `$request->headers->remove('key')`

Laravel-এ Middleware ব্যবহারের মাধ্যমে আপনার অ্যাপ্লিকেশনের সুরক্ষা এবং প্রয়োজনীয় ভ্যালিডেশন সহজেই নিশ্চিত করা যায়।