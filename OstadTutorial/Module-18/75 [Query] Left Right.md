### Left Join

**লেফট জয়েন (Left Join)** কুয়েরি ব্যবহার করলে মূল (বাম) টেবিলের সমস্ত রেকর্ড রিটার্ন হয়, আর ডান টেবিলের সাথে যদি ম্যাচিং রেকর্ড থাকে, তাহলে তা প্রদর্শিত হয়। যদি ডান টেবিলে ম্যাচ না থাকে, তাহলে সেখানে `NULL` দেখানো হয়। উদাহরণস্বরূপ, আমরা `products` টেবিল থেকে সমস্ত পণ্যের তথ্য প্রদর্শন করব, এবং যদি পণ্যের সাথে কোনো ক্যাটাগরি বা ব্র্যান্ড ম্যাচ না করে, তাহলে সেই অংশে `NULL` দেখা যাবে।

### লেফট জয়েনের উদাহরণ কোড

```php
use Illuminate\Support\Facades\DB;

$productsWithCategoriesLeft = DB::table('products')
    ->leftJoin('categories', 'products.category_id', '=', 'categories.id')
    ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
    ->select('products.title', 'categories.categoryName', 'brands.brandName', 'products.price', 'products.star')
    ->get();

foreach ($productsWithCategoriesLeft as $product) {
    echo $product->title . ' - ' . ($product->categoryName ?? 'No Category') . ' - ' . ($product->brandName ?? 'No Brand') . ' - ' . $product->price . ' - ' . $product->star . "\n";
}
```

### কোডের বিশ্লেষণ

1. **leftJoin() মেথড**:

   ```php
   ->leftJoin('categories', 'products.category_id', '=', 'categories.id')
   ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
   ```

   `leftJoin` মেথড ব্যবহার করে আমরা `products` টেবিলের `category_id` এবং `brand_id` কলামগুলোর সাথে `categories` এবং `brands` টেবিলের `id` কলামের সম্পর্ক তৈরি করেছি। এই কুয়েরি `products` টেবিলের সব রেকর্ড দেখাবে, এমনকি যদি `categories` বা `brands` টেবিলে সেই রেকর্ডের ম্যাচ না থাকে।

2. **Null Value চেকিং**:
   ```php
   ($product->categoryName ?? 'No Category')
   ```
   এখানে আমরা `categoryName` এবং `brandName` চেক করেছি। যদি কোনো ক্যাটাগরি বা ব্র্যান্ড না থাকে, তাহলে `No Category` বা `No Brand` টেক্সট দেখানো হবে।

### আউটপুট

```
Product 1 - Electronics - Samsung - 1000 - 4.5
Product 2 - Furniture - No Brand - 1200 - 4.0
Product 3 - No Category - Adidas - 800 - 3.5
```

### Right Join

**রাইট জয়েন (Right Join)** কুয়েরি ব্যবহার করলে ডান টেবিলের সমস্ত রেকর্ড রিটার্ন হয়, এবং বাম টেবিলের সাথে যদি কোনো রেকর্ড ম্যাচ করে, তাহলে তা প্রদর্শিত হয়। যদি বাম টেবিলে কোনো রেকর্ড ম্যাচ না করে, তাহলে সেই অংশে `NULL` দেখানো হয়। উদাহরণ হিসেবে, আমরা চাইছি সমস্ত ক্যাটাগরি এবং ব্র্যান্ডের রেকর্ড দেখতে, যেখানে কোনো পণ্য না থাকলেও `NULL` হিসেবে দেখানো হবে।

### রাইট জয়েনের উদাহরণ কোড

```php
$categoriesWithProductsRight = DB::table('categories')
    ->rightJoin('products', 'categories.id', '=', 'products.category_id')
    ->rightJoin('brands', 'products.brand_id', '=', 'brands.id')
    ->select('products.title', 'categories.categoryName', 'brands.brandName', 'products.price', 'products.star')
    ->get();

foreach ($categoriesWithProductsRight as $product) {
    echo ($product->title ?? 'No Product') . ' - ' . ($product->categoryName ?? 'No Category') . ' - ' . ($product->brandName ?? 'No Brand') . ' - ' . ($product->price ?? 'No Price') . ' - ' . ($product->star ?? 'No Rating') . "\n";
}
```

### কোডের বিশ্লেষণ

1. **rightJoin() মেথড**:

   ```php
   ->rightJoin('products', 'categories.id', '=', 'products.category_id')
   ->rightJoin('brands', 'products.brand_id', '=', 'brands.id')
   ```

   `rightJoin` মেথড ব্যবহার করে আমরা `products` টেবিলের সাথে `categories` এবং `brands` টেবিল যুক্ত করেছি। এতে ডান টেবিলের (products) সব রেকর্ড রিটার্ন হবে, এমনকি যদি ক্যাটাগরি বা ব্র্যান্ডের সাথে কোনো সম্পর্ক না থাকে।

2. **Optional Field Display**:
   ```php
   ($product->title ?? 'No Product')
   ```
   এখানে, যদি কোনো ফিল্ড `NULL` হয়, তাহলে আমরা `No Product`, `No Category`, `No Brand`, `No Price`, বা `No Rating` এর মাধ্যমে অপশনাল টেক্সট দেখাচ্ছি।

### আউটপুট

```
Product 1 - Electronics - Samsung - 1000 - 4.5
Product 2 - Furniture - No Brand - 1200 - 4.0
No Product - No Category - Adidas - No Price - No Rating
```

এইভাবে, `Left Join` এবং `Right Join` ব্যবহার করে আমরা বিভিন্ন ডেটা যোগ করতে পারি।
