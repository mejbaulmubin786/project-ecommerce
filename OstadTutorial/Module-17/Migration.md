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

Laravel 10 সংস্করণে প্রতিটি মাইগ্রেশন ফাইলকে `return new class extends Migration` স্টাইলে আপডেট করা হলো:

### `create_users_table` মাইগ্রেশন ফাইল

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
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
};
```

### `create_brands_table` মাইগ্রেশন ফাইল

```php
return new class extends Migration
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
};
```

### `create_categories_table` মাইগ্রেশন ফাইল

```php
return new class extends Migration
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
};
```

### `create_profiles_table` মাইগ্রেশন ফাইল

```php
return new class extends Migration
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
};
```

### `create_products_table` মাইগ্রেশন ফাইল

```php
return new class extends Migration
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
};
```

### `create_product_details_table` মাইগ্রেশন ফাইল

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void {
        Schema::create('product_details', function (Blueprint $table) {
            $table->id();
            $table->string('img1', 200);
            $table->string('img2', 200);
            $table->string('img3', 200);
            $table->string('img4', 200);
            $table->longText('des');
            $table->string('color', 200);
            $table->string('size', 200);

            $table->unsignedBigInteger('product_id')->unique();
            $table->foreign('product_id')->references('id')->on('products')
                ->restrictOnDelete()
                ->restrictOnUpdate();

            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void {
        Schema::dropIfExists('product_details');
    }
};
```

এইভাবে, আপনি বাকিগুলোও `return new class extends Migration` স্টাইলে করতে পারেন। যদি প্রয়োজন হয়, পরবর্তী টেবিলগুলোর জন্যও কোড প্রদান করতে পারি।
নিশ্চিতভাবে, নিচে বাকি মাইগ্রেশন ফাইলগুলোকে `return new class extends Migration` স্টাইলে দেওয়া হলো:

### `create_product_sliders_table` মাইগ্রেশন ফাইল

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void {
        Schema::create('product_sliders', function (Blueprint $table) {
            $table->id();
            $table->string('title', 200);
            $table->string('short_des', 500);
            $table->string('image', 200);
            $table->unsignedBigInteger('product_id')->unique();
            $table->foreign('product_id')->references('id')->on('products')

                ->restrictOnDelete()
                ->restrictOnUpdate();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void {
        Schema::dropIfExists('product_sliders');
    }
};

```

### `create_product_reviews_table` মাইগ্রেশন ফাইল

```php
return new class extends Migration
{
    public function up()
    {
        Schema::create('product_reviews', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->string('comment', 1000);
            $table->string('email', 50);
            $table->float('rating');

            $table->foreign('product_id')->references('id')->on('products')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->foreign('email')->references('email')->on('users')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('product_reviews');
    }
};
```

### `create_product_wishes_table` মাইগ্রেশন ফাইল

```php
return new class extends Migration
{
    public function up()
    {
        Schema::create('product_wishes', function (Blueprint $table) {
            $table->id();
            $table->string('email', 50);
            $table->unsignedBigInteger('product_id');

            $table->foreign('product_id')->references('id')->on('products')
                ->restrictOnDelete()
                ->restrictOnUpdate();

            $table->foreign('email')->references('email')->on('profiles')
                ->restrictOnDelete()
                ->restrictOnUpdate();

            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('product_wishes');
    }
};
```

### `create_product_carts_table` মাইগ্রেশন ফাইল

```php
return new class extends Migration
{
    public function up()
    {
        Schema::create('product_carts', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->string('email', 50);
            $table->integer('quantity');

            $table->foreign('product_id')->references('id')->on('products')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->foreign('email')->references('email')->on('users')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down()
    {
        Schema::dropIfExists('product_carts');
    }
};
```

এই মাইগ্রেশন ফাইলগুলো Laravel 10-এর জন্য তৈরি করা হয়েছে এবং প্রত্যেকটি টেবিলের সম্পর্কের জন্য `foreign key` ব্যবহার করা হয়েছে। এবার এই মাইগ্রেশনগুলো চালানোর জন্য `php artisan migrate` কমান্ডটি ব্যবহার করতে পারেন।
