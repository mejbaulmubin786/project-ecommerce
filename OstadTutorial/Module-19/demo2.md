Laravel Artisan কমান্ডের মাধ্যমে ধারাবাহিকভাবে টেবিলের মাইগ্রেশন ফাইল তৈরি করার জন্য প্রতিটি টেবিলের মাইগ্রেশন আলাদা আলাদা করে তৈরি করতে হবে। যেহেতু টেবিলগুলোর মধ্যে সম্পর্ক রয়েছে, তাই তাদের মধ্যে `foreign key` ব্যবহার করা হয়েছে, এবং এই `foreign key` সম্পর্ক বজায় রাখতে হবে। এজন্য নির্দিষ্ট ক্রমানুসারে টেবিল তৈরি করতে হবে।

এখানে প্রথমে Artisan কমান্ডগুলো দেওয়া হলো। এরপর প্রতিটি মাইগ্রেশন ফাইলে কীভাবে কোড লিখতে হবে তা ব্যাখ্যা করা হয়েছে।

### Artisan Commands

এখানে প্রথমে `users`, তারপর `profiles`, এবং এরপর `categories`, `brands`, ইত্যাদি ক্রমানুসারে টেবিলের মাইগ্রেশন তৈরি করা হয়েছে:

```bash
php artisan make:migration create_users_table
php artisan make:migration create_profiles_table
php artisan make:migration create_categories_table
php artisan make:migration create_brands_table
php artisan make:migration create_products_table
php artisan make:migration create_product_details_table
php artisan make:migration create_product_reviews_table
php artisan make:migration create_product_carts_table
php artisan make:migration create_product_wishes_table
php artisan make:migration create_product_sliders_table
```

### মাইগ্রেশন ফাইল কোড

নিচে প্রতিটি মাইগ্রেশন ফাইলের কোড `return new class extends Migration` ফর্ম্যাটে দেওয়া হলো।

#### 1. `create_users_table` মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('email')->unique();
            $table->string('otp', 10);
            $table->timestamps();
        });
    }

    public function down() {
        Schema::dropIfExists('users');
    }
};
```

#### 2. `create_profiles_table` মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('profiles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('firstName');
            $table->string('lastName');
            $table->string('mobile', 15);
            $table->string('city');
            $table->string('shippingAddress');
            $table->string('email');
            $table->timestamps();

            $table->foreign('email')->references('email')->on('users')->onDelete('cascade');
        });
    }

    public function down() {
        Schema::dropIfExists('profiles');
    }
};
```

#### 3. `create_categories_table` মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('categories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('categoryName');
            $table->string('categoryImg');
            $table->timestamps();
        });
    }

    public function down() {
        Schema::dropIfExists('categories');
    }
};
```

#### 4. `create_brands_table` মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('brands', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('brandName');
            $table->string('brandImg');
            $table->timestamps();
        });
    }

    public function down() {
        Schema::dropIfExists('brands');
    }
};
```

#### 5. `create_products_table` মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->string('short_des', 500);
            $table->string('price');
            $table->tinyInteger('discount')->nullable();
            $table->string('discount_price')->nullable();
            $table->string('image');
            $table->tinyInteger('stock');
            $table->double('star', 2, 1);
            $table->enum('remark', ['New', 'Popular', 'Trending']);
            $table->unsignedBigInteger('category_id')->nullable();
            $table->unsignedBigInteger('brand_id')->nullable();
            $table->timestamps();

            $table->foreign('category_id')->references('id')->on('categories')->onDelete('set null');
            $table->foreign('brand_id')->references('id')->on('brands')->onDelete('set null');
        });
    }

    public function down() {
        Schema::dropIfExists('products');
    }
};
```

#### 6. `create_product_details_table` মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('product_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('img1');
            $table->string('img2')->nullable();
            $table->string('img3')->nullable();
            $table->longText('des');
            $table->string('color');
            $table->string('size');
            $table->unsignedBigInteger('product_id');
            $table->timestamps();

            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        });
    }

    public function down() {
        Schema::dropIfExists('product_details');
    }
};
```

#### 7. `create_product_reviews_table` মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('product_reviews', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('description', 500);
            $table->string('email');
            $table->unsignedBigInteger('product_id');
            $table->timestamps();

            $table->foreign('email')->references('email')->on('users')->onDelete('cascade');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        });
    }

    public function down() {
        Schema::dropIfExists('product_reviews');
    }
};
```

#### 8. `create_product_carts_table` মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('product_carts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('email');
            $table->unsignedBigInteger('product_id');
            $table->string('color');
            $table->string('size');
            $table->timestamps();

            $table->foreign('email')->references('email')->on('users')->onDelete('cascade');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        });
    }

    public function down() {
        Schema::dropIfExists('product_carts');
    }
};
```

#### 9. `create_product_wishes_table` মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('product_wishes', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('email');
            $table->unsignedBigInteger('product_id');
            $table->timestamps();

            $table->foreign('email')->references('email')->on('users')->onDelete('cascade');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        });
    }

    public function down() {
        Schema::dropIfExists('product_wishes');
    }
};
```

#### 10. `create_product_sliders_table` মাইগ্রেশন

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('product_sliders', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->string('short_des', 500);
            $table->string('image');
            $table->unsignedBigInteger('product_id');
            $table->timestamps();

            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        });
    }

    public function down() {
        Schema::dropIfExists('product_sliders');
    }
};
```

### পরিশেষে

এভাবে `artisan` কমান্ড এবং মাইগ্রেশন ফাইলের মাধ্যমে প্রতিটি টেবিলের মাইগ্রেশন তৈরি করতে পারবেন।
