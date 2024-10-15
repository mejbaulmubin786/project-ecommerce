### 5. Products Table

```php
$table->id();
$table->string('title', 200);
$table->string('short_des', 500);
$table->string('price', 50);
$table->boolean('discount');
$table->string('discount_price', 50);
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
```

এই কোডটি একটি **Laravel Migration** ফাইলের অংশ, যেখানে একটি টেবিলের জন্য বিভিন্ন কলাম এবং তাদের বৈশিষ্ট্য সংজ্ঞায়িত করা হয়েছে। নিচে প্রতিটি অংশকে ভেঙে ভেঙে ব্যাখ্যা করা হলো:

---

### 1. **Primary Key (ID) তৈরি করা**

```php
$table->id();
```

-   এটি টেবিলের **প্রাইমারি কী** হিসেবে `id` কলাম তৈরি করে।
-   এই কলামটি স্বয়ংক্রিয়ভাবে ইনক্রিমেন্ট হয় এবং প্রতিটি রেকর্ডের জন্য একটি ইউনিক ভ্যালু ধারণ করে।

---

### 2. **টেক্সট কলাম তৈরি করা**

```php
$table->string('title', 200);
$table->string('short_des', 500);
$table->string('price', 50);
```

-   **`string()`** একটি ভ্যারচ্যারের (VARCHAR) মতো কাজ করে এবং সর্বোচ্চ সাইজ নির্ধারণ করা হয়।
    -   **`title`**: সর্বোচ্চ ২০০ ক্যারেক্টার পর্যন্ত স্ট্রিং ডেটা রাখতে পারবে।
    -   **`short_des`**: ৫০০ ক্যারেক্টার পর্যন্ত স্ট্রিং ডেটা ধারণ করবে।
    -   **`price`**: ৫০ ক্যারেক্টার পর্যন্ত প্রাইসের মান ধারণ করবে।

---

### 3. **বুলিয়ান এবং ফ্লোট কলাম তৈরি করা**

```php
$table->boolean('discount');
$table->string('discount_price', 50);
$table->boolean('stock');
$table->float('star');
```

-   **`boolean()`**: শুধু **`true`** অথবা **`false`** মান ধারণ করতে পারে।

    -   **`discount`**: পণ্যে ডিসকাউন্ট আছে কি না তা বোঝায়।
    -   **`stock`**: পণ্য স্টকে আছে কিনা সেটি ধারণ করবে।

-   **`float()`**: দশমিক সংখ্যা সংরক্ষণের জন্য ব্যবহার করা হয়।
    -   **`star`**: কোন পণ্যের রেটিং (যেমন: 4.5) সংরক্ষণ করবে।

---

### 4. **ENUM কলাম তৈরি করা**

```php
$table->enum('remark', ['popular', 'new', 'top', 'special', 'trending', 'regular']);
```

-   **`enum()`**: নির্দিষ্ট কিছু মানের মধ্যে একটি মান গ্রহণ করে।
    -   **`remark`** কলামটি কেবলমাত্র `'popular'`, `'new'`, `'top'`, `'special'`, `'trending'`, অথবা `'regular'` এর যেকোনো একটি মান রাখতে পারবে।

---

### 5. **Unsigned BigInteger কলাম তৈরি করা**

```php
$table->unsignedBigInteger('category_id');
$table->unsignedBigInteger('brand_id');
```

-   **`unsignedBigInteger()`** বড় আকারের পজিটিভ পূর্ণসংখ্যা সংরক্ষণ করে।
    -   **`category_id`**: পণ্যটি কোন ক্যাটাগরির অন্তর্ভুক্ত তা বোঝাবে।
    -   **`brand_id`**: পণ্যটির ব্র্যান্ডের আইডি ধারণ করবে।

---

### 6. **Foreign Key সম্পর্ক তৈরি করা**

ফরেন কি তৈরির সময় লক্ষ্য রাখতে হবে যে দুই কলামের মাঝে রিলেশন তৈরি করতে হবে তাদের ডাটা টাইপ যেন একই হয়।

```php
$table->foreign('category_id')->references('id')->on('categories')
    ->restrictOnDelete()
    ->cascadeOnUpdate();

$table->foreign('brand_id')->references('id')->on('brands')
    ->restrictOnDelete()
    ->cascadeOnUpdate();
```

-   **`foreign()`**: একটি **Foreign Key** সম্পর্ক তৈরি করে, যা অন্য টেবিলের **Primary Key** এর সাথে সংযুক্ত থাকে।

    -   **`category_id`**:

        -   **`categories`** টেবিলের **`id`** ফিল্ডের সাথে যুক্ত।
        -   **`restrictOnDelete()`**: এই ক্যাটাগরি ডিলিট করা নিষিদ্ধ, যতক্ষণ না এই রেকর্ড ব্যবহারকারী পণ্য মুছে ফেলে।
        -   **`cascadeOnUpdate()`**: **categories** টেবিলে **id** আপডেট হলে **category_id** তেও স্বয়ংক্রিয়ভাবে আপডেট হবে।

    -   **`brand_id`**:
        -   **`brands`** টেবিলের **`id`** এর সাথে যুক্ত।
        -   একই রকমভাবে **`restrictOnDelete()`** এবং **`cascadeOnUpdate()`** প্রয়োগ করা হয়েছে।

---

### 7. **Timestamp কলাম তৈরি করা**

```php
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

-   **`timestamp()`**: সময় সংরক্ষণের জন্য ব্যবহৃত হয় (যেমন `2024-10-15 12:30:45` এর মতো ফরম্যাট)।
    -   **`created_at`**: যখন রেকর্ড তৈরি হয়, তখনকার সময় **`useCurrent()`** দিয়ে স্বয়ংক্রিয়ভাবে ধরে।
    -   **`updated_at`**: যখন রেকর্ড আপডেট হয়, তখন সময় স্বয়ংক্রিয়ভাবে **`useCurrentOnUpdate()`** দ্বারা আপডেট হয়।

---

### **সংক্ষেপে**

এই মাইগ্রেশনটি একটি পণ্যের জন্য টেবিল তৈরি করছে, যেখানে পণ্যের শিরোনাম, মূল্য, ডিসকাউন্ট, স্টক, রেটিং, এবং এর সম্পর্কিত ক্যাটাগরি ও ব্র্যান্ডের আইডি সংরক্ষণ করা হচ্ছে। একইসাথে, ফোরেন কী দিয়ে সম্পর্ক তৈরি করা হয়েছে এবং রেকর্ডের সময় ট্র্যাক করার জন্য **timestamps** ব্যবহার করা হয়েছে।
