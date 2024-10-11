| Column Type       | Description                                                                                                                | Example                                           |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| `bigIncrements()` | The `bigIncrements` method creates an auto-incrementing UNSIGNED BIGINT (primary key) equivalent.                          | `$table->bigIncrements('id');`                    |
| `bigInteger()`    | The `bigInteger` method creates a BIGINT equivalent.                                                                       | `$table->bigInteger('votes');`                    |
| `binary()`        | The `binary` method creates a BLOB equivalent.                                                                             | `$table->binary('photo');`                        |
| `boolean()`       | The `boolean` method creates a BOOLEAN equivalent column.                                                                  | `$table->boolean('confirmed');`                   |
| `char()`          | The `char` method creates a CHAR equivalent column with a given length.                                                    | `$table->char('name', 100);`                      |
| `dateTime()`      | The `dateTime` method creates a DATETIME equivalent column with an optional precision (total digits).                      | `$table->dateTime('created_at', $precision = 0);` |
| `date()`          | The `date` method creates a DATE equivalent.                                                                               | `$table->date('created_at');`                     |
| `double()`        | The `double` method creates a DOUBLE equivalent column with the given precision (total digits) and scale (decimal digits). | `$table->double('amount', 8, 2);`                 |
| `enum()`          | The `enum` method creates an ENUM equivalent column with the given valid values.                                           | `$table->enum('difficulty', ['easy', 'hard']);`   |

আমরা Laravel মাইগ্রেশন ব্যবহার করে একটি টেবিল তৈরি করব এবং বিভিন্ন ডেটা টাইপের কলামগুলো কীভাবে কাজ করে তা ব্যাখ্যা করব।

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
        // টেবিল তৈরি করা হচ্ছে
        Schema::create('profiles', function (Blueprint $table) {
            $table->bigIncrements('id'); // একটি অটো ইনক্রিমেন্টিং প্রাইমারি কী
            $table->boolean('is_bangladeshi'); // বুলিয়ান ডেটা, হ্যাঁ/না বা সত্য/মিথ্যা মানের জন্য
            $table->bigInteger('vote'); // বড় ইন্টিজার ডেটা, যা বড় সংখ্যার জন্য ব্যবহৃত হয়
            $table->binary('photo'); // বাইনারি ডেটা, সাধারণত ছবি বা বড় ফাইল সংরক্ষণের জন্য
            $table->char('name', 50); // নির্দিষ্ট আকারের স্ট্রিং ডেটা, ৫০ ক্যারেক্টারের জন্য
            $table->dateTime('vote_date_time'); // তারিখ এবং সময় একসাথে ধরে রাখতে ব্যবহৃত
            $table->date('voting_date'); // শুধুমাত্র তারিখ ধরে রাখার জন্য ব্যবহৃত
            $table->double('population', 8, 2); // ডাবল ডেটা টাইপ, দশমিকের পরে দুই ডিজিট সহ
            $table->enum('group', ['A', 'B']); // এনাম টাইপ, পূর্বনির্ধারিত কিছু মানের মধ্যে সীমিত
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // টেবিলটি ড্রপ করা হচ্ছে
        Schema::dropIfExists('profiles');
    }
};

```

### ব্যাখ্যা:

1. **`up()` মেথড**: এখানে Laravel মাইগ্রেশন কিভাবে কাজ করে তা বোঝানো হয়েছে। আপনি `Schema::table('profiles')` ব্যবহার করে টেবিলে নতুন কলাম যোগ করছেন। এই কলামগুলো বিভিন্ন ডেটা টাইপের, যেমন:

    - **`bigIncrements('id')`**: এটি একটি প্রাইমারি কী তৈরি করে যা বড় ইন্টিজার আকারে হবে এবং স্বয়ংক্রিয়ভাবে বাড়তে থাকবে।
    - **`boolean('is_bangladeshi')`**: এটি একটি বুলিয়ান টাইপ কলাম, যা হ্যাঁ (True) বা না (False) রাখে।
    - **`bigInteger('vote')`**: বড় সংখ্যার জন্য একটি ইন্টিজার ব্যবহার করা হয়।
    - **`binary('photo')`**: এটি বাইনারি ডেটা যেমন ছবি বা ফাইল সংরক্ষণ করতে ব্যবহৃত হয়।
    - **`char('name', 50)`**: এটি একটি স্ট্রিং ডেটা যা সর্বাধিক ৫০ ক্যারেক্টার ধারণ করবে।
    - **`dateTime('vote_date_time')`**: এটি একটি তারিখ এবং সময় একসাথে সংরক্ষণ করতে ব্যবহৃত হয়।
    - **`date('voting_date')`**: এটি শুধুমাত্র তারিখ সংরক্ষণ করতে ব্যবহৃত হয়।
    - **`double('population', 8, 2)`**: দশমিক সংখ্যা সহ একটি ভ্যালু সংরক্ষণ করতে ব্যবহৃত হয় (মোট ৮ ডিজিট, দশমিকের পর ২ ডিজিট)।
    - **`enum('group', ['A', 'B'])`**: এটি এনাম টাইপ, যেখানে কেবল নির্দিষ্ট কিছু মান (এখানে 'A' বা 'B') থেকে একটি নির্বাচন করতে হবে।

2. **`down()` মেথড**: মাইগ্রেশন রোলব্যাকের সময় এই মেথডটি চালিত হয়। এখানে টেবিল থেকে কোনো একটি নির্দিষ্ট কলাম মুছে দেওয়ার জন্য ব্যবহৃত হয়েছে।

এখন, আপনি যখন `php artisan migrate` চালাবেন, তখন এই স্কিমা অনুযায়ী আপনার ডেটাবেজে টেবিল তৈরি হবে।
