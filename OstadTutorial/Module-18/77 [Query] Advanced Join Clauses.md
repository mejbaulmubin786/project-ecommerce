আমরা আগে যে সকর জয়েন দেখেছি সে গুলোতে দেখলাম।

```php
$productsWithCategories = DB::table('products')
    ->join('categories', 'products.category_id', '=', 'categories.id')
    ->join('brands', 'products.brand_id', '=', 'brands.id')
    ->select('products.title', 'categories.categoryName', 'brands.brandName', 'products.price', 'products.star')
    ->get();
```

ঐগুলোর প্রতিটিতে পেরেন্ট টেবিলের ফরেন কি ও চাইল্ড টেবিলের প্রাইমারি কি এর সম্পর্ক দিয়ে তৈরি জয়েন ক্রাইটেরিয়া নির্দারণ করা হতো । এখন `join('categories', 'products.category_id', '=', 'categories.id')` এই কম্পেয়ারের জায়গাতে যদি আমরা একটি কলব্যক ফাংশন বসাই তখন সেটা আর সিম্পল থাকবে না সেটি হবে এডভান্স জয়েন।

যেমন

```php
আপনি যে কোডটি দিয়েছেন, সেটি হল:
PHP
function DemoAction() {
    $products = DB::table('products')
        ->join('categories', function (JoinClause $join) {
            $join->on('products.category_id', '=', 'categories.id')
                ->where('products.price',  '>', 2000);
        })
        ->join('brands', function (JoinClause $join) {
            $join->on('products.brand_id', '=', 'brands.id')
                ->where('brands.brandName', '=', 'Hatil');
        })
        ->get();

    return $products;
}
```

এই উদাহরণে, আমরা একটি এডভান্স জয়েন ব্যবহার করছি যেখানে `join` মেথডে একটি কলব্যাক ফাংশন পাস করা হয়েছে। এই পদ্ধতিতে আমরা কন্ডিশনাল ফিল্টার যোগ করতে পারি, যা জয়েন করার সময় অতিরিক্ত শর্ত প্রয়োগ করতে সাহায্য করে।

### কোড

```php
use Illuminate\Database\Query\JoinClause;

function DemoAction() {
    $products = DB::table('products')
        ->join('categories', function (JoinClause $join) {
            $join->on('products.category_id', '=', 'categories.id')
                ->where('products.price',  '>', 2000);
        })
        ->join('brands', function (JoinClause $join) {
            $join->on('products.brand_id', '=', 'brands.id')
                ->where('brands.brandName', '=', 'Hatil');
        })
        ->select('products.title', 'categories.categoryName', 'brands.brandName', 'products.price', 'products.star')
        ->get();

    return $products;
}
```

### কোড বিশ্লেষণ

1. **প্রথম Join** (`categories` টেবিলের সাথে):

   ```php
   ->join('categories', function (JoinClause $join) {
       $join->on('products.category_id', '=', 'categories.id')
           ->where('products.price',  '>', 2000);
   })
   ```

   এখানে `products` টেবিলের `category_id` কলামটি `categories` টেবিলের `id` এর সাথে যোগ করা হয়েছে এবং অতিরিক্ত শর্ত হিসেবে চেক করা হচ্ছে যে `products` টেবিলের `price` ২০০০ এর বেশি হতে হবে।

2. **দ্বিতীয় Join** (`brands` টেবিলের সাথে):

   ```php
   ->join('brands', function (JoinClause $join) {
       $join->on('products.brand_id', '=', 'brands.id')
           ->where('brands.brandName', '=', 'Hatil');
   })
   ```

   এই অংশে `products` টেবিলের `brand_id` কলামটি `brands` টেবিলের `id` এর সাথে যোগ করা হয়েছে এবং শর্ত রাখা হয়েছে যে `brands` টেবিলের `brandName` হতে হবে `Hatil`।

3. **সিলেক্ট স্টেটমেন্ট**:

   ```php
   ->select('products.title', 'categories.categoryName', 'brands.brandName', 'products.price', 'products.star')
   ```

   এখানে `select` মেথডের মাধ্যমে শুধুমাত্র সুনির্দিষ্ট কলামগুলো (পণ্যের শিরোনাম, ক্যাটাগরি নাম, ব্র্যান্ড নাম, মূল্য এবং স্টার রেটিং) সিলেক্ট করা হয়েছে।

4. **ফাইনাল আউটপুট**:
   এই কোডটি এক্সিকিউট করলে আমরা `products` টেবিলের সেই সকল পণ্যের তথ্য পাব যেগুলোর মূল্য ২০০০ এর বেশি এবং ব্র্যান্ড `Hatil`।

### সম্ভাব্য আউটপুট (উদাহরণস্বরূপ)

উপরোক্ত কোডের আউটপুটে এমন সকল পণ্য শো করবে যেখানে:

- ক্যাটাগরি `categories.id` দ্বারা নির্ধারিত,
- মূল্য ২০০০ এর বেশি, এবং
- ব্র্যান্ডের নাম `Hatil`।

```
+------------+---------------+-----------+--------+------+
| title      | categoryName  | brandName | price  | star |
+------------+---------------+-----------+--------+------+
| Product X  | Furniture     | Hatil     | 2500   | 4.5  |
| Product Y  | Office Chairs | Hatil     | 3000   | 5.0  |
+------------+---------------+-----------+--------+------+
```

**এই এডভান্স জয়েন** পদ্ধতিতে, কন্ডিশন যোগ করার ফলে আমাদের কুয়েরি আরও সুনির্দিষ্ট হয়েছে এবং প্রয়োজনীয় রেকর্ডগুলো পেতে সহজ হয়েছে।
