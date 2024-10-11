এবার আমরা শিখবো কি করে টেবিল রিনেইম করতে হয় এবং টেবিল ড্রপ করতে হয়। আমরা সবসময় নেমিং কনভেনশন ফলো করেই মাইগ্রেশন ফাইল জেনারেইট করবো। যেমন `_rename_profiles.php` drop

আমরা যখন php artisan make:migration rename_profiles কমান্ডটি দেবো তখন লারাভেল আমাদের প্রয়োজনিয় ফাইল তৈরি করে দিবে যেখানে রিনেইম এর জন্য দরকারি গুলোই থাকবে।

```php

public function up():void{
    schema::rename("profile", "user_profile");


}
```

একই ভাবে আমরা যখন

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
        //
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
```

এখন টেবিল রিনেইম এর জন্য আমাকে public function up() ফাংশনে ব্যবহার করবো ‍Schema এর থেকে rename() মেথড। এর ভেতর বর্তমান টেবিলের নাম ও আমরা যেই নামে টেবিল টিকে চাই তা দিতে হবে। যেমন আমাদের Schema::rename('profiles', 'new_profiles');
এখন টেবিল টিকে ডিলেট করেতে চাইলে php artisan make:migration drop_profiles

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
        //
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};

```

এখন টেবিল ড্রপ এর জন্য আমাকে public function up() ফাংশনে ব্যবহার করবো ‍Schema এর থেকে drop() অর্থবা dropIfExists() মেথড। এর ভেতর বর্তমান টেবিলের নাম । যেমন আমাদের Schema::rename('new_profiles');
এখন টেবিল টিকে ডিলেট করেতে চাইলে php artisan make:migration drop_profiles
আমাদের সকল কার্যক্রম কিন্তু আমাদের migrations ফািইলে থেকে যায়।
