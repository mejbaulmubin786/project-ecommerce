আমরা একটু আগে যেমন দেখেছি নিশ্চয় আমরা সরাসরি এভাবে ডাটা ইনসার্ট করবো না। আমরা সাধারণত ইউজার থেকে ডেটা নিয়ে তারপর ইনপুট করবো। এর জন্য আমরা

```php
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

// It's good to include the base Controller

class DemoController extends Controller {
    function DemoAction() {
        $products = DB::table('products')
            ->join('categories', 'products.category_id', '=', 'categories.id')
            ->join('brands', 'products.brand_id', '=', 'brands.id')
            ->get();

        return $products;
    }
}
```

DemoController

Route::post('/', [DemoController::class, 'DemoAction']);
