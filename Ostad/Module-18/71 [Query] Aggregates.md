### Laravel Query Builder এর Aggregates মেথড

Laravel Query Builder এ বিভিন্ন ধরনের Aggregate মেথড ব্যবহার করে ডাটাবেজ থেকে সম্মিলিত তথ্য পাওয়া যায়। কিছু গুরুত্বপূর্ণ Aggregate মেথড হল `count`, `max`, `min`, `avg`, এবং `sum`। এবার আমরা এই মেথডগুলোর ব্যবহার শিখবো এবং উদাহরণ হিসেবে `products` টেবিলের `price` কলাম ব্যবহার করবো।

### 1. `count()` মেথড

এই মেথড ব্যবহার করে নির্দিষ্ট টেবিলে মোট কতগুলো রো রয়েছে তা গণনা করা যায়। উদাহরণস্বরূপ, `products` টেবিলে কয়টি রো আছে তা বের করতে `count()` মেথড ব্যবহার করতে হবে।

```php
$result = DB::table('products')->count();
```

> **ফলাফল:** এই মেথডটি একটি সংখ্যা প্রদান করবে, যা `products` টেবিলে মোট রেকর্ড সংখ্যা নির্দেশ করবে।

### 2. `max()` মেথড

`max()` মেথড ব্যবহার করে নির্দিষ্ট একটি কলামের সর্বোচ্চ মান বের করা যায়। উদাহরণস্বরূপ, `products` টেবিলের `price` কলামের সর্বোচ্চ মান বের করতে নিচের কোডটি ব্যবহার করা যাবে:

```php
$result = DB::table('products')->max('price');
```

> **ফলাফল:** এই মেথডটি `price` কলামের মধ্যে সর্বোচ্চ মান প্রদান করবে।

### 3. `min()` মেথড

`min()` মেথড ব্যবহার করে নির্দিষ্ট একটি কলামের সর্বনিম্ন মান বের করা যায়। `products` টেবিলের `price` কলামের সর্বনিম্ন মান বের করার জন্য নিচের কোডটি লিখুন:

```php
$result = DB::table('products')->min('price');
```

> **ফলাফল:** এই মেথডটি `price` কলামের মধ্যে সর্বনিম্ন মান প্রদান করবে।

### 4. `avg()` মেথড

`avg()` মেথড ব্যবহার করে নির্দিষ্ট একটি কলামের গড় মান বের করা যায়। উদাহরণস্বরূপ, `price` কলামের গড় মূল্য বের করতে:

```php
$result = DB::table('products')->avg('price');
```

> **ফলাফল:** এই মেথডটি `price` কলামের গড় মান প্রদান করবে।

### 5. `sum()` মেথড

`sum()` মেথড ব্যবহার করে নির্দিষ্ট একটি কলামের সমস্ত মানের যোগফল বের করা যায়। `products` টেবিলের `price` কলামের সমস্ত মানের যোগফল বের করতে নিচের কোডটি ব্যবহার করা যাবে:

```php
$result = DB::table('products')->sum('price');
```

> **ফলাফল:** এই মেথডটি `price` কলামের সমস্ত মানের যোগফল প্রদান করবে।

### উদাহরণস্বরূপ একটি পূর্ণাঙ্গ কোড

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class DemoController extends Controller {
    public function DemoAction() {
        // টেবিলে মোট কতগুলো রো আছে
        $count = DB::table('products')->count();

        // টেবিলের price কলামের সর্বোচ্চ মান
        $maxPrice = DB::table('products')->max('price');

        // টেবিলের price কলামের সর্বনিম্ন মান
        $minPrice = DB::table('products')->min('price');

        // টেবিলের price কলামের গড় মান
        $averagePrice = DB::table('products')->avg('price');

        // টেবিলের price কলামের সমস্ত মানের যোগফল
        $totalPrice = DB::table('products')->sum('price');

        return [
            'Total Rows' => $count,
            'Max Price' => $maxPrice,
            'Min Price' => $minPrice,
            'Average Price' => $averagePrice,
            'Total Price Sum' => $totalPrice,
        ];
    }
}
```

> **পরীক্ষা:** যেহেতু এই ধরনের রেসপন্স সাধারণত JSON ফরম্যাটে থাকে, এটি পরীক্ষা করার জন্য পোস্টম্যান ব্যবহার করা সুবিধাজনক।

---

এবার আমরা শিখবো Aggrigates নিয়ে। লারাভেল Query Builder এর ভেতর বেশ কিছু Aggrigates মেথড আছে যেমন count, max, min, avg, sum. । আ্মরা এবার এগুলোর ব্যবহার শিখি। এটি প্রেকটিস করার জন্য আমরা আমাদের প্রোডাক্ট টেবিলের প্রাইস কলামটি নিচ্ছি। এখানে $result = DB::table('products')->count(); ব্যবহার করলে কয়টি রো আছে তা প্রদর্শন করবে। max বেল করার জন্য কলামের নাম দিতে হবে কোন কলামের মেক্স বের করতে হবে। $result = DB::table('products')->max('price');

```php
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

// It's good to include the base Controller

class DemoController extends Controller {
    public function DemoAction() {
        $result = DB::table('products')->count();
        return $result;
    }
}

```
