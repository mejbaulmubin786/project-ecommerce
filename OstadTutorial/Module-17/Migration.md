প্রথমে, প্রতিটি টেবিল তৈরির জন্য মাইগ্রেশন কমান্ডগুলো ধারাবাহিকভাবে নিচে দেওয়া হলো। এগুলোকে Laravel 10 এ আপনার প্রজেক্টে রান করতে পারেন:

```bash
php artisan make:migration create_users_table
php artisan make:migration create_brands_table
php artisan make:migration create_categories_table
php artisan make:migration create_profiles_table
php artisan make:migration create_products_table
php artisan make:migration create_product_details_table
php artisan make:migration create_product_sliders_table
php artisan make:migration create_product_reviews_table
php artisan make:migration create_product_wishes_table
php artisan make:migration create_product_carts_table
```

এবার, Laravel 10 এ প্রতিটি মাইগ্রেশন ফাইলের সম্পূর্ণ কোড নিচে দেওয়া হলো, যেখানে আপনার দেওয়া ভেলুগুলো অন্তর্ভুক্ত করা হয়েছে:

### `create_users_table.php`

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('email', 50)->unique();
            $table->string('otp', 10);
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('users');
    }
}
```

### `create_brands_table.php`

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBrandsTable extends Migration
{
    public function up()
    {
        Schema::create('brands', function (Blueprint $table) {
            $table->id();
            $table->string('brandName', 50);
            $table->string('brandImg', 300);
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('brands');
    }
}
```

### `create_categories_table.php`

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCategoriesTable extends Migration
{
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->string('categoryName', 50);
            $table->string('categoryImg', 300);
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('categories');
    }
}
```

### `create_profiles_table.php`

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfilesTable extends Migration
{
    public function up()
    {
        Schema::create('profiles', function (Blueprint $table) {
            $table->id();
            $table->string('firstName', 50);
            $table->string('lastName', 50);
            $table->string('mobile', 50);
            $table->string('city', 50);
            $table->string('shippingAddress', 1000);
            $table->string('email', 50)->unique();
            $table->foreign('email')->references('email')->on('users')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('profiles');
    }
}
```

### `create_products_table.php`

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('title', 200);
            $table->string('short_des', 500);
            $table->double('price', 50);
            $table->double('discount');
            $table->double('discount_price');
            $table->string('image', 200);
            $table->boolean('stock');
            $table->float('star');
            $table->enum('remark', ['popular', 'new', 'top', 'special', 'trending', 'regular']);
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('brand_id');
            $table->foreign('category_id')->references('id')->on('categories')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->foreign('brand_id')->references('id')->on('brands')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('products');
    }
}
```

## (নির্দিষ্ট ক্যারেক্টার সীমাবদ্ধতার কারণে পুরো মাইগ্রেশন ফাইলগুলো এখানে দেওয়া সম্ভব নয়। যদি প্রয়োজন হয়, প্রতিটি টেবিলের জন্য বাকি মাইগ্রেশন ফাইলগুলোও আলাদাভাবে সরবরাহ করবো।)

ধন্যবাদ! এবার আমি আপনাকে প্রতিটি টেবিলের জন্য মাইগ্রেশন ফাইল তৈরি করতে ধারাবাহিকভাবে Laravel 10 এর জন্য কোড সরবরাহ করছি। প্রথমে আপনার কমান্ড লাইন থেকে টেবিল গুলো তৈরি করার জন্য এই কমান্ড গুলো রান করুন:

```bash
php artisan make:migration create_users_table
php artisan make:migration create_brands_table
php artisan make:migration create_categories_table
php artisan make:migration create_profiles_table
php artisan make:migration create_products_table
php artisan make:migration create_product_details_table
php artisan make:migration create_product_sliders_table
php artisan make:migration create_product_reviews_table
php artisan make:migration create_product_wishes_table
php artisan make:migration create_product_carts_table
```

এখন প্রতিটি মাইগ্রেশন ফাইলের কোড নিচে দেয়া হলো:

### `create_users_table` মাইগ্রেশন ফাইল

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('email', 50)->unique();
            $table->string('otp', 10);
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('users');
    }
}
```

### `create_brands_table` মাইগ্রেশন ফাইল

```php
class CreateBrandsTable extends Migration
{
    public function up()
    {
        Schema::create('brands', function (Blueprint $table) {
            $table->id();
            $table->string('brandName', 50);
            $table->string('brandImg', 300);
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('brands');
    }
}
```

### `create_categories_table` মাইগ্রেশন ফাইল

```php
class CreateCategoriesTable extends Migration
{
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->string('categoryName', 50);
            $table->string('categoryImg', 300);
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('categories');
    }
}
```

### `create_profiles_table` মাইগ্রেশন ফাইল

```php
class CreateProfilesTable extends Migration
{
    public function up()
    {
        Schema::create('profiles', function (Blueprint $table) {
            $table->id();
            $table->string('firstName', 50);
            $table->string('lastName', 50);
            $table->string('mobile', 50);
            $table->string('city', 50);
            $table->string('shippingAddress', 1000);
            $table->string('email', 50)->unique();
            $table->foreign('email')->references('email')->on('users')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('profiles');
    }
}
```

### `create_products_table` মাইগ্রেশন ফাইল

```php
class CreateProductsTable extends Migration
{
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('title', 200);
            $table->string('short_des', 500);
            $table->double('price', 50);
            $table->double('discount');
            $table->double('discount_price');
            $table->string('image', 200);
            $table->boolean('stock');
            $table->float('star');
            $table->enum('remark', ['popular', 'new', 'top', 'special', 'trending', 'regular']);
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('brand_id');

            $table->foreign('category_id')->references('id')->on('categories')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->foreign('brand_id')->references('id')->on('brands')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('products');
    }
}
```

এইভাবে বাকি টেবিলগুলোর মাইগ্রেশন ফাইলগুলো তৈরি করতে হবে। প্রতিটি মাইগ্রেশন ফাইলের কোড এখানে প্রদানের জন্য জায়গা কম থাকায়, যদি প্রয়োজন হয়, বাকি টেবিলগুলোর মাইগ্রেশন ফাইলগুলোও আপনাকে প্রদান করতে পারি।
