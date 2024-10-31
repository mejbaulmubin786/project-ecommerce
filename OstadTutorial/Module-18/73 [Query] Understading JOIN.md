`JOIN` ক্লজের মাধ্যমে Laravel Query Builder-এ একাধিক টেবিলকে একসাথে যুক্ত করে বিভিন্ন তথ্য পেতে পারি। Laravel এ `JOIN` এর বিভিন্ন ধরণ রয়েছে, যেমন: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, এবং `CROSS JOIN`। এগুলোকে কার্যকরভাবে ব্যবহার করার জন্য আমাদের টেবিলগুলোর মধ্যে সম্পর্ক (relationship) বুঝতে হবে। এই উদাহরণে, আমরা `categories`, `products`, এবং `brands` টেবিলগুলো নিয়ে কাজ করবো।

Laravel ডাটাবেজের এই তিনটি টেবিলের মধ্যে সম্পর্ক নিচের মতো:

1. `categories` টেবিলের সাথে `products` টেবিলের একটি "One-to-Many" সম্পর্ক রয়েছে।
2. `brands` টেবিলের সাথে `products` টেবিলেরও একটি "One-to-Many" সম্পর্ক রয়েছে।

এই সম্পর্কের ভিত্তিতে আমরা বিভিন্ন ধরনের `JOIN` ব্যবহার করে ডাটা ফেচ করতে পারি।

### টেবিলের সম্পর্ক (ERD অনুযায়ী):

- `products` টেবিলে `category_id` এবং `brand_id` নামের দুটি ফরেন কী রয়েছে, যা `categories` এবং `brands` টেবিলের প্রাইমারি কীগুলোর সাথে সম্পর্কিত।
- এই সম্পর্কগুলো কাজে লাগিয়ে আমরা `JOIN` ব্যবহার করে প্রয়োজনীয় ডাটা সংগ্রহ করতে পারি।

### Laravel এ `INNER JOIN` এর ব্যবহার

`INNER JOIN` ব্যবহারে শুধুমাত্র এমন রেকর্ডগুলো রিটার্ন হয় যেগুলো সকল টেবিলে সম্পর্কযুক্ত। অর্থাৎ, `products`, `categories`, এবং `brands` টেবিলে সম্পর্কযুক্ত রেকর্ডগুলোই আমরা পাবো।

**Example: `INNER JOIN` কোয়েরি**

```php
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class DemoController extends Controller {
    public function DemoAction() {
        // INNER JOIN ব্যবহার করে products, categories, এবং brands টেবিলের সাথে সম্পর্কযুক্ত ডাটা ফেচ করা
        $products = DB::table('products')
            ->join('categories', 'products.category_id', '=', 'categories.id') // category_id কে categories টেবিলের id এর সাথে মিলানো
            ->join('brands', 'products.brand_id', '=', 'brands.id')           // brand_id কে brands টেবিলের id এর সাথে মিলানো
            ->get();

        return $products;
    }
}
```

### কিভাবে কোডটি কাজ করছে:

1. `DB::table('products')` দিয়ে আমরা প্রথমে `products` টেবিল থেকে ডাটা ফেচ করছি।
2. প্রথম `join()` মেথডটি `categories` টেবিলের সাথে `products` টেবিলকে যুক্ত করেছে, যেখানে `products.category_id` এবং `categories.id` সম্পর্কযুক্ত।
3. দ্বিতীয় `join()` মেথডটি `brands` টেবিলের সাথে `products` টেবিলকে যুক্ত করেছে, যেখানে `products.brand_id` এবং `brands.id` সম্পর্কযুক্ত।

এভাবে `INNER JOIN` এর মাধ্যমে আমরা এমন সকল প্রোডাক্টের তথ্য পাবো যেগুলোর সাথে `categories` এবং `brands` টেবিলের সম্পর্ক রয়েছে।

### Laravel এ অন্যান্য JOINs

#### ১. `LEFT JOIN`

`LEFT JOIN` ব্যবহার করলে প্যারেন্ট টেবিল (`products`) এর সব রেকর্ড এবং সম্পর্কযুক্ত চাইল্ড টেবিল (`categories`, `brands`) এর রেকর্ড পাওয়া যাবে। প্যারেন্ট টেবিলের সাথে চাইল্ড টেবিলের রেকর্ড না মিললেও `NULL` রিটার্ন করবে।

#### ২. `RIGHT JOIN`

`RIGHT JOIN` ব্যবহার করলে চাইল্ড টেবিল (`categories`, `brands`) এর সব রেকর্ড এবং সম্পর্কযুক্ত প্যারেন্ট টেবিল (`products`) এর রেকর্ড পাওয়া যাবে। চাইল্ড টেবিলের সাথে প্যারেন্ট টেবিলের রেকর্ড না মিললেও `NULL` রিটার্ন করবে।

#### ৩. `CROSS JOIN`

`CROSS JOIN` এ দুইটি টেবিলের সকল কম্বিনেশন রিটার্ন হয়। অর্থাৎ, প্যারেন্ট এবং চাইল্ড টেবিলের সব রেকর্ড ক্রস-কম্বিনেশনে আসে।

### উপসংহার

এই আলোচনায় `INNER JOIN` সহ Laravel এ JOIN এর বিভিন্ন ধরনের কার্যকর ব্যবহার নিয়ে ধারণা দেওয়া হলো। প্রতিটি JOIN-কে সঠিকভাবে বুঝে প্রয়োগ করলে আমরা বিভিন্ন সম্পর্কযুক্ত ডাটা সহজেই রিটার্ন করতে পারি। `JOIN` মেথডগুলো প্যারেন্ট এবং চাইল্ড টেবিলের প্রাইমারি ও ফরেন কী-র সম্পর্ক অনুসারে সম্পর্কযুক্ত রেকর্ডগুলোকেই সিলেক্ট করতে সাহায্য করে।

---

এবার থেকে আমরা আলোচনা করবো JOIN নিয়ে। এর মাধ্যমে আরা একটি টেবিলের সাথে আর েএকটি টেবিলের কয়েক রকমের জয়েন দিতে পারি , Left Join, Right Join, Crose Join, ... আমরা এগুলো প্রেকটিস করার জন্য আমরা এই laravel ডাটাবেইজ এর তিনটি টেবিল নিয়ে কাজ করবো সেগুলো হলো categories, products, brand কারণ যেহেতু এদের মাঝে ঝয়েনিং এর সম্পর্ক আছে আমরা এটা কাজে লাগাবো। এই ডাটাবেইজ টির ERD ডায়াগ্রাম যদি আমরা লক্ষ্য করি তবে দেখবো এখানে categories টেবিলের সাথে products টেবিলের একটি ওয়ান টু মেনি জয়েন আছে আবার brand টেবিলের সাথে ও products টেবিলের ও একটি ওয়ান টু মেনি জয়েনিং আছে মানে বিষয়টা এমন যে একটি categories একটি প্রোডাক্ট এ থাকবে সেই কেটাগরি অন্য প্রোডাক্ট এ ও থাকতে পারে একই ভাবে products, brand এর বেলায় হবে। products টেবিলে আবার দেখা যায় দুটি ফরেন কি আছে categorie_id এবং brand_id অন্যদিকে categorie_id এবং brand_id হচ্ছে categories, brand টেবিলের প্রাইমারি কি। টেবিল গুলোর ফরেন কি ও প্রাইমারি কি এর মাঝে এই রিলেশন কাজে লাগিয়ে আমরা Left Join, Right Join, Crose Join, এগুলো আমরা প্রেকটিস করবো। এছাড়াও আমরা ডায়াগ্রাম থেকে আরো অনেক গুলো টেবিলের মাঝে অনেক রকম জয়েন দেখেতে পাই। এখন জয়েন আমরা দিবো কি করে। এর জন্য আমরা একটি কুয়েরি বুঝার চেষ্টা করি। যখন আমরা ইনার জয়েন দিচ্ছি বা অন্য যে কোন জয়েন দিচ্ছি লারাবেল এ স্ট্রেটেজি একই।
Inner Join

```php
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

// It's good to include the base Controller

class DemoController extends Controller {
    function DemoAction() {
        $products = DB::table('products')
            ->join('categories', 'products.category_id', '=', 'categories.id')
            ->join('brands', 'products.brand_id', '=', 'brands.id')
            ->get();

        return $products;
    }
}
```

প্রথমে আমরা ট্রেটেজি টা বুঝে নি তার পর আমরা এটি এক্সিকিউট করবো। এখানে আমরা একটি পেরেন্ট টেবিলেরর সাথে ধরে নিলাম products পেরেন্ট টেবিলেরর সাথে categories এবং brands চাইল্ড টেবিল এর সাথে জয়েন করার চেষ্টা করছি। প্রথমেই যে টেবিল গুলোর সাথে জয়েন হবে তাদের নাম যেমন, products, categories, brands। এর পর পেরেন্ট টেবিলের কোন কলামের সাথে জযেন হবে যেমন categories টেবিলের জন্য পেরেন্ট টেবিলের ফরেন কি হচ্ছে category_id এর জন্য আমরা লিখবো products.category_id এর পর আমরা একটি = সাইন দিচ্ছি কেননা রিলেশন শিপ এর ক্ষেত্রে আইডি আর আইডি অবশ্যই ম্যাচ করতে হবে এর পর যা করতে হবে চাইল্ড টেবিলের প্রাইমারি কি এখানে আমার চাইলন্ড টেবিল categories এর প্রাইমারি কি categories.id । একই ভাবে brands', 'products.brand_id', '=', 'brands.id' ।
