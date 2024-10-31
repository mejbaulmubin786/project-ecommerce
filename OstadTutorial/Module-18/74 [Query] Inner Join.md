**ইনার জয়েন (Inner Join)** একটি সাধারণ জয়েন অপারেশন, যেখানে শুধুমাত্র সেসব রেকর্ড রিটার্ন হয়, যেগুলো উভয় টেবিলের মধ্যে ম্যাচ করে। এটি ডেটাবেজে সবচেয়ে বেশি ব্যবহৃত জয়েনগুলোর একটি।

ধরা যাক, আমাদের তিনটি টেবিল আছে: `products`, `categories`, এবং `brands`। আমরা প্রতিটি পণ্যের সাথে তার ক্যাটাগরি এবং ব্র্যান্ড তথ্য দেখতে চাই। সেজন্য, `products` টেবিলের `category_id` এবং `brand_id` কলামগুলোর সাথে `categories` এবং `brands` টেবিলের `id` কলামের সম্পর্ক ব্যবহার করব।

### ইনার জয়েনের উদাহরণ কোড

```php
use Illuminate\Support\Facades\DB;

$productsWithCategories = DB::table('products')
    ->join('categories', 'products.category_id', '=', 'categories.id')
    ->join('brands', 'products.brand_id', '=', 'brands.id')
    ->select('products.title', 'categories.categoryName', 'brands.brandName', 'products.price', 'products.star')
    ->get();

foreach ($productsWithCategories as $product) {
    echo $product->title . ' - ' . $product->categoryName . ' - ' . $product->brandName . ' - ' . $product->price . ' - ' . $product->star . "\n";
}
```

### কোডের বিশ্লেষণ

1. **DB Facade ব্যবহার**:

   ```php
   use Illuminate\Support\Facades\DB;
   ```

   Laravel এ `DB` ফেসেড ডেটাবেজের সাথে কাজ করার জন্য ব্যবহার করা হয়। এর মাধ্যমে আমরা বিভিন্ন ধরনের কুয়েরি চালাতে পারি। এখানে আমরা `products`, `categories`, এবং `brands` টেবিলের উপর জয়েন কুয়েরি চালাচ্ছি।

2. **join() মেথড**:

   ```php
   ->join('categories', 'products.category_id', '=', 'categories.id')
   ->join('brands', 'products.brand_id', '=', 'brands.id')
   ```

   এখানে, `join` মেথডটি ব্যবহার করে আমরা `products` টেবিলের `category_id` এবং `brand_id` কলামগুলোকে `categories` এবং `brands` টেবিলের `id` কলামের সাথে যুক্ত করেছি। এই `join` কুয়েরির মাধ্যমে শুধুমাত্র সেসব রেকর্ড রিটার্ন হবে, যেগুলো তিনটি টেবিলে মিল পাওয়া যায়।

3. **select() মেথড**:

   ```php
   ->select('products.title', 'categories.categoryName', 'brands.brandName', 'products.price', 'products.star')
   ```

   `select` মেথডটি নির্দিষ্ট কলামগুলো সিলেক্ট করার জন্য ব্যবহৃত হয়। এখানে আমরা পণ্যের শিরোনাম (`title`), ক্যাটাগরির নাম (`categoryName`), ব্র্যান্ডের নাম (`brandName`), মূল্য (`price`), এবং রেটিং (`star`) নির্বাচন করেছি।

4. **get() মেথড**:

   ```php
   ->get();
   ```

   `get` মেথডটি কুয়েরি চালিয়ে সব রেকর্ড রিটার্ন করে। এটি `Collection` আকারে ডেটা রিটার্ন করে।

5. **foreach লুপের মাধ্যমে ডেটা প্রদর্শন**:
   ```php
   foreach ($productsWithCategories as $product) {
       echo $product->title . ' - ' . $product->categoryName . ' - ' . $product->brandName . ' - ' . $product->price . ' - ' . $product->star . "\n";
   }
   ```
   এখানে আমরা `foreach` লুপ ব্যবহার করে প্রতিটি পণ্যের তথ্য প্রদর্শন করেছি। `title`, `categoryName`, `brandName`, `price`, এবং `star` একত্রে দেখানো হচ্ছে।

### আউটপুট

উপরের কোডটি চালানোর পর, আউটপুট হবে এমন ধরণের:

```
Product 1 - Electronics - Samsung - 1000 - 4.5
Product 2 - Furniture - Ikea - 1200 - 4.0
Product 3 - Clothing - Adidas - 800 - 3.5
```

### ইনার জয়েনের উপকারিতা

- **ডেটা ফিল্টারিং**: শুধুমাত্র উভয় টেবিলের ম্যাচিং রেকর্ডগুলো রিটার্ন করে, ফলে অপ্রয়োজনীয় ডেটা বাদ দেয়।
- **ডেটার সঠিক সম্পর্ক**: মূল টেবিলের সাথে সম্পর্কিত টেবিল থেকে সঠিক তথ্য যুক্ত করে একত্রে ডেটা প্রদর্শন করা যায়।
- **পারফরমেন্স**: ইনার জয়েনের কারণে অপ্রয়োজনীয় ডেটা ফিল্টার হওয়ার ফলে কুয়েরি অপ্টিমাইজ থাকে।

## এই উদাহরণে `products`, `categories`, এবং `brands` টেবিলকে যুক্ত করে প্রতিটি পণ্যের বিস্তারিত তথ্য (ক্যাটাগরি, ব্র্যান্ড সহ) একত্রে দেখা যাবে।

এর আগে আমরা কনসে প্ট ক্লিয়ার করার চেষ্টা করেছি েএখন আমরা এগুলো ব্যবহার করবো।

```php
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class DemoController extends Controller {
    public function DemoAction() {
        // INNER JOIN ব্যবহার করে products, categories, এবং brands টেবিলের সাথে সম্পর্কযুক্ত ডাটা ফেচ করা
        $products = DB::table('products')
            ->join('categories', 'products.category_id', '=', 'categories.id') // category_id কে categories টেবিলের id এর সাথে মিলানো
            ->join('brands', 'products.brand_id', '=', 'brands.id')           // brand_id কে brands টেবিলের id এর সাথে মিলানো
            ->get();

        return $products;
    }
}
```
