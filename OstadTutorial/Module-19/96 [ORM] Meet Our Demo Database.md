## Laravel Eloquent ORM এর সম্পর্ক সমূহ এবং Demo ডাটাবেস বিশ্লেষণ

আমরা এখানে Laravel এর Eloquent ORM ব্যবহার করে বিভিন্ন সম্পর্ক তৈরি করবো দুটি ডেমো ডাটাবেসের উপর ভিত্তি করে। প্রথম ডাটাবেসটি হলো `demo1`, যা একটি সিম্পল ব্লগ সিস্টেমের জন্য এবং দ্বিতীয়টি `demo2`, যা ছোটখাটো একটি ইনভেনটরি ম্যানেজমেন্ট বা ই-কমার্স সিস্টেমের জন্য তৈরি করা হয়েছে। Laravel ORM-এর সাহায্যে আমরা **one-to-one**, **one-to-many**, **many-to-many** এবং **inverse** সম্পর্ক সহজে পরিচালনা করতে পারি। এবার প্রতিটি সম্পর্ক কিভাবে কাজ করে তা ধারাবাহিকভাবে দেখবো।

---

### ১. Demo Database 1: Simple Blog

এই ডাটাবেসটিতে `users`, `profiles`, `posts`, `comments`, `tags`, এবং `post_tags` টেবিল আছে। এখানে সম্পর্কগুলোর বিবরণ নিচে দেওয়া হলো:

- **User এবং Profile**:

  - **প্রকার**: One-to-One
  - **বিবরণ**: প্রতিটি ইউজারের একটি করে প্রোফাইল থাকে এবং প্রতিটি প্রোফাইল শুধুমাত্র একটি ইউজারের জন্যই তৈরি।
  - **Inverse**: প্রোফাইল থেকে ইউজারকে বের করা যাবে।

- **User এবং Posts**:

  - **প্রকার**: One-to-Many
  - **বিবরণ**: একটি ইউজারের একাধিক পোস্ট থাকতে পারে, কিন্তু প্রতিটি পোস্ট কেবলমাত্র একটি ইউজারের অধীনে থাকবে।
  - **Inverse**: প্রতিটি পোস্ট থেকে ইউজার বের করা যাবে।

- **Post এবং Comments**:

  - **প্রকার**: One-to-Many
  - **বিবরণ**: একটি পোস্টে একাধিক মন্তব্য থাকতে পারে, কিন্তু প্রতিটি মন্তব্য শুধুমাত্র একটি পোস্টের জন্য।
  - **Inverse**: মন্তব্য থেকে পোস্ট বের করা যাবে।

- **Post এবং Tags**:
  - **প্রকার**: Many-to-Many
  - **বিবরণ**: একটি পোস্টে একাধিক ট্যাগ থাকতে পারে এবং একটি ট্যাগ একাধিক পোস্টে থাকতে পারে।
  - **Pivot Table**: এই সম্পর্ক `post_tags` পিভট টেবিলের মাধ্যমে তৈরি করা হয়।

### Demo1 এর মডেল এবং সম্পর্ক স্থাপন

Laravel এর কনভেনশন অনুযায়ী, আমরা প্রতিটি টেবিলের জন্য মডেল তৈরি করবো `php artisan make:model` কমান্ড দিয়ে এবং মডেলে সম্পর্কগুলো সংজ্ঞায়িত করবো। উদাহরণস্বরূপ, `User` মডেলে সম্পর্ক স্থাপন করা হবে নিম্নরূপ:

```bash
php artisan make:model User
```

এরপর `User` মডেলে সম্পর্কগুলো সংজ্ঞায়িত করা হবে:

```php
// app/Models/User.php

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    public function profile()
    {
        return $this->hasOne(Profile::class); // Profile এর সাথে One-to-One সম্পর্ক
    }

    public function posts()
    {
        return $this->hasMany(Post::class); // Post এর সাথে One-to-Many সম্পর্ক
    }
}
```

এভাবেই `Profile` মডেলে Inverse সম্পর্ক সংজ্ঞায়িত করা হবে:

```php
// app/Models/Profile.php

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class); // Inverse One-to-One সম্পর্ক
    }
}
```

---

### ২. Demo Database 2: Inventory Management / E-commerce

এই ডাটাবেসটিতে `products`, `categories`, `brands`, `product_details`, `product_reviews` ইত্যাদি টেবিল আছে। এখানে সম্পর্কগুলো হলো:

- **Product এবং Category**:

  - **প্রকার**: Many-to-One
  - **বিবরণ**: প্রতিটি পণ্য একটি ক্যাটাগরির অন্তর্ভুক্ত, কিন্তু একটি ক্যাটাগরিতে একাধিক পণ্য থাকতে পারে।
  - **Inverse**: একটি ক্যাটাগরি থেকে সেই ক্যাটাগরির অধীনে থাকা সব পণ্য বের করা যাবে।

- **Product এবং Brand**:

  - **প্রকার**: Many-to-One
  - **বিবরণ**: প্রতিটি পণ্য একটি ব্র্যান্ডের অন্তর্ভুক্ত, কিন্তু একটি ব্র্যান্ডে একাধিক পণ্য থাকতে পারে।

- **Product এবং Reviews**:

  - **প্রকার**: One-to-Many
  - **বিবরণ**: প্রতিটি পণ্যের একাধিক রিভিউ থাকতে পারে, কিন্তু প্রতিটি রিভিউ একটি পণ্যকে অন্তর্ভুক্ত করে।

- **Product এবং Product Details**:
  - **প্রকার**: One-to-One
  - **বিবরণ**: প্রতিটি পণ্যের একটি নির্দিষ্ট বিস্তারিত তথ্য আছে, যেমন ছবিসমূহ, বর্ণনা। প্রতিটি `product_details` এন্ট্রি শুধুমাত্র একটি পণ্যের সাথে সংযুক্ত।

### Demo2 এর মডেল এবং সম্পর্ক

Laravel কনভেনশন অনুসারে, প্রতিটি মডেলের জন্য কমান্ড দিয়ে মডেল তৈরি করে সম্পর্ক সংজ্ঞায়িত করা হবে। উদাহরণস্বরূপ, `Product` মডেল তৈরি এবং সম্পর্ক সংজ্ঞায়িত করার পদ্ধতি:

```bash
php artisan make:model Product
```

`Product` মডেলে সম্পর্কগুলো সংজ্ঞায়িত হবে:

```php
// app/Models/Product.php

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public function category()
    {
        return $this->belongsTo(Category::class); // Category এর সাথে Many-to-One সম্পর্ক
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class); // Brand এর সাথে Many-to-One সম্পর্ক
    }

    public function reviews()
    {
        return $this->hasMany(ProductReview::class); // ProductReview এর সাথে One-to-Many সম্পর্ক
    }

    public function details()
    {
        return $this->hasOne(ProductDetail::class); // ProductDetail এর সাথে One-to-One সম্পর্ক
    }
}
```

---

### গুরুত্বপূর্ণ পয়েন্টগুলোর সারসংক্ষেপ

- **One-to-One**: `hasOne` এবং `belongsTo` ব্যবহার করা হয়।
- **One-to-Many**: `hasMany` এবং `belongsTo` ব্যবহার করা হয়।
- **Many-to-Many**: দুই মডেলে `belongsToMany` ব্যবহার করা হয়।
- **Inverse সম্পর্ক**: উলটো সম্পর্কের জন্য `belongsTo` ব্যবহার করা হয়।

## এই পদ্ধতিতে আমরা Laravel Eloquent ORM এর সম্পর্কগুলোর সাথে কাজ করতে পারি। মডেল, মাইগ্রেশন এবং সম্পর্কগুলো তৈরি করার পর, টেস্টিং করার জন্য আপনি Laravel Tinker বা Controller এর মাধ্যমে সরাসরি ডেটা রিট্রিভ করতে পারেন।

---

এর আগে আমরা আলোচনা করেছিলাম মডেল এর বিভিন্ন কনভেনশন নিয়ে। এখন আমরা Eloquent ORM এর ভেতর আমরা বিভিন্ন ফিচার গুলো আছে সেগুলো একটির পর একটি প্রোকটিস করবো এর জন্য আমরা দুটি ডেমো ডাটাবেইজ নিয়েছি যার ভেতর আমি বেশ কিচু ডেমো ডাটা তৈরি করে নিয়েছি। তার ভেতর একটি ডেমো হচ্ছে সিম্পল ব্লগ যার ভেতর আছে users, সেই ইউজার এর profiles আছে আরো আছে তার posts সেই পোস্ট এর এগিনেস্ট comments আছে tags আছে সেই পোস্ট এর এগিনেস্ট আবার বিভিন্ন টেগ কে সযুক্ত করা আছে post_tags, এখানে আমরা যদি ইউজাস এর সাথে প্রোফাইল এর সম্পর্ক দেখি তা হচ্ছে one to one রিলেশনশিপ । আবার ইউজার এর সাথে পোস্ট এর সম্পর্ক ওয়ন টু মেনি। আবার পেস্ট এর সাথে কমেন্টস এর সম্পর্ক ওয়ান টু মেনি,

আরো একটি ডাটাবেইজ আমরা ব্যবহার করবো একজাম্পল এর ক্ষেত্রে সেটা একটি ছোট ইনভেনটরি মেনেজমেন্ট বা ছোট একটি ইকমার্স এর ডাটাবেইজ। এটি আমার ইআর ডায়াগ্রাম এর দ্বিতীয় টির কথা বলছি। সে হিসেবে রিলেশন শিপ গুলো আলো চনা করবেন প্রথমটি আমি কিচু আলোচনা করেছি আপনি বাকি গুলো সহ সুন্দর করে নিজের মতো করে বলবেন। ওয়ান টু ওয়ান বা এই রকম সম্পর্ক যা যা আছে সেগুলোর আবার উলটো ও কিছু থাকে যাদের বলে ইনভার্স সেই সম্পর্কও আছে এখানে। ধরুন আমাদের প্রথম ডাটাবেইজ demo1 এর users টেবিলের জন্য আমি মডেল তৈরি করবো তবে কমান্ড হবে php artisan make:model User এখানে আমরা অবশ্যই কনভেনশন ফলো করবো।
