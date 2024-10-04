### Blade টেমপ্লেটে `switch-case` ডাইরেক্টিভের ব্যবহার

Laravel Blade টেমপ্লেট ইঞ্জিনে `switch-case` লজিকও ব্যবহার করা যায় যা PHP এর `switch-case` এর মতোই কাজ করে। তবে, Blade এর জন্য কিছু নির্দিষ্ট ডাইরেকটিভ সরবরাহ করা হয়েছে, যেমন `@switch`, `@case`, `@break`, `@default`, এবং `@endswitch`। এগুলোর মাধ্যমে আমরা কন্ডিশনাল লজিক আরও সোজাভাবে এবং সুসংগঠিতভাবে পরিচালনা করতে পারি।

#### Blade-এ `switch-case` এর ব্যবহার

`switch-case` ব্যবহার করে কন্ডিশনের ওপর ভিত্তি করে আলাদা আউটপুট রেন্ডার করা যায়। এটি তখন খুবই কার্যকরী যখন আপনার অনেকগুলো কন্ডিশন রয়েছে এবং এগুলোর মধ্যে শুধুমাত্র একটি বা কিছু নির্দিষ্ট শর্ত পূর্ণ হতে পারে।

#### Step 1: Controller Setup

প্রথমে আমরা Controller থেকে Blade ফাইলে ডাটা পাঠাবো। আগের মতোই দুটি নম্বরের যোগফল Blade টেমপ্লেটে পাঠানো হচ্ছে, যা `switch-case` ব্যবহার করে কন্ডিশনালি কন্টেন্ট রেন্ডার করবে।

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

        $data = ['result' => $sum]; // ডাটাকে এসোসিয়েটিভ অ্যারে হিসেবে ভিউতে পাঠানো হচ্ছে
        return view('home', $data); // 'home' Blade ফাইলে ডাটা পাঠানো হচ্ছে
    }
}
```

#### Step 2: Blade ফাইলে `switch-case` কন্ডিশন যুক্ত করা

এখন Blade ফাইলে আমরা `@switch`, `@case`, `@break`, এবং `@default` ডাইরেকটিভ ব্যবহার করে `switch-case` কন্ডিশন তৈরি করবো।

```php
// resources/views/home.blade.php

@switch($result)
    @case(100)
        <h1>Result is hundred</h1>
        @break

    @case(1000)
        <h1>Result is thousand</h1>
        @break

    @case(100000)
        <h1>Result is lakh</h1>
        @break

    @default
        <h1>Result is not in our range</h1>
@endswitch
```

**বিস্তারিত ব্যাখ্যা**:

1. **@switch($result):**
    - `switch` ব্লকটি `$result` ভেরিয়েবলের মান পরীক্ষা করতে শুরু করবে। Blade-এ এটি PHP-এর `switch` এর মতোই কাজ করে।
2. **@case(100):**
    - `$result` এর মান যদি 100 হয়, তাহলে `"Result is hundred"` রেন্ডার করা হবে।
    - `@break` ডাইরেকটিভ ব্যবহার করা হয়েছে, যা PHP-এর `break` এর মতো কাজ করে। এটি স্টেটমেন্টটি থামিয়ে দেয় এবং পরবর্তী কন্ডিশন চেক করা বন্ধ করে।
3. **@case(1000):**

    - `$result` যদি 1000 হয়, তাহলে `"Result is thousand"` রেন্ডার হবে। এখানে একইভাবে `@break` ব্যবহার করা হয়েছে।

4. **@case(100000):**

    - `$result` যদি 100000 হয়, তাহলে `"Result is lakh"` রেন্ডার করা হবে।

5. **@default:**

    - যদি কোন `case` এর সাথে মিলে না যায়, তাহলে `@default` ব্লক কার্যকর হবে। এখানে `"Result is not in our range"` মেসেজ রেন্ডার করা হবে।

6. **@endswitch:**
    - `switch` ব্লকটি শেষ করার জন্য `@endswitch` ব্যবহার করা হয়েছে, যা `switch` স্টেটমেন্টটি সম্পূর্ণ করে।

#### Step 3: Route Configuration

Controller এবং Blade ফাইলের মধ্যে Route সংযোগ করতে হবে। এখানে দুইটি প্যারামিটার পাঠানো হচ্ছে, যেগুলোর যোগফল Blade ফাইলে প্রদর্শন করা হবে।

```php
// routes/web.php

use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;

Route::get('/{num1}/{num2}', [HomeController::class, 'page']);
```

এখন আপনি যখন `http://127.0.0.1:8000/100/0` এই URL টি ব্রাউজারে লিখবেন, তখন `$result` 100 হবে এবং Blade ফাইলে `"Result is hundred"` দেখাবে।

#### `switch-case` ডাইরেক্টিভ ব্যবহারের সুবিধা

1. **বড় সংখ্যক কন্ডিশন:** যখন আপনার অনেকগুলো কন্ডিশন আছে, `switch-case` ব্যবহার করা সহজ এবং কোড ক্লিন রাখে।
2. **সহজ কোড ফ্লো:** `switch-case` এর লজিক অনেক সহজ এবং সংক্ষিপ্ত, যা কোডকে আরও পরিষ্কার রাখে।
3. **ডিফল্ট আউটপুট:** যখন কোন কেসের সাথে ডাটা মিলছে না, তখন `@default` ডাইরেকটিভ ব্যবহার করে একটি সাধারণ আউটপুট দেয়া যায়।

Blade এর `switch-case` ডাইরেক্টিভ আপনার কন্ডিশনাল লজিককে আরও সুসংগঠিত এবং রিডেবল করে।
