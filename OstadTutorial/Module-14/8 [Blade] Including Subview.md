### Laravel Blade টেমপ্লেট ইঞ্জিনে সাব ভিউ বা কম্পোনেন্ট ব্যবহারের নিয়ম

Laravel Blade টেমপ্লেট ইঞ্জিনে সাব ভিউ বা কম্পোনেন্ট ব্যবহারের মাধ্যমে আমরা বিভিন্ন অংশকে ছোট ছোট অংশে ভাগ করে রি-ইউজেবল কম্পোনেন্ট তৈরি করতে পারি। এভাবে একটি ওয়েব পেজের বিভিন্ন অংশ যেমন হেডার, ফুটার, হিরো সেকশন ইত্যাদি আলাদা আলাদা ফাইলে ভাগ করে তা মূল ভিউতে যুক্ত করা যায়। এতে কোড আরও সংগঠিত এবং মেইনটেইনেবল হয়।

#### সাব ভিউ বা কম্পোনেন্টের ধারণা

একটি ওয়েব পেজের বিভিন্ন অংশ যেমন হেডার, ফুটার, হিরো সেকশন প্রভৃতিকে আলাদা সাব ভিউ (partial views) হিসেবে তৈরি করা হয়, এবং মূল Blade টেমপ্লেটে সেগুলোকে `@include` ডাইরেকটিভ দিয়ে ইনক্লুড করা হয়। এর মাধ্যমে আমরা যেকোনো জায়গায় ঐ ভিউগুলোকে ব্যবহার করতে পারি এবং ভিউ পুনঃব্যবহারযোগ্য (reusable) হয়।

#### উদাহরণ: হেডার, হিরো, টিম এবং ফুটার যুক্ত করে একটি পেজ তৈরি

##### Step 1: Component তৈরি করা

প্রথমে আমরা `resources/views` ফোল্ডারের মধ্যে একটি `component` নামে একটি ফোল্ডার তৈরি করব, যেখানে আমাদের সব সাব ভিউ ফাইলগুলো থাকবে। যেমন:

-   `header.blade.php`
-   `hero.blade.php`
-   `team.blade.php`
-   `footer.blade.php`

##### Step 2: Component ফাইলগুলোর কন্টেন্ট

1. **`header.blade.php`:**

    ```php
    <!-- Header section -->
    <h1>I am Header</h1>
    ```

2. **`hero.blade.php`:**

    ```php
    <!-- Hero section -->
    <h1>I am Hero</h1>
    ```

3. **`team.blade.php`:**

    ```php
    <!-- Team section -->
    <h1>I am Team</h1>
    ```

4. **`footer.blade.php`:**
    ```php
    <!-- Footer section -->
    <h1>I am Footer</h1>
    ```

##### Step 3: মূল Blade টেমপ্লেটে সাব ভিউগুলো ইনক্লুড করা

এবার আমরা `home.blade.php` নামের মূল ভিউতে এই সব সাব ভিউগুলোকে ইনক্লুড করব:

```php
// resources/views/home.blade.php

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Laravel App with Components</title>
</head>
<body>

    <!-- Including Header -->
    @include('component.header')

    <!-- Including Hero Section -->
    @include('component.hero')

    <!-- Including Team Section -->
    @include('component.team')

    <!-- Including Footer -->
    @include('component.footer')

</body>
</html>
```

##### Step 4: Route সেটআপ

Blade টেমপ্লেটটি রেন্ডার করার জন্য Route কনফিগার করতে হবে:

```php
// routes/web.php

use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'page']);
```

##### Step 5: Controller

`HomeController` থেকে ভিউ রিটার্ন করার জন্য `page()` মেথডটি ব্যবহার করা হয়েছে:

```php
// app/Http/Controllers/HomeController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller {
    public function page(Request $request) {
        return view('home');  // 'home' ভিউ ফাইল রেন্ডার করা হচ্ছে
    }
}
```

### সাব ভিউ ব্যবহারের সুবিধা:

1. **রি-ইউজেবিলিটি:** একই কম্পোনেন্টকে বিভিন্ন পেজে সহজেই ব্যবহার করা যায়। যেমন, হেডার বা ফুটারকে বিভিন্ন পেজে পুনরায় ব্যবহার করা সম্ভব।
2. **কোড অর্গানাইজেশন:** কোডকে বিভিন্ন ছোট ছোট অংশে ভাগ করে সহজে মেইনটেইন করা যায়। একক বড় ভিউ ফাইলে কাজ করার চেয়ে বিভিন্ন সাব ভিউ ব্যবহার করলে কোড আরও মডুলার ও পরিষ্কার হয়।

3. **সহজ পরিবর্তন:** সাব ভিউ ব্যবহারের ফলে কোনো নির্দিষ্ট অংশে পরিবর্তন করতে হলে শুধু সেই কম্পোনেন্টে পরিবর্তন আনলেই হবে। এতে পুরো পেজে পরিবর্তন আনতে হয় না।

4. **প্রদর্শনের সমতা:** বিভিন্ন পেজের মধ্যে ভিউয়ে কনসিস্টেন্সি বজায় রাখা সহজ হয়। যেমন, হেডার বা ফুটার সব পেজে একই রকম থাকবে।

এইভাবে Laravel Blade টেমপ্লেট ইঞ্জিনে সাব ভিউ বা কম্পোনেন্ট ব্যবহারের মাধ্যমে একটি বড় পেজকে বিভিন্ন অংশে ভাগ করে তা ইনক্লুড করা যায়, যা কোডকে মডুলার এবং পুনঃব্যবহারযোগ্য করে তোলে।
