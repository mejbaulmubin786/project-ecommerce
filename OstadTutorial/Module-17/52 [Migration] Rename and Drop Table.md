টেবিল রিনেইম এবং ড্রপ করার কাজ Laravel মাইগ্রেশনের মাধ্যমে খুব সহজে করা যায়। মাইগ্রেশন Laravel এর একটি শক্তিশালী ফিচার যা ডাটাবেস স্কিমা ম্যানেজ করতে সাহায্য করে। এর মাধ্যমে ডাটাবেসের টেবিল তৈরি, রিনেইম, ড্রপ, এবং বিভিন্ন স্ট্রাকচারাল পরিবর্তন খুব সহজে করা যায়। এখানে দেখানো হবে কিভাবে টেবিলের নাম পরিবর্তন (রিনেইম) এবং ড্রপ করা যায়।

### টেবিল রিনেইম করা

#### ১. মাইগ্রেশন ফাইল তৈরি

Laravel মাইগ্রেশন তৈরি করতে আপনাকে `php artisan make:migration` কমান্ড ব্যবহার করতে হবে। আমরা যদি একটি টেবিলের নাম `profiles` থেকে `user_profiles` করতে চাই, তাহলে নিচের মতো মাইগ্রেশন ফাইল তৈরি করা যাবে:

```bash
php artisan make:migration rename_profiles
```

এটি চালানোর পর, Laravel একটি মাইগ্রেশন ফাইল তৈরি করবে, যা `database/migrations` ফোল্ডারে থাকবে। এবার আমাদের রিনেইম করার কোডটি লিখতে হবে `up()` মেথডের ভেতর।

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // টেবিলের নাম পরিবর্তন করা
        Schema::rename('profiles', 'user_profiles');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // পূর্বের অবস্থায় ফেরত আনা
        Schema::rename('user_profiles', 'profiles');
    }
};
```

#### ব্যাখ্যা:

-   `Schema::rename('profiles', 'user_profiles');` এর মাধ্যমে আমরা `profiles` টেবিলের নাম পরিবর্তন করে `user_profiles` করেছি।
-   `down()` মেথডে, যদি আমরা কখনো মাইগ্রেশন রিভার্স করতে চাই, তাহলে টেবিলের নাম আবার পূর্বের অবস্থায় ফেরত আনতে পারবো।

#### ২. মাইগ্রেশন চালানো

মাইগ্রেশনটি চালানোর জন্য কমান্ডটি ব্যবহার করতে হবে:

```bash
php artisan migrate
```

এটি মাইগ্রেশন চালিয়ে টেবিলের নাম পরিবর্তন করে দেবে।

---

### টেবিল ড্রপ করা

#### ১. মাইগ্রেশন ফাইল তৈরি

একটি টেবিল ড্রপ করতে হলে আমরা `php artisan make:migration` কমান্ডটি ব্যবহার করে একটি ড্রপ মাইগ্রেশন তৈরি করবো। যেমন, যদি আমরা `user_profiles` টেবিলটি ড্রপ করতে চাই, তাহলে নিচের কমান্ডটি ব্যবহার করবো:

```bash
php artisan make:migration drop_user_profiles
```

এবার তৈরি হওয়া মাইগ্রেশন ফাইলে নিচের মতো কোড লিখতে হবে:

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // টেবিল ড্রপ করা
        Schema::dropIfExists('user_profiles');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // ড্রপ হওয়া টেবিল পুনরায় তৈরি করা, তবে সাধারণত এটি প্রয়োজন হয় না
        Schema::create('user_profiles', function (Blueprint $table) {
            $table->id();
            // অন্য টেবিলের কলামগুলো এখানে উল্লেখ করতে হবে
        });
    }
};
```

#### ব্যাখ্যা:

-   `Schema::dropIfExists('user_profiles');` মেথডটি ব্যবহার করে আমরা `user_profiles` টেবিলটি ড্রপ করছি।
-   `down()` মেথডে টেবিলটি আবার তৈরি করার জন্য `Schema::create()` মেথড ব্যবহার করা হয়েছে, তবে সাধারণত ড্রপ মাইগ্রেশন রিভার্স করার দরকার হয় না।

#### ২. মাইগ্রেশন চালানো

ড্রপ মাইগ্রেশনটি চালানোর জন্য নিচের কমান্ডটি ব্যবহার করতে হবে:

```bash
php artisan migrate
```

---

### উপসংহার

Laravel মাইগ্রেশন ব্যবহারে টেবিল রিনেইম এবং ড্রপ করা খুবই সহজ এবং স্ট্রাকচারাল পরিবর্তনগুলোর জন্য একটি রোলব্যাক অপশন থাকে। রিনেইমের জন্য `Schema::rename()` এবং ড্রপ করার জন্য `Schema::dropIfExists()` মেথড ব্যবহার করতে হয়।
