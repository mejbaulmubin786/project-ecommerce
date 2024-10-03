## Laravel Middleware: গ্লোবাল লেভেলে Middleware প্রয়োগ

আমরা এর আগে শিখেছি কিভাবে নির্দিষ্ট রাউটে অথবা রাউট গ্রুপে `Middleware` প্রয়োগ করতে হয়। এখন আমরা দেখবো কীভাবে একটি `Middleware`-কে পুরো অ্যাপ্লিকেশন তথা সকল রাউটে গ্লোবালি প্রয়োগ করা যায়। 

### Middleware এর কাজ এবং Laravel-এর রাউটিং প্রসঙ্গ

Laravel-এ `Middleware` মূলত ফিল্টার হিসাবে কাজ করে, যা রিকোয়েস্ট এবং রেসপন্সের মাঝে অবস্থান করে। আমরা চাইতে পারি যে নির্দিষ্ট শর্ত অনুযায়ী একটি Middleware কার্যকর হোক, যেমন:
- ইউজার অথেনটিকেশন
- সুরক্ষা যাচাই 
- ভ্যালিডেশন বা ডাটা যাচাই 
- নির্দিষ্ট কিছু প্যারামিটার পূরণ না হলে রিকোয়েস্ট ব্লক করা

Laravel-এ সাধারণত Middleware গুলিকে রাউট স্তরে প্রয়োগ করা হয়, অর্থাৎ আপনি নির্দিষ্ট রাউট বা রাউট গ্রুপে Middleware যুক্ত করেন, যেমন আগের উদাহরণে করা হয়েছে। তবে আপনি যদি চান যে আপনার Middleware গ্লোবালি কাজ করুক অর্থাৎ পুরো অ্যাপ্লিকেশনের সব রাউটেই এটি প্রয়োগ হোক, তাহলে Middleware কে Laravel-এর কোর সিস্টেমে সংযুক্ত করতে হবে।

---

### Laravel-এর Kernel.php ফাইল

Laravel-এর `app/Http/Kernel.php` ফাইলটি হলো এমন একটি ফাইল, যেখানে সব Middleware সম্পর্কিত সেটিংস এবং কনফিগারেশন থাকে। এই ফাইলের মাধ্যমে Laravel সিস্টেমে গ্লোবালি Middleware নিয়ন্ত্রণ করা হয়। এখানে `web` এবং `api` নামে দুইটি প্রোপার্টি থাকে, যেগুলো অ্যাপ্লিকেশনের বিভিন্ন অংশে Middleware-এর ব্যবহারের নিয়ম নির্ধারণ করে। 

#### Kernel.php ফাইলের কাঠামো:
`Kernel.php` ফাইলে মূলত তিনটি গুরুত্বপূর্ণ সেকশন থাকে যেখানে Middleware নিবন্ধিত থাকে:
1. **$middleware**: এখানে গ্লোবালি সব Middleware থাকে, যা অ্যাপ্লিকেশনের সব রাউট এবং সব URI-তে প্রয়োগ হয়।
2. **$middlewareGroups**: এই সেকশনটি দুটি ভাগে বিভক্ত—`web` এবং `api`—এবং এখানে Middleware-এর গ্রুপ থাকে যা নির্দিষ্ট URI গ্রুপে প্রয়োগ হয়।
3. **$routeMiddleware** (এখন `$middlewareAliases` নামে পরিচিত): এখানে নিবন্ধিত Middleware গুলিকে আমরা নির্দিষ্ট রাউটে বা রাউট গ্রুপে আলাদাভাবে ব্যবহার করতে পারি।

---

### গ্লোবাল Middleware প্রয়োগ করার ধাপ

#### ১. `CheckRequestDetails` Middleware তৈরি করা

Middleware তৈরি করতে হলে আমরা Laravel-এর `artisan` কমান্ড ব্যবহার করতে পারি:

```bash
php artisan make:middleware CheckRequestDetails
```

এটি `app/Http/Middleware` ডিরেক্টরির মধ্যে `CheckRequestDetails` নামে একটি Middleware ফাইল তৈরি করবে। এখানে আমরা যেকোনো লজিক লিখতে পারি, যা রিকোয়েস্টের আগে বা পরে কার্যকর হবে।

```php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRequestDetails {

    public function handle(Request $request, Closure $next): Response {

        // রিকোয়েস্ট থেকে key প্যারামিটার বের করে চেক করা হচ্ছে
        $key = $request->key;

        // যদি key 123 হয়, তাহলে রিকোয়েস্টটি প্রসেস হবে
        if ($key == "123") {
            return $next($request);
        } else {
            // না হলে unauthorized রেসপন্স পাঠানো হবে
            return response()->json("unauthorized", 401);
        }
    }
}
```
উপরের উদাহরণে, আমরা `CheckRequestDetails` Middleware তৈরি করেছি, যা রিকোয়েস্ট থেকে `key` প্যারামিটার চেক করবে এবং যদি এর মান "123" না হয়, তাহলে রিকোয়েস্ট ব্লক করে 401 Unauthorized রেসপন্স পাঠাবে।

#### ২. Middleware গ্লোবালি প্রয়োগ করা

এখন আমাদের লক্ষ্য এই Middleware-কে পুরো অ্যাপ্লিকেশনে প্রয়োগ করা। এজন্য `Kernel.php` ফাইলে যেতে হবে এবং সেখানের `web` গ্রুপের মধ্যে আমাদের Middleware যুক্ত করতে হবে।

```php
protected $middlewareGroups = [
    'web' => [
        // নতুন যুক্ত করা Middleware
        \App\Http\Middleware\CheckRequestDetails::class,

        \App\Http\Middleware\EncryptCookies::class,
        \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
        \Illuminate\Session\Middleware\StartSession::class,
        \Illuminate\View\Middleware\ShareErrorsFromSession::class,
        \Illuminate\Routing\Middleware\SubstituteBindings::class,
    ],
];
```
উপরের কোডে, আমরা `web` গ্রুপে `CheckRequestDetails` Middleware যুক্ত করেছি। এর মানে এখন থেকে `web.php`-তে যতগুলো রাউট থাকবে, সবগুলোর উপর এই Middleware কাজ করবে। 

#### ৩. Laravel-এর রাউট কনফিগারেশন
এখন `web.php` ফাইলে আমরা কোনো Middleware যুক্ত না করেই রাউট তৈরি করতে পারি, কারণ `Kernel.php`-এর মাধ্যমে গ্লোবালি Middleware কাজ করছে।

```php
use App\Http\Controllers\DemoController;
use Illuminate\Support\Facades\Route;

Route::get('/hello1/{key}', [DemoController::class, 'DemoAction1']);
Route::get('/hello2/{key}', [DemoController::class, 'DemoAction2']);
Route::get('/hello3/{key}', [DemoController::class, 'DemoAction3']);
Route::get('/hello4/{key}', [DemoController::class, 'DemoAction4']);
Route::get('/hello5/{key}', [DemoController::class, 'DemoAction5']);
```
এখানে, আমরা রাউট তৈরি করেছি তবে `middleware()` ফাংশন ব্যবহার করিনি। কারণ গ্লোবালি আমরা Middleware ইতিমধ্যেই সংযুক্ত করেছি।

#### ৪. কন্ট্রোলার লজিক:
রাউট গুলিতে নির্দিষ্ট কন্ট্রোলার মেথড থাকবে, যেমন:

```php
namespace App\Http\Controllers;

class DemoController extends Controller {

    function DemoAction1() {
        return "Hello1";
    }

    function DemoAction2() {
        return "Hello2";
    }

    function DemoAction3() {
        return "Hello3";
    }

    function DemoAction4() {
        return "Hello4";
    }

    function DemoAction5() {
        return "Hello5";
    }
}
```

### Middleware কিভাবে কাজ করে?

- যখন `/hello1/{key}` এর মতো কোনো রাউটে রিকোয়েস্ট করা হবে, তখন Laravel প্রথমে `CheckRequestDetails` Middleware-টি চেক করবে। 
- যদি `key` প্যারামিটার "123" হয়, তাহলে রিকোয়েস্ট কন্ট্রোলারে পৌঁছাবে এবং "Hello1" রেসপন্স পাওয়া যাবে।
- যদি `key` প্যারামিটার ভুল হয়, তবে 401 Unauthorized রেসপন্স পাঠানো হবে।

---

### গ্লোবাল Middleware এর সুবিধা:
1. **সহজ নিয়ন্ত্রণ**: একবার Middleware গ্লোবালি যুক্ত করলে নতুন রাউট যুক্ত হলেও Middleware স্বয়ংক্রিয়ভাবে প্রয়োগ হবে।
2. **কোড পুনরাবৃত্তি কমানো**: প্রতিটি রাউটে আলাদাভাবে Middleware যুক্ত করার প্রয়োজন নেই।
3. **সেন্ট্রালাইজড লজিক**: Laravel অ্যাপ্লিকেশনের সকল রাউটে একই নিয়ম বা শর্ত কার্যকর করতে Middleware গ্লোবাল স্তরে ব্যবহার করা খুবই সুবিধাজনক।

---

এইভাবে Laravel-এ একটি Middleware গ্লোবাল স্তরে যুক্ত করা হয় এবং পুরো অ্যাপ্লিকেশনে এটি প্রয়োগ করা যায়।