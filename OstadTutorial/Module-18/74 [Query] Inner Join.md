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
