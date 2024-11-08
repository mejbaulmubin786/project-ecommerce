আমরা একটু আগে যেমন দেখেছি

```php
DB::table('brands')->insert([
    'brandName' => 'New Brand',
    'brandImg' => 'new_brand.jpg',
]);
```

এভাবে ডাটা নেওয়া নিশ্চয় আমরা সরাসরি এভাবে ডাটা ইনসার্ট করবো না। আমরা সাধারণত ইউজার থেকে ডেটা নিয়ে তারপর ইনপুট করবো। এর জন্য আমরা আমাদের DemoController এ কিছু পরিবর্তন করে নি। আমরা যদি JSON বডি দিয়ে ডাটা পাস করি তবে মানে আমরা রিকোয়েস্ট বডি দিয়ে পাস করি তবে ডাটা গুলো আগে পিক করতে হবে।

```php
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

// It's good to include the base Controller

class DemoController extends Controller {
    function DemoAction(Request $request) {

        $result = DB::table('brands')->insert($request->input()); // আমরা যদি জেসন বডি দিয়ে ডাটা পোস্ট করি তবে আমরা অবশ্যই insert মেথড ব্যবহার করবো।

        return $result;
    }
}

```

DemoController

Route::post('/', [DemoController::class, 'DemoAction']);

$request->input() এর জন্য পুরো ইনপুট টাই আমাদের চলে আসবে আমরা এখানে পোস্টম্যান ব্যবাহার করি এবং জেসন ডাটা পাঠাই।
{
"brandName":"Name From postman 2",
"brandImg": "Img From postman 2"
}
