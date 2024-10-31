`Select` ক্লজ ব্যবহার করে আমরা Laravel Query Builder-এ নির্দিষ্ট কলামগুলো সিলেক্ট করতে পারি, যাতে টেবিলে যত কলামই থাকুক, আমাদের প্রয়োজনীয় কলামগুলোই শুধু সিলেক্ট হবে। এভাবে ডাটাবেজ থেকে অপ্রয়োজনীয় ডাটা না এনে কোয়েরি অপটিমাইজ করা যায়।

Laravel Query Builder এর মাধ্যমে `select` এবং `distinct` এর ব্যবহার কিভাবে করা হয়, তা নিচে বিস্তারিত দেখানো হলো:

### `Select` ক্লজের ব্যবহার:

ধরুন, আমরা `products` টেবিল থেকে শুধু `title` এবং `price` কলাম সিলেক্ট করতে চাই। এর জন্য `select` মেথডে নির্দিষ্ট কলামগুলোর নাম উল্লেখ করতে হবে। উদাহরণস্বরূপ:

```php
public function DemoAction() {
    $products = DB::table('products')->select('title', 'price')->get();
    return $products;
}
```

উপরের কোডটি এক্সিকিউট করলে `products` টেবিল থেকে শুধুমাত্র `title` এবং `price` কলামের ডাটাই ফেচ হবে। অন্য কোনো কলাম কোয়েরিতে আসবে না।

### `Distinct` মেথডের ব্যবহার:

যদি আমরা একই কলামের বিভিন্ন রেকর্ডের মধ্যে শুধুমাত্র ইউনিক বা অনন্য মানগুলো সিলেক্ট করতে চাই, তবে `distinct` মেথড ব্যবহার করতে হবে। এটি মূলত ডুপ্লিকেট ভ্যালুগুলো বাদ দিয়ে শুধুমাত্র ইউনিক ভ্যালুগুলোকে রিটার্ন করবে।

ধরুন, আমরা `products` টেবিল থেকে ইউনিক `title` এবং `price` ভ্যালুগুলো পেতে চাই:

```php
public function DemoAction() {
    $products = DB::table('products')->select('title', 'price')->distinct()->get();
    return $products;
}
```

এখানে `distinct()` মেথড ব্যবহারের ফলে, একই `title` এবং `price` এর রেকর্ডগুলো একাধিকবার সিলেক্ট হবে না; বরং, শুধু ইউনিক মানগুলো রিটার্ন হবে।

### উদাহরণ সহ সংক্ষিপ্ত বিবরণ:

এই কোডটুকু সিলেক্ট করা, ফিল্টার করা এবং ইউনিক মান রিটার্ন করার বিভিন্ন পদ্ধতি দেখায়। আমরা যখন শুধুমাত্র প্রয়োজনীয় কলাম সিলেক্ট করি, তখন ডাটাবেজ কোয়েরির সময় কমে যায় এবং অ্যাপ্লিকেশন আরও দ্রুততর হয়।

**পূর্ণাঙ্গ কোড উদাহরণ:**

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class DemoController extends Controller {
    public function DemoAction() {
        // `title` এবং `price` কলামগুলো সিলেক্ট করা
        $products = DB::table('products')->select('title', 'price')->distinct()->get();

        return $products;
    }
}
```

এই কোডটি চালানোর ফলে আপনি `products` টেবিলের ইউনিক `title` এবং `price` কলামগুলোর ডাটা রিসিভ করবেন।

**উপসংহার:**
Laravel Query Builder এর `select` এবং `distinct` মেথড ব্যবহার করে নির্দিষ্ট কলাম ও ইউনিক ডাটা সিলেক্ট করা যায়, যা কোয়েরি অপটিমাইজেশন ও কার্যকারিতায় সহায়ক।
