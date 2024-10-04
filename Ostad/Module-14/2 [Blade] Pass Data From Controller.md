# Laravel Controller থেকে Blade ভিউতে ডাটা পাঠানো: বিস্তারিত আলোচনা

Laravel Framework-এ ডাটা পাস করার জন্য Controller থেকে Blade টেমপ্লেটে ডাইনামিক ভেরিয়েবল পাঠানো একটি গুরুত্বপূর্ণ কনসেপ্ট। Laravel এ Controller ভিউকে ডাইনামিক ডেটা পাঠাতে view() ফাংশন ব্যবহার করা হয়। সাধারণত, আমরা এসোসিয়েটিভ অ্যারে (Associative Array) ব্যবহার করে ডাটা পাস করি, যেখানে কী ভ্যালু পেয়ার হিসেবে ডাটা পাঠানো হয়। Laravel Blade ইঞ্জিন ডাটাগুলোকে সহজেই ভিউতে রেন্ডার করে।

## Controller থেকে ভিউতে ডাটা পাঠানো

Laravel Controller এর মাধ্যমে আমরা যে ডাটা পাস করি, তা Blade টেমপ্লেটের ভেতরে ভেরিয়েবলের আকারে পৌঁছে যায়। এই ডাটা ব্যবহার করে আমরা ভিউতে ডাইনামিক কন্টেন্ট রেন্ডার করতে পারি।

নিচে একটি উদাহরণ দেখানো হলো, যেখানে একটি সাধারণ এসোসিয়েটিভ অ্যারের ডাটা Controller থেকে Blade টেমপ্লেটে পাঠানো হচ্ছে এবং Blade টেমপ্লেটে সেই ডাটা রেন্ডার করা হচ্ছে।

## উদাহরণ ১: এসোসিয়েটিভ অ্যারে ডাটা পাঠানো

প্রথমে আমরা একটি Controller তৈরি করেছি, যেখানে ডাটাকে এসোসিয়েটিভ অ্যারের মাধ্যমে Blade টেমপ্লেটে পাঠানো হয়েছে:

```php
// app/Http/Controllers/HomeController.php

namespace App\Http\Controllers;

class HomeController extends Controller {
    function page() {
        // Associative array data being passed to the view
        $data = ['msg' => 'This is my message'];

        // Passing the data to the 'home' Blade template
        return view('home', $data);
    }
}
```

এখানে $data নামক একটি অ্যারে তৈরি করা হয়েছে, যার মধ্যে একটি কী 'msg' এবং এর ভ্যালু 'This is my message' আছে। এই অ্যারে Blade টেমপ্লেটে পাস করা হয়েছে view('home', $data) এর মাধ্যমে। Blade টেমপ্লেটে 'msg' কী Blade ভেরিয়েবল হয়ে যাবে এবং সহজে অ্যাক্সেস করা যাবে।

## Blade টেমপ্লেট

Blade ফাইলটি খুব সহজভাবে এই ডাটাকে রিসিভ করবে এবং ডাইনামিক কন্টেন্ট রেন্ডার করবে। ডাটাকে প্রদর্শনের জন্য Blade এর সিনট্যাক্স হলো {{ $variable }}।

```php
// resources/views/home.blade.php

<h1>{{ $msg }}</h1>
```

এখানে, আমরা $msg ভেরিয়েবলকে রেন্ডার করছি, যা Controller থেকে পাঠানো হয়েছিল। ফলাফল হবে:

```css
<h1>This is my message</h1>

```

Blade এ ডাইনামিক অপারেশন
Blade শুধুমাত্র ডাটা রেন্ডারিং ছাড়াও, সহজ গণনা বা লজিক্যাল অপারেশনও করতে পারে। উদাহরণস্বরূপ:

```php
// resources/views/home.blade.php

<h1>{{ 2 + 2 }}</h1>
```

এই ক্ষেত্রে, Blade ২+২ গণনা করবে এবং ফলাফল 4 রেন্ডার করবে।

## উদাহরণ ২: Route Parameter থেকে ডাটা পাস

Laravel Route Parameter ব্যবহার করে আমরা ডাইনামিক প্যারামিটার পাঠাতে পারি এবং সেই প্যারামিটারগুলোর উপর ভিত্তি করে কিছু ডাইনামিক অপারেশন করাতে পারি। ধরুন, আমরা দুটি সংখ্যা Route এর মাধ্যমে পাঠাতে চাই এবং তাদের যোগফল Blade টেমপ্লেটে প্রদর্শন করাতে চাই।

```php
// routes/web.php

use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;

// Route with two parameters: num1 and num2
Route::get('/{num1}/{num2}', [HomeController::class, 'page']);

```

এখানে Route এ {num1} এবং {num2} নামক দুটি প্যারামিটার পাঠানো হয়েছে। এগুলো Controller এ Request অবজেক্টের মাধ্যমে ধরতে হবে।

## Controller এর মাধ্যমে প্যারামিটার হ্যান্ডেলিং

```php
// app/Http/Controllers/HomeController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller {
    function page(Request $request) {
        // Retrieving the route parameters
        $num1 = $request->num1;
        $num2 = $request->num2;

        // Adding the two numbers
        $sum = $num1 + $num2;

        // Passing the result to the Blade view
        $data = ['result' => $sum];
        return view('home', $data);
    }
}

```

এখানে, $request->num1 এবং $request->num2 ব্যবহার করে Route এর প্যারামিটারগুলোকে এক্সেস করা হয়েছে এবং তাদের যোগফল Blade টেমপ্লেটে পাঠানো হয়েছে। $data অ্যারে হিসেবে তৈরি করা হয়েছে, যেখানে 'result' নামক কী এবং এর মান sum Blade টেমপ্লেটে পাঠানো হয়েছে।

## Blade টেমপ্লেটে যোগফল রেন্ডার

```php
// resources/views/home.blade.php

<h1>The sum is: {{ $result }}</h1>

```

এখানে $result Blade ভেরিয়েবল হিসেবে ব্যবহার করা হয়েছে। এটি Controller থেকে যোগফল হিসেবে পাঠানো হয়েছিল, যা Blade টেমপ্লেটে রেন্ডার হবে।

## Route এর মাধ্যমে URL এ পাঠানো হবে

এখন যদি আপনি URL এ /5/10 পাঠান, তখন Controller থেকে এই দুই সংখ্যার যোগফল Blade টেমপ্লেটে পাঠানো হবে এবং আপনি দেখতে পাবেন:

```
The sum is: 15
```

## Blade এ প্যারামিটার এবং ভেরিয়েবল নিয়ে কাজ করার সুবিধা

সহজ ডাটা পাসিং: Controller থেকে সহজেই এসোসিয়েটিভ অ্যারের মাধ্যমে ডাটা Blade টেমপ্লেটে পাঠানো যায়। Laravel এই পদ্ধতিটি অত্যন্ত সহজ ও ব্যবহার
