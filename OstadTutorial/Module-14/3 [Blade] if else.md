### Blade টেমপ্লেটে `if-else` কন্ডিশন নিয়ে কাজ

Laravel Blade টেমপ্লেট ইঞ্জিনে কন্ডিশনাল স্টেটমেন্ট (`if`, `else if`, `else`) ব্যবহারের জন্য ডাইরেক্টিভ সরবরাহ করা হয়েছে, যেমন `@if`, `@elseif`, `@else`, এবং `@endif`। এগুলোর মাধ্যমে আমরা ভিউতে নির্দিষ্ট শর্তের উপর ভিত্তি করে কন্টেন্ট ডাইনামিক্যালি রেন্ডার করতে পারি।

#### `if-else` Blade ডাইরেকটিভের ব্যবহার

Blade-এ কন্ডিশনাল ডাইরেকটিভগুলো অনেকটা PHP-এর `if` স্টেটমেন্টের মতো কাজ করে। যেহেতু Blade টেমপ্লেট HTML, CSS, এবং Blade সিনট্যাক্সকে মিলিয়ে কাজ করে, তাই এটি ভিউ ফাইলগুলোকে সহজে মেইনটেইন এবং বুঝতে সাহায্য করে।

এখানে একটি উদাহরণ দেখানো হলো যেখানে Controller থেকে ডাটা আসছে এবং সেই ডাটার ওপর ভিত্তি করে Blade টেমপ্লেটে বিভিন্ন কন্ডিশন রেন্ডার করা হচ্ছে।

#### Step 1: Controller Setup

প্রথমেই আমরা `HomeController` তৈরি করবো এবং সেই Controller থেকে ডাটা Blade ফাইলে পাঠাবো। এখানে দুটি নম্বরের যোগফল Blade ফাইলে পাঠানো হচ্ছে।

```php
// app/Http/Controllers/HomeController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller {
    function page(Request $request) {
        $num1 = $request->num1;
        $num2 = $request->num2;
        $sum = $num1 + $num2; // দুইটি নম্বরের যোগফল

        $data = ['result' => $sum]; // ডাটাকে এসোসিয়েটিভ অ্যারে হিসেবে ভিউতে পাঠানো
        return view('home', $data); // 'home' Blade ফাইলে পাঠানো হচ্ছে
    }
}
```

#### Step 2: Blade ফাইলে কন্ডিশনাল স্টেটমেন্ট

এবার আমরা Blade ফাইলে `if-else` কন্ডিশন ব্যবহার করবো। এখানে `$result` এর মানের ভিত্তিতে বিভিন্ন মেসেজ রেন্ডার করা হবে।

```php
// resources/views/home.blade.php

   @if($result == 100)
       <h1>Result is hundred</h1>
   @elseif ($result == 1000)
       <h1>Result is thousand</h1>
   @elseif ($result == 100000)
       <h1>Result is lakh</h1>
   @else
       <h1>Result is not in our range</h1>
   @endif
```

**বিস্তারিত ব্যাখ্যা**:

1. **@if($result == 100):**
   যদি `$result` এর মান 100 হয়, তাহলে এই শর্তটি সত্য হবে এবং `"Result is hundred"` টেক্সটটি রেন্ডার হবে।
2. **@elseif($result == 1000):**
   যদি `$result` এর মান 1000 হয়, তাহলে `"Result is thousand"` রেন্ডার হবে।

3. **@elseif($result == 100000):**
   `$result` যদি 100000 হয়, তাহলে `"Result is lakh"` রেন্ডার হবে।

4. **@else:**
   উপরের কোন শর্তই যদি সত্য না হয়, তাহলে `"Result is not in our range"` রেন্ডার হবে।

5. **@endif:**
   `if-else` ব্লক শেষ করার জন্য `@endif` ব্যবহার করা হয়। এটি PHP এর `endif` স্টেটমেন্টের মতো কাজ করে।

#### Step 3: Route Configuration

Blade ফাইল এবং Controller ফাংশনকে একটি Route এর সাথে যুক্ত করতে হবে। এখানে `num1` এবং `num2` নামের দুটি ভ্যারিয়েবল Route প্যারামিটার হিসেবে পাঠানো হচ্ছে।

```php
// routes/web.php

use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;

Route::get('/{num1}/{num2}', [HomeController::class, 'page']);
```

এখন আপনি `http://127.0.0.1:8000/100/0` এর মতো URL এ অ্যাক্সেস করলে, Controller থেকে `$result` হিসাবে `100` পাঠানো হবে এবং Blade ফাইলের মাধ্যমে `"Result is hundred"` মেসেজ রেন্ডার হবে।

#### Laravel Blade এর `if-else` এর সুবিধা

-   **ডাইনামিক কন্টেন্ট:** Blade ইঞ্জিনের সাহায্যে ডাইনামিক ডাটা সহজে রেন্ডার করা যায়।
-   **সাধারণ সিনট্যাক্স:** Blade ডাইরেকটিভগুলো PHP এর মতোই কিন্তু অনেক সহজ এবং ক্লিন কোড লেখা যায়।
-   **কন্ডিশনাল লজিক:** ডাটার বিভিন্ন অবস্থা অনুযায়ী HTML রেন্ডার করতে পারা।

Blade টেমপ্লেট ইঞ্জিন ব্যবহার করে আপনি সহজেই বড় সাইটের জন্য ডাইনামিক ভিউ তৈরি করতে পারবেন এবং লজিকগুলোকে ভিউ থেকে সেগ্রেগেট করতে পারবেন। Laravel এ Blade এমনভাবে ডিজাইন করা হয়েছে যাতে এটি দ্রুত এবং সহজে ব্যবহৃত হতে পারে।
