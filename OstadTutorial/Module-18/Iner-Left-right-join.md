`Laravel Query Builder` দিয়ে ইনার জয়েন, লেফ্ট জয়েন, রাইট জয়েন এবং ক্রস জয়েন করা সম্ভব। নিচে `categories`, `brands`, এবং `products` টেবিল ব্যবহার করে উদাহরণ সহ প্রতিটি জয়েন নিয়ে আলোচনা করা হলো:

### 1. Inner Join

**ইনার জয়েন** শুধুমাত্র সেসব রেকর্ড রিটার্ন করে যেখানে দুই টেবিলের মধ্যে ম্যাচ পাওয়া যায়।

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

এই কোডটি `products` টেবিলকে `categories` এবং `brands` টেবিলের সাথে ইনার জয়েন করছে। শুধুমাত্র সেসব রেকর্ড পাবেন যেখানে `products` টেবিলের `category_id` এবং `brand_id` `categories` এবং `brands` টেবিলে আছে।

### 2. Left Join

**লেফ্ট জয়েন** সব রেকর্ড রিটার্ন করে `products` টেবিল থেকে এবং যেগুলো `categories` টেবিলে মেলে না তাদের জন্য `NULL` রিটার্ন করে।

```php
$productsWithCategories = DB::table('products')
    ->leftJoin('categories', 'products.category_id', '=', 'categories.id')
    ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
    ->select('products.title', 'categories.categoryName', 'brands.brandName', 'products.price', 'products.star')
    ->get();

foreach ($productsWithCategories as $product) {
    echo $product->title . ' - ' . ($product->categoryName ?? 'No Category') . ' - ' . ($product->brandName ?? 'No Brand') . ' - ' . $product->price . ' - ' . $product->star . "\n";
}
```

এই উদাহরণে, `products` টেবিলের সব রেকর্ড থাকবে, এমনকি যদি `category_id` এবং `brand_id` `categories` ও `brands` টেবিলে না থাকে, সেক্ষেত্রে `NULL` দেখাবে।

### 3. Right Join

**রাইট জয়েন** সব রেকর্ড রিটার্ন করে `categories` ও `brands` টেবিল থেকে এবং যদি `products` টেবিলে ম্যাচ না পায়, তাহলে `NULL` রিটার্ন করে।

```php
$productsWithCategories = DB::table('categories')
    ->rightJoin('products', 'categories.id', '=', 'products.category_id')
    ->rightJoin('brands', 'brands.id', '=', 'products.brand_id')
    ->select('products.title', 'categories.categoryName', 'brands.brandName', 'products.price', 'products.star')
    ->get();

foreach ($productsWithCategories as $product) {
    echo ($product->categoryName ?? 'No Category') . ' - ' . ($product->brandName ?? 'No Brand') . ' - ' . $product->title . ' - ' . $product->price . ' - ' . $product->star . "\n";
}
```

এই কোডে, `categories` এবং `brands` টেবিলের সব রেকর্ড রিটার্ন হবে, এমনকি যদি `products` টেবিলে তাদের সাথে মেলে এমন রেকর্ড না থাকে, তখন `NULL` দেখাবে।

### 4. Cross Join

**ক্রস জয়েন** দুই টেবিলের কার্টেসিয়ান প্রোডাক্ট তৈরি করে, যেখানে প্রতিটি রেকর্ড প্রথম টেবিলের প্রতিটি রেকর্ডের সাথে মিলিত হয়।

```php
$crossJoinedData = DB::table('products')
    ->crossJoin('categories')
    ->select('products.title', 'categories.categoryName', 'products.price')
    ->get();

foreach ($crossJoinedData as $data) {
    echo $data->title . ' - ' . $data->categoryName . ' - ' . $data->price . "\n";
}
```

এখানে, `products` টেবিলের প্রতিটি রেকর্ড `categories` টেবিলের প্রতিটি রেকর্ডের সাথে মিলে যাবে, ফলে কার্টেসিয়ান প্রোডাক্ট তৈরি হবে।
