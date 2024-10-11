এবার আমরা দেখবো কি করে টেবিলে আমরা নতুন কলাম যুক্ত করতে পারি, কিভাবে কলাম ড্রফ করতে পারি, কলাম রিনেইম করতে পারি ।

আমরা প্রথম একটি সাধারণ টেবিল তৈরি করে নিচ্ছি

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
            $table->bigIncrements('id');
            $table->boolean('is_bangladeshi');
            $table->bigInteger('vote');
            $table->binary('photo');
            $table->char('name', 50);
            $table->dateTime('vote_date_time');
            $table->date('voting_date');
            $table->double('population', 8, 2);
            $table->enum('group', ['A', 'B']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('profiles');
    }
};
```

এখন আমি যদি চাই আমার এই টেবিলে নতুন কলাম যুক্ত করবো । টেবিল যখন আমরা ক্রিয়েট করি তখন আমরা Schema এর create মেথড কে কল করি কিন্তু আমরা যখন কোন টেবেলকে মডিফাই করবো যেমন টেবিল কে রিনেইম করবো বা টেবিলে কলাম যুক্ত করবো বা কোন কলাম ড্রফ করবো । টেবিল কে কমান্ড php artisan make:migration add_column_to_profiles
