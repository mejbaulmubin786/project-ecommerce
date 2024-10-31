### Cross Join

**ক্রস জয়েন (Cross Join)** কুয়েরি ব্যবহার করলে দুটি টেবিলের প্রতিটি রেকর্ডের সাথে অন্য টেবিলের প্রতিটি রেকর্ড যোগ করে। এর ফলে যে সকল সম্ভবনার মিশ্রণ (Cartesian Product) পাওয়া যায়, তা ক্রস জয়েনের মাধ্যমে সম্ভব হয়। উদাহরণস্বরূপ, `products` টেবিলের প্রতিটি পণ্যের জন্য প্রতিটি ক্যাটাগরি ও ব্র্যান্ডের সাথে সমস্ত কম্বিনেশন দেখানো হবে।

### ক্রস জয়েনের উদাহরণ কোড

```php
use Illuminate\Support\Facades\DB;

$crossJoinData = DB::table('products')
    ->crossJoin('categories')
    ->crossJoin('brands')
    ->select('products.title', 'categories.categoryName', 'brands.brandName', 'products.price', 'products.star')
    ->get();

foreach ($crossJoinData as $product) {
    echo $product->title . ' - ' . $product->categoryName . ' - ' . $product->brandName . ' - ' . $product->price . ' - ' . $product->star . "\n";
}
```

### কোডের বিশ্লেষণ

1. **crossJoin() মেথড**:

   ```php
   ->crossJoin('categories')
   ->crossJoin('brands')
   ```

   `crossJoin` মেথড ব্যবহার করে `products` টেবিলের প্রতিটি রেকর্ডের সাথে `categories` এবং `brands` টেবিলের প্রতিটি রেকর্ড যুক্ত হয়েছে, যা একটি Cartesian Product তৈরি করে। এতে কোনো সম্পর্ক ভিত্তিক শর্ত থাকে না, তাই টেবিলের সকল রেকর্ড বিভিন্ন কম্বিনেশনে একত্রিত হয়।

2. **সিলেক্ট স্টেটমেন্ট**:
   ```php
   ->select('products.title', 'categories.categoryName', 'brands.brandName', 'products.price', 'products.star')
   ```
   এই অংশটি ব্যবহার করে আমরা ক্রস জয়েনের আউটপুট থেকে সুনির্দিষ্ট কলামগুলো সিলেক্ট করেছি।

### আউটপুট (উদাহরণস্বরূপ)

ধরা যাক `products` টেবিলে ৩টি পণ্য, `categories` টেবিলে ২টি ক্যাটাগরি, এবং `brands` টেবিলে ২টি ব্র্যান্ড আছে। তখন ক্রস জয়েনের মাধ্যমে আমরা `3 * 2 * 2 = 12` টি কম্বিনেশন পাব।

```
Product 1 - Electronics - Samsung - 1000 - 4.5
Product 1 - Electronics - LG - 1000 - 4.5
Product 1 - Furniture - Samsung - 1000 - 4.5
Product 1 - Furniture - LG - 1000 - 4.5
Product 2 - Electronics - Samsung - 1200 - 4.0
Product 2 - Electronics - LG - 1200 - 4.0
...
```

### ক্রস জয়েনের ব্যবহার

`Cross Join` সাধারণত তখন ব্যবহার করা হয়, যখন দুই টেবিলের সকল সম্ভাব্য কম্বিনেশন দেখতে চাই। তবে এই ধরনের জয়েন খুব বেশি পরিমাণে ডেটা তৈরি করে, যা বড় টেবিলের ক্ষেত্রে অপ্রয়োজনীয় ও ভারী হতে পারে। এর ব্যবহার খুবই কম।
