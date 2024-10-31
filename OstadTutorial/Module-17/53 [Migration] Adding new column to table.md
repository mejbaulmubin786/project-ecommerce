আপনার লারাভেলে একটি টেবিলে নতুন কলাম যুক্ত করা, ড্রপ করা বা রিনেম করার পুরো প্রক্রিয়া নিয়ে একটি সুন্দর গাইড তৈরি করা যাক। এটি Laravel এ কাজ করার ক্ষেত্রে মাইগ্রেশনের মাধ্যমে টেবিল মডিফিকেশন সম্পর্কে পরিষ্কার ধারণা দিবে। চলুন ধাপে ধাপে এটি তৈরি করি:

### 1. টেবিল তৈরি করা

প্রথমে আমরা একটি সাধারণ `profiles` টেবিল তৈরি করবো যেখানে কয়েকটি প্রাথমিক কলাম থাকবে:

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
        Schema::create('profiles', function (Blueprint $table) {
            $table->bigIncrements('id'); // Primary key
            $table->string('name', 50);  // Name column
            $table->string('email');     // Email column
            $table->integer('age');      // Age column
            $table->timestamps();        // Created at and Updated at columns
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('profiles'); // Drop the profiles table
    }
};
```

এই মাইগ্রেশনের মাধ্যমে একটি `profiles` টেবিল তৈরি করা হয়েছে যেখানে `id`, `name`, `email`, এবং `age` কলাম রয়েছে।

---

### 2. নতুন কলাম যুক্ত করা

টেবিল তৈরি করার পর যদি আপনি নতুন কলাম যুক্ত করতে চান, তাহলে `Schema::table` ব্যবহার করতে হবে।

ধরুন আপনি `phone` এবং `address` নামে নতুন দুটি কলাম যুক্ত করতে চান এবং এগুলো `name` কলামের পরেই যুক্ত হবে। আপনি নিচের মতো একটি মাইগ্রেশন তৈরি করবেন:

**মাইগ্রেশন তৈরি করার কমান্ড:**

```bash
php artisan make:migration add_columns_to_profiles
```

এরপর তৈরি হওয়া মাইগ্রেশন ফাইলে নিচের মতো কোড লিখুন:

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
        Schema::table('profiles', function (Blueprint $table) {
            $table->string('phone')->after('name');   // Add 'phone' column after 'name'
            $table->string('address')->after('phone'); // Add 'address' column after 'phone'
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('profiles', function (Blueprint $table) {
            $table->dropColumn(['phone', 'address']); // Drop 'phone' and 'address' columns
        });
    }
};
```

#### টেবিলে নতুন কলাম যুক্ত করার মূল পয়েন্ট:

-   **`after('name')`**: নতুন কলামটি কোন বিদ্যমান কলামের পরে যুক্ত হবে তা নির্দেশ করতে ব্যবহার করা হয়।
-   **`dropColumn()`**: `down()` মেথডে এটি ব্যবহৃত হয় কলাম ড্রপ করার জন্য, যাতে আপনি মাইগ্রেশন রিভার্স করতে পারেন।

---

### 3. টেবিলের কোনো কলাম ড্রপ করা

ধরুন আপনি `age` কলামটি টেবিল থেকে ড্রপ করতে চান। সেক্ষেত্রে মাইগ্রেশনে `dropColumn` মেথড ব্যবহার করতে হবে। নিচের মতো মাইগ্রেশন লিখতে পারেন:

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
        Schema::table('profiles', function (Blueprint $table) {
            $table->dropColumn('age'); // Drop 'age' column
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('profiles', function (Blueprint $table) {
            $table->integer('age'); // Recreate 'age' column
        });
    }
};
```

---

### 4. টেবিলের কোনো কলামের নাম পরিবর্তন করা (Rename)

Laravel এ কোনো কলামের নাম পরিবর্তন করতে হলে `renameColumn` মেথড ব্যবহার করতে হবে। ধরুন, আপনি `name` কলামের নাম পরিবর্তন করে `full_name` করতে চান। তাহলে মাইগ্রেশনে নিচের মতো কোড লিখতে হবে:

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
        Schema::table('profiles', function (Blueprint $table) {
            $table->renameColumn('name', 'full_name'); // Rename 'name' to 'full_name'
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('profiles', function (Blueprint $table) {
            $table->renameColumn('full_name', 'name'); // Reverse the renaming
        });
    }
};
```

#### কলামের নাম পরিবর্তন করতে Laravel এর ক্ষেত্রে:

-   **`renameColumn('old_name', 'new_name')`**: এটি পুরনো নামকে নতুন নামে পরিবর্তন করতে ব্যবহৃত হয়।
-   মনে রাখতে হবে, কখনও কখনও `renameColumn()` সাপোর্ট পেতে জন্য আপনার ডাটাবেসে প্রয়োজনীয় extension ইনস্টল থাকতে হবে (যেমন: Doctrine DBAL)।

---

### 5. মাইগ্রেশন রিভার্স করা

প্রত্যেক মাইগ্রেশনের একটি `up()` মেথড এবং একটি `down()` মেথড থাকে। `up()` মেথডে আপনি পরিবর্তনগুলো প্রয়োগ করেন এবং `down()` মেথডে আপনি সেই পরিবর্তনগুলো উল্টো করতে পারেন।

**মাইগ্রেশন চালানোর জন্য কমান্ড:**

```bash
php artisan migrate
```

**মাইগ্রেশন রিভার্স করার জন্য কমান্ড:**

```bash
php artisan migrate:rollback
```

---

### উপসংহার

Laravel এ মাইগ্রেশনের মাধ্যমে টেবিলের বিভিন্ন কাজ খুবই সহজ:

-   **নতুন টেবিল তৈরি করা**: `Schema::create()` ব্যবহার করে।
-   **নতুন কলাম যুক্ত করা**: `Schema::table()` ব্যবহার করে, সাথে `after()` এর মতো ফাংশন ব্যবহার করে আপনি সুনির্দিষ্ট জায়গায় কলাম যুক্ত করতে পারেন।
-   **কলাম ড্রপ করা**: `dropColumn()` ব্যবহার করে।
-   **কলাম রিনেম করা**: `renameColumn()` ব্যবহার করে।

এই প্রক্রিয়াগুলো Laravel মাইগ্রেশনে টেবিল এবং এর স্ট্রাকচার ম্যানেজ করার জন্য গুরুত্বপূর্ণ।
