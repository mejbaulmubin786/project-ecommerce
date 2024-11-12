এবার আমরা আমাদের ডায়াগ্রাম অনুসারে যে মাইগ্রেশন ফাইল গুলো আছে তাদের মাঝে প্রোপাটি গুলো এক এক করে সাজাবো। আমরা একটি কাজ করতে পারি যে টেবিল গুলো খুবই ছোট প্রথমে সেগুলো নিয়ে কাজ করতে পারি যেমন users, categories, brands টেবিল এটি একটি ছোট টেবিল। প্রথমেই আমরা users টেবিল দিয়েই শুরু করি।

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('email', 50)->unique();
            $table->string('otp', 10);
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
```

অবশ্যই! Laravel migration কোডগুলোর প্রতিটি অংশ ভেঙে ব্যাখ্যা করছি যাতে আপনি বুঝতে পারেন কেন এবং কিভাবে এগুলো কাজ করে, এবং কোনটা কোন পরিস্থিতিতে দরকার।

### 1. Users Table

```php
$table->id();
$table->string('email', 50)->unique();
$table->string('otp', 10);
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

#### ব্যাখ্যা:

- `$table->id()`: এটি একটি স্বয়ংক্রিয় ইনক্রিমেন্টাল প্রাইমারি কি ফিল্ড তৈরি করে, যা প্রতিটি রেকর্ডের জন্য একটি ইউনিক আইডি সংখ্যা রাখবে। এটি প্রতিটি টেবিলের জন্য প্রাথমিকভাবে দরকার, যাতে ডেটা এক্সেস করা সহজ হয়।
- `$table->string('email', 50)->unique()`: এখানে আমরা একটি `email` ফিল্ড তৈরি করেছি যেখানে সর্বোচ্চ ৫০ ক্যারেক্টার থাকবে। `->unique()` নির্দেশ করে যে এই ইমেইলটি ইউনিক হবে, অর্থাৎ কোনো দুটি ইউজারের ইমেইল একই হতে পারবে না। এটি রেকর্ডের সঠিকতা বজায় রাখতে প্রয়োজন।

- `$table->string('otp', 10)`: এখানে একটি `otp` (one-time password) ফিল্ড রাখা হয়েছে। এটি ১০ ক্যারেক্টারের একটি স্ট্রিং হবে। `OTP` সাধারণত ইউজার ভেরিফিকেশনের জন্য ব্যবহৃত হয়।

- `$table->timestamp('created_at')->useCurrent()`: `created_at` ফিল্ডে টেবিলের প্রতিটি রেকর্ড কখন তৈরি হয়েছে তা রাখবে, এবং `useCurrent()` ব্যবহার করলে, বর্তমান তারিখ এবং সময় স্বয়ংক্রিয়ভাবে ইনপুট হবে।

- `$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate()`: `updated_at` ফিল্ডে রেকর্ডটি শেষ কবে আপডেট হয়েছে তা রাখে। `useCurrentOnUpdate()` নির্দেশ করে যে যখন রেকর্ড আপডেট হবে তখন বর্তমান সময় ধরে এটি আপডেট হবে।

---

### 3. Categories Table

```php
$table->id();
$table->string('categoryName', 50);
$table->string('categoryImg', 300);
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

#### ব্যাখ্যা:

- `$table->string('categoryName', 50)`: ক্যাটেগরির নাম সংরক্ষণ করবে, সর্বোচ্চ ৫০ ক্যারেক্টার পর্যন্ত।
- `$table->string('categoryImg', 300)`: ক্যাটেগরির ইমেজ URL সংরক্ষণ করবে। এই ফিল্ডটি বড় রাখা হয়েছে (৩০০ ক্যারেক্টার) কারণ URL সাধারণত দীর্ঘ হতে পারে।

---

### 4. Brands Table

```php
$table->id();
$table->string('brandName', 50);
$table->string('brandImg', 300);
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

#### ব্যাখ্যা:

- `$table->string('brandName', 50)`: ব্র্যান্ডের নাম রাখবে, সর্বোচ্চ ৫০ ক্যারেক্টার।
- `$table->string('brandImg', 300)`: ব্র্যান্ডের ইমেজ URL রাখবে, সর্বোচ্চ ৩০০ ক্যারেক্টার।

## //---------------------------------extra---------------------------not important

### 2. Profiles Table

```php
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
```

#### ব্যাখ্যা:

- `$table->string('firstName', 50)` এবং `$table->string('lastName', 50)`: এখানে ইউজারের নাম সংরক্ষণ করা হবে (প্রথম নাম এবং শেষ নাম)। প্রতিটি ফিল্ড সর্বোচ্চ ৫০ ক্যারেক্টার ধরে রাখতে পারে।

- `$table->string('mobile', 50)`: ইউজারের মোবাইল নম্বর সংরক্ষণ করবে।

- `$table->string('city', 50)`: ইউজারের শহরের নাম সংরক্ষণ করবে।

- `$table->string('shippingAddress', 1000)`: ইউজারের শিপিং ঠিকানা সংরক্ষণ করবে। এই ফিল্ডটি বড় করা হয়েছে (১০০০ ক্যারেক্টার পর্যন্ত) কারণ ঠিকানার দৈর্ঘ্য বড় হতে পারে।

- `$table->string('email', 50)->unique()`: ইউজারের ইমেইলটি আবার এখানে রাখা হয়েছে, কারণ প্রোফাইল টেবিলটি `users` টেবিলের সাথে সম্পর্কিত এবং ইমেইল হলো ফরেন কী।

- `$table->foreign('email')->references('email')->on('users')`: এখানে আমরা `users` টেবিলের ইমেইল ফিল্ডের সাথে এই টেবিলের ইমেইল ফিল্ডটিকে রিলেট করছি। অর্থাৎ, প্রতিটি প্রোফাইলের সাথে একটি ইউজার থাকতে হবে।

- `->restrictOnDelete()`: যদি মূল `users` টেবিল থেকে কোনো ইউজার মুছে ফেলা হয়, তাহলে প্রোফাইলও মুছে ফেলা হবে না (ডিলিটে বাধা সৃষ্টি করবে)।

- `->cascadeOnUpdate()`: যদি মূল `users` টেবিলের ইমেইল আপডেট করা হয়, তাহলে সেই পরিবর্তন এখানে প্রোফাইল টেবিলেও প্রয়োগ হবে।

---

### 5. Products Table

```php
$table->id();
$table->string('title', 150);
$table->string('short_des', 255);
$table->decimal('price', 8, 2);
$table->tinyInteger('discount')->nullable();
$table->decimal('discount_price', 8, 2)->nullable();
$table->string('image', 300);
$table->tinyInteger('stock')->default(1);
$table->double('star')->nullable();
$table->enum('remark', ['featured', 'bestseller', 'new'])->nullable();
$table->bigInteger('category_id')->unsigned();
$table->bigInteger('brand_id')->unsigned();
$table->foreign('category_id')->references('id')->on('categories');
$table->foreign('brand_id')->references('id')->on('brands');
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

#### ব্যাখ্যা:

- `$table->decimal('price', 8, 2)`: প্রোডাক্টের প্রাইস সংরক্ষণ করবে। এখানে ৮ ডিজিটের প্রাইস এবং ২ ডিজিট পর্যন্ত দশমিক গ্রহণ করবে (যেমন 99999.99)।
- `$table->tinyInteger('discount')->nullable()`: ডিসকাউন্ট থাকলে তা রাখা হবে (ইন্টিজার হিসেবে)। `nullable()` নির্দেশ করে এটি না থাকলেও সমস্যা নেই।

- `$table->foreign('category_id')->references('id')->on('categories')`: এই প্রোডাক্টটি কোন ক্যাটেগরির সাথে সম্পর্কিত তা দেখাবে।

- `$table->foreign('brand_id')->references('id')->on('brands')`: প্রোডাক্ট কোন ব্র্যান্ডের সাথে সম্পর্কিত তা দেখাবে।

চলুন তাহলে বাকি টেবিলগুলোর ব্যাখ্যাও দিয়ে দিই।

---

### 6. Product_Carts Table

```php
$table->id();
$table->bigInteger('product_id')->unsigned();
$table->bigInteger('user_id')->unsigned();
$table->integer('quantity');
$table->foreign('product_id')->references('id')->on('products');
$table->foreign('user_id')->references('id')->on('users');
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

#### ব্যাখ্যা:

- `$table->bigInteger('product_id')->unsigned()`: এখানে `product_id` রাখা হয়েছে, যা প্রোডাক্ট টেবিলের প্রাইমারি কী `id` এর সাথে সম্পর্কিত। এটি `unsigned()` কারণ প্রাইমারি কী কখনোই নেগেটিভ হয় না।
- `$table->bigInteger('user_id')->unsigned()`: ইউজারের আইডি সংরক্ষণ করা হয়েছে, যা `users` টেবিলের সাথে সম্পর্কিত।

- `$table->integer('quantity')`: এখানে কার্টে কতগুলো প্রোডাক্ট আছে তা রাখা হবে।

- `foreign('product_id')->references('id')->on('products')`: এখানে `product_id` কে প্রোডাক্ট টেবিলের `id` এর সাথে রিলেট করা হয়েছে, যাতে প্রতিটি কার্টের আইটেমের প্রোডাক্ট চিহ্নিত করা যায়।

- `foreign('user_id')->references('id')->on('users')`: ইউজার এবং কার্টের সম্পর্ক বোঝানোর জন্য `user_id` কে `users` টেবিলের `id` এর সাথে রিলেট করা হয়েছে।

---

### 7. Wishlists Table

```php
$table->id();
$table->bigInteger('product_id')->unsigned();
$table->bigInteger('user_id')->unsigned();
$table->foreign('product_id')->references('id')->on('products');
$table->foreign('user_id')->references('id')->on('users');
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

#### ব্যাখ্যা:

- `$table->bigInteger('product_id')->unsigned()`: `product_id` এখানে প্রোডাক্ট টেবিলের `id` এর সাথে সম্পর্কিত।

- `$table->bigInteger('user_id')->unsigned()`: ইউজারের আইডি রাখা হয়েছে, যা `users` টেবিলের প্রাইমারি কী `id` এর সাথে সম্পর্কিত।

- `foreign('product_id')->references('id')->on('products')`: এখানে প্রোডাক্টের আইডি কে প্রোডাক্ট টেবিলের `id` এর সাথে রিলেট করা হয়েছে।

- `foreign('user_id')->references('id')->on('users')`: ইউজারের সাথে `user_id` কে রিলেট করা হয়েছে যাতে ইউজারের উইশলিস্ট চিহ্নিত করা যায়।

---

### 8. Payments Table

```php
$table->id();
$table->bigInteger('user_id')->unsigned();
$table->decimal('amount', 8, 2);
$table->string('payment_method', 100);
$table->string('payment_status', 50);
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
$table->foreign('user_id')->references('id')->on('users');
```

#### ব্যাখ্যা:

- `$table->bigInteger('user_id')->unsigned()`: ইউজারের আইডি সংরক্ষণ করবে, যা `users` টেবিলের সাথে সম্পর্কিত।
- `$table->decimal('amount', 8, 2)`: এখানে পেমেন্টের পরিমাণ সংরক্ষণ করবে। ৮ ডিজিট এবং ২ ডিজিট দশমিকের জন্য রাখা হয়েছে (যেমন 99999.99)।

- `$table->string('payment_method', 100)`: পেমেন্ট করার পদ্ধতির তথ্য সংরক্ষণ করবে, যেমন "Credit Card", "PayPal" ইত্যাদি।

- `$table->string('payment_status', 50)`: পেমেন্ট স্ট্যাটাস, যেমন "Completed", "Pending", "Failed" ইত্যাদি সংরক্ষণ করবে।

- `foreign('user_id')->references('id')->on('users')`: ইউজারের আইডি কে `users` টেবিলের সাথে রিলেট করা হয়েছে, যাতে কে পেমেন্ট করেছে তা জানা যায়।

---

### 9. Orders Table

```php
$table->id();
$table->bigInteger('user_id')->unsigned();
$table->decimal('total_price', 8, 2);
$table->string('order_status', 50);
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
$table->foreign('user_id')->references('id')->on('users');
```

#### ব্যাখ্যা:

- `$table->bigInteger('user_id')->unsigned()`: অর্ডার কার ইউজারের তা বোঝানোর জন্য ইউজারের আইডি রাখা হয়েছে।

- `$table->decimal('total_price', 8, 2)`: মোট মূল্য সংরক্ষণ করবে, যাতে অর্ডারের সব প্রোডাক্টের মূল্য অন্তর্ভুক্ত থাকে।

- `$table->string('order_status', 50)`: অর্ডারের স্ট্যাটাস সংরক্ষণ করবে, যেমন "Shipped", "Pending", "Delivered" ইত্যাদি।

- `foreign('user_id')->references('id')->on('users')`: ইউজার টেবিলের সাথে রিলেট করা হয়েছে, যাতে অর্ডার কে করেছে তা চিহ্নিত করা যায়।

---

### 10. Order_Items Table

```php
$table->id();
$table->bigInteger('order_id')->unsigned();
$table->bigInteger('product_id')->unsigned();
$table->integer('quantity');
$table->decimal('price', 8, 2);
$table->foreign('order_id')->references('id')->on('orders');
$table->foreign('product_id')->references('id')->on('products');
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

#### ব্যাখ্যা:

- `$table->bigInteger('order_id')->unsigned()`: অর্ডারের আইডি সংরক্ষণ করবে, যা `orders` টেবিলের সাথে সম্পর্কিত।

- `$table->bigInteger('product_id')->unsigned()`: প্রোডাক্টের আইডি সংরক্ষণ করবে, যা `products` টেবিলের সাথে সম্পর্কিত।

- `$table->integer('quantity')`: কতগুলো প্রোডাক্ট অর্ডারে আছে তা সংরক্ষণ করবে।

- `$table->decimal('price', 8, 2)`: প্রতিটি প্রোডাক্টের জন্য মূল্য সংরক্ষণ করবে।

- `foreign('order_id')->references('id')->on('orders')`: অর্ডার আইডিকে `orders` টেবিলের সাথে রিলেট করা হয়েছে।

- `foreign('product_id')->references('id')->on('products')`: প্রোডাক্ট আইডিকে `products` টেবিলের সাথে রিলেট করা হয়েছে।

---

### সংক্ষেপে, এই প্রতিটি টেবিল এবং তাদের ফিল্ডগুলো Laravel মাইগ্রেশন কোডে ব্যবহৃত হয়েছে একটি সম্পূর্ণ ডেটাবেস স্ট্রাকচার তৈরি করার জন্য। প্রতিটি টেবিল একে অপরের সাথে সম্পর্কিত এবং একত্রে একটি পূর্ণাঙ্গ ই-কমার্স সিস্টেমের ডেটাবেস তৈরির জন্য প্রয়োজনীয় সব কিছু সংরক্ষণ করে।
