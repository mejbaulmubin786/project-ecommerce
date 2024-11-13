ল্যারাভেলে সরাসরি ডেমো ডাটা ইনসার্ট করার জন্য, `DatabaseSeeder.php` এবং অন্যান্য Seeder ফাইল ব্যবহার করতে পারেন। এই ফাইলগুলো ধারাবাহিকভাবে তৈরি ও ব্যবহার করার ধাপগুলি নিচে দেওয়া হলো:

### ১. Seeder ফাইল তৈরি করুন

প্রতিটি টেবিলের জন্য আলাদা আলাদা Seeder ফাইল তৈরি করতে হবে। Command Prompt বা Terminal-এ নিচের কমান্ডগুলো রান করুন:

```bash
php artisan make:seeder UsersTableSeeder
php artisan make:seeder BrandsTableSeeder
php artisan make:seeder CategoriesTableSeeder
php artisan make:seeder ProfilesTableSeeder
php artisan make:seeder ProductsTableSeeder
php artisan make:seeder ProductDetailsTableSeeder
php artisan make:seeder ProductSlidersTableSeeder
php artisan make:seeder ProductReviewsTableSeeder
php artisan make:seeder ProductWishesTableSeeder
php artisan make:seeder ProductCartsTableSeeder
```

### ২. প্রতিটি Seeder ফাইল সম্পাদনা করুন

Seeder ফাইলগুলোতে আপনি ডেমো ডাটা ইনসার্ট করবেন। উদাহরণস্বরূপ, `UsersTableSeeder.php`-এ ২০টি ডেমো ডাটা ইনসার্ট করতে নিচের মতো কোড লিখুন:

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('users')->insert([
                'email' => 'user' . $i . '@example.com',
                'otp' => rand(100000, 999999),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

একইভাবে অন্যান্য Seeder ফাইলেও ২০টি ডেমো ডাটা ইনসার্ট করার কোড লিখুন। প্রতিটি ফাইলের জন্য ডাটা মানানসই করতে পারেন।

### ৩. DatabaseSeeder.php-এ Seeder ফাইলগুলো যুক্ত করুন

`database/seeders/DatabaseSeeder.php` ফাইলটি খুলুন এবং `call()` মেথডের ভেতর প্রতিটি Seeder ক্লাস কল করুন:

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call([
            UsersTableSeeder::class,
            BrandsTableSeeder::class,
            CategoriesTableSeeder::class,
            ProfilesTableSeeder::class,
            ProductsTableSeeder::class,
            ProductDetailsTableSeeder::class,
            ProductSlidersTableSeeder::class,
            ProductReviewsTableSeeder::class,
            ProductWishesTableSeeder::class,
            ProductCartsTableSeeder::class,
        ]);
    }
}
```

### ৪. Seeder রান করুন

Seeder ফাইলগুলো রান করতে নিচের কমান্ডটি দিন:

```bash
php artisan db:seed
```

এই কমান্ডটি চালালে, প্রতিটি টেবিলে ২০টি ডেমো ডাটা ইনসার্ট হবে।

আপনার `UsersTableSeeder.php` ফাইলে যে ভুলটি হচ্ছে, তা সম্ভবত `DB` ফ্যাসাডটি সঠিকভাবে কাজ করছে না কারণ এটি সঠিকভাবে আমদানি করা হয়নি। এর জন্য নিচের নির্দেশনাগুলি অনুসরণ করুন:

1. নিশ্চিত করুন যে `use Illuminate\Support\Facades\DB;` লাইনটি ফাইলের উপরে রয়েছে। এটি না থাকলে যুক্ত করুন।

2. Laravel 9 বা তার পরবর্তী সংস্করণে `DB` ফ্যাসাড সঠিকভাবে কাজ করতে `use Illuminate\Support\Facades\DB;` ব্যবহার করতে হবে।

পরিবর্তিত `UsersTableSeeder.php` ফাইলটি নিচে দেখানো হলো:

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('users')->insert([
                'email' => 'user' . $i . '@example.com',
                'otp' => rand(100000, 999999),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

`use Illuminate\Support\Facades\DB;` যোগ করার পর আবার `php artisan db:seed` চালিয়ে দেখুন সমস্যাটি ঠিক হয়েছে কিনা।

Laravel 10-এর জন্য নিচের কোডটি ব্যবহার করতে পারেন। এখানে `DB` এবং `Str` ফ্যাসাড সঠিকভাবে আমদানি করা হয়েছে:

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('users')->insert([
                'email' => 'user' . $i . '@example.com',
                'otp' => rand(100000, 999999),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

**নির্দেশনাবলী:**

1. `use Illuminate\Support\Facades\DB;` এবং `use Illuminate\Support\Str;` Laravel 10-এর জন্য সঠিকভাবে ফ্যাসাড ইমপোর্ট করছে।
2. এটি `php artisan db:seed` কমান্ডের মাধ্যমে চলবে যদি আপনি এই Seeder ক্লাসটি `DatabaseSeeder.php`-এ রেজিস্টার করেন।

এবার `DatabaseSeeder.php`-এ এই Seeder ক্লাসটি কল করতে ভুলবেন না।
আপনার Laravel 10 এর অন্যান্য Seeder ফাইলগুলোর জন্যও `DB` এবং `Str` ফ্যাসাড সঠিকভাবে ইমপোর্ট করতে হবে। নিচে প্রতিটি Seeder ফাইলের কোড দেখানো হলো যেখানে ২০টি ডেমো ডাটা ইনসার্ট করা আছে।

### `BrandsTableSeeder.php`

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class BrandsTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('brands')->insert([
                'brandName' => 'Brand ' . $i,
                'brandImg' => 'https://example.com/brand' . $i . '.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

### `CategoriesTableSeeder.php`

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CategoriesTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('categories')->insert([
                'categoryName' => 'Category ' . $i,
                'categoryImg' => 'https://example.com/category' . $i . '.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

### `ProfilesTableSeeder.php`

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProfilesTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('profiles')->insert([
                'firstName' => 'FirstName ' . $i,
                'lastName' => 'LastName ' . $i,
                'mobile' => '012345678' . $i,
                'city' => 'City ' . $i,
                'shippingAddress' => 'Address ' . $i,
                'email' => 'user' . $i . '@example.com',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

### `ProductsTableSeeder.php`

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductsTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('products')->insert([
                'title' => 'Product ' . $i,
                'short_des' => 'This is the description for product ' . $i,
                'price' => rand(100, 500),
                'discount' => rand(5, 20),
                'discount_price' => rand(80, 450),
                'image' => 'https://example.com/product' . $i . '.jpg',
                'stock' => true,
                'star' => rand(1, 5),
                'remark' => 'popular',
                'category_id' => rand(1, 10),
                'brand_id' => rand(1, 10),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

### `ProductDetailsTableSeeder.php`

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductDetailsTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('product_details')->insert([
                'img1' => 'https://example.com/product_detail' . $i . '_1.jpg',
                'img2' => 'https://example.com/product_detail' . $i . '_2.jpg',
                'img3' => 'https://example.com/product_detail' . $i . '_3.jpg',
                'img4' => 'https://example.com/product_detail' . $i . '_4.jpg',
                'des' => 'Detailed description for product ' . $i,
                'color' => 'Color ' . $i,
                'size' => 'Size ' . $i,
                'product_id' => $i,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

### `ProductSlidersTableSeeder.php`

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductSlidersTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('product_sliders')->insert([
                'title' => 'Slider for Product ' . $i,
                'short_des' => 'Short description for slider ' . $i,
                'image' => 'https://example.com/slider' . $i . '.jpg',
                'product_id' => $i,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

### `ProductReviewsTableSeeder.php`

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductReviewsTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('product_reviews')->insert([
                'description' => 'Review description ' . $i,
                'email' => 'user' . $i . '@example.com',
                'product_id' => $i,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

### `ProductWishesTableSeeder.php`

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductWishesTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('product_wishes')->insert([
                'email' => 'user' . $i . '@example.com',
                'product_id' => $i,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

### `ProductCartsTableSeeder.php`

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductCartsTableSeeder extends Seeder
{
    public function run()
    {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('product_carts')->insert([
                'email' => 'user' . $i . '@example.com',
                'product_id' => $i,
                'color' => 'Color ' . $i,
                'size' => 'Size ' . $i,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
```

**পরবর্তী ধাপ:**
প্রতিটি Seeder ক্লাস `DatabaseSeeder.php`-এ রেজিস্টার করুন, যেমন:

```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call([
            UsersTableSeeder::class,
            BrandsTableSeeder::class,
            CategoriesTableSeeder::class,
            ProfilesTableSeeder::class,
            ProductsTableSeeder::class,
            ProductDetailsTableSeeder::class,
            ProductSlidersTableSeeder::class,
            ProductReviewsTableSeeder::class,
            ProductWishesTableSeeder::class,
            ProductCartsTableSeeder::class,
        ]);
    }
}
```

এরপর `php artisan db:seed` চালিয়ে সব টেবিলে ডেমো ডাটা ইনসার্ট করুন।
