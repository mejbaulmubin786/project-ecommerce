### Laravel Blade মাস্টার লেআউট সম্পর্কে

Laravel Blade মাস্টার লেআউট তৈরি করার মাধ্যমে একটি মেইন লেআউট বা টেমপ্লেট একবার তৈরি করে বিভিন্ন পেজে ব্যবহার করা যায়। এর ফলে যেকোনো পেজে কমন অংশ যেমন হেডার, ফুটার, CSS, JS ফাইল সহজেই একবার ডেফাইন করে সব পেজে প্রয়োগ করা যায়। Laravel Blade-এর `@extends` ডাইরেকটিভ ব্যবহার করে যেকোনো পেজকে মেইন লেআউট থেকে এক্সটেন্ড করা হয় এবং `@section` ডাইরেকটিভ ব্যবহার করে নির্দিষ্ট অংশে কনটেন্ট ইনজেক্ট করা হয়।

### Step-by-Step উদাহরণ

#### Step 1: মাস্টার লেআউট তৈরি

প্রথমে আমরা একটি মাস্টার লেআউট তৈরি করব `app.blade.php` নামে। এখানে হেডার, ফুটার এবং অন্যান্য কমন অংশ থাকবে।

```php
// resources/views/Layout/app.blade.php
<!DOCTYPE html>
<html lang="en">
<head>
    <title>@yield('title', 'Default Title')</title>  <!-- ডাইনামিক টাইটেল -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="{{ asset('css/bootstrap/bootstrap.min.css') }}">
</head>
<body>

    <!-- Include the header -->
    @include('Layout.header')

    <!-- Yield content for different pages -->
    <div class="container">
        @yield('content')  <!-- কন্টেন্ট ইঞ্জেক্ট করার জায়গা -->
    </div>

    <!-- Include the footer -->
    @include('Layout.footer')

    <script src="{{ asset('js/bootstrap/bootstrap.bundle.min.js') }}"></script>
</body>
</html>
```

#### Step 2: কমন কম্পোনেন্ট তৈরি (হেডার এবং ফুটার)

**`header.blade.php`**:

```php
// resources/views/Layout/header.blade.php
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">My Website</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
```

**`footer.blade.php`**:

```php
// resources/views/Layout/footer.blade.php
<footer class="py-4 bg-light mt-5">
    <div class="container text-center">
        <p>&copy; 2024 My Website. All rights reserved.</p>
    </div>
</footer>
```

#### Step 3: সাব পেইজ তৈরি এবং মেইন লেআউট এক্সটেন্ড করা

এখন আমরা একটি হোম পেজ তৈরি করব এবং মেইন লেআউট থেকে এক্সটেন্ড করব। পেজে নির্দিষ্ট কনটেন্ট ইঞ্জেক্ট করার জন্য `@section` ব্যবহার করা হবে।

```php
// resources/views/home.blade.php
@extends('Layout.app')  <!-- মেইন লেআউট থেকে এক্সটেন্ড -->

@section('title', 'Home Page')  <!-- ডাইনামিক টাইটেল -->

@section('content')
    <h1>Welcome to the Home Page</h1>
    <p>This is the content of the home page.</p>
@endsection
```

#### Step 4: Routing

Route সেটআপ করতে হবে যাতে ভিউটি রেন্ডার করা যায়:

```php
// routes/web.php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;

Route::get('/', [HomeController::class, 'home']);
```

#### Step 5: Controller

`HomeController`-এ একটি মেথড তৈরি করা হবে যা `home.blade.php` ভিউটি রিটার্ন করবে:

```php
// app/Http/Controllers/HomeController.php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller {
    public function home() {
        return view('home');
    }
}
```

### `@yield` এবং `@section` এর ব্যবহার

-   **`@yield('content')`**: এটি মেইন লেআউটে ব্যবহার করা হয় যেখানে সাব পেজ থেকে কনটেন্ট ইনজেক্ট হবে।
-   **`@section('content')`**: সাব পেজে ব্যবহার করা হয় এবং এই কনটেন্ট `@yield`-এ এসে বসবে।

### Example Breakdown:

-   **মেইন লেআউট (`app.blade.php`)**: এখানে কমন অংশ যেমন হেডার, ফুটার এবং অন্যান্য কমন সিএসএস/জাভাস্ক্রিপ্ট ফাইল যুক্ত করা থাকে।
-   **সাব পেজ (`home.blade.php`)**: এই পেজটি `app.blade.php` লেআউটকে এক্সটেন্ড করে এবং নির্দিষ্ট কনটেন্ট `@section` ডাইরেকটিভের মাধ্যমে মেইন লেআউটের `@yield`-এ ইনজেক্ট করে।

### উপসংহার

Laravel Blade মাস্টার লেআউট ব্যবহার করে কমন অংশগুলিকে একবার ডেফাইন করে বিভিন্ন পেজে এক্সটেন্ড করা যায়। এতে কোড রি-ইউজেবল হয় এবং সব পেজে একই ধরনের লেআউট মেইনটেইন করা সম্ভব হয়।
