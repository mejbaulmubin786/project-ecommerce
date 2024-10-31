### 6. Product Details Table

```php
$table->id();
$table->string('img1', 200);
$table->string('img2', 200);
$table->string('img3', 200);
$table->string('img4', 200);
$table->longText('des');
$table->string('color', 200);
$table->string('size', 200);

$table->unsignedBigInteger('product_id')->unique();
$table->foreign('product_id')->references('id')->on('products')
    ->restrictOnDelete()
    ->restrictOnUpdate();

$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

এই কোডটি একটি **Laravel Migration** ফাইলের অংশ, যেখানে একটি টেবিলের জন্য বিভিন্ন কলাম এবং তাদের বৈশিষ্ট্য সংজ্ঞায়িত করা হয়েছে। আমরা এটি ধাপে ধাপে বিশ্লেষণ করে দেখব।

---

## 1. **Primary Key (ID) তৈরি করা**

```php
$table->id();
```

-   এটি **Primary Key** হিসেবে একটি `id` কলাম তৈরি করে।
-   Laravel-এর `id()` মেথডটি স্বয়ংক্রিয়ভাবে **বড় পূর্ণসংখ্যা (big integer)** ব্যবহার করে এবং **Auto-Increment** এর মাধ্যমে প্রতিটি নতুন রেকর্ডের জন্য স্বয়ংক্রিয়ভাবে মান বাড়ায়।
-   প্রতিটি রেকর্ডের জন্য **Unique (অনন্য)** আইডি সংরক্ষণ করে।

---

## 2. **Image URL বা Path সংরক্ষণের জন্য String কলাম তৈরি করা**

```php
$table->string('img1', 200);
$table->string('img2', 200);
$table->string('img3', 200);
$table->string('img4', 200);
```

-   **`string()`** মেথডটি একটি VARCHAR টাইপের ডাটা তৈরি করে, যেখানে সর্বোচ্চ দৈর্ঘ্য **২০০** ক্যারেক্টার হতে পারে।
-   এই চারটি কলাম (img1, img2, img3, img4) পণ্যের বিভিন্ন ছবি সংরক্ষণের জন্য ব্যবহৃত হবে।
    -   প্রতিটি ছবি **URL বা পাথ** আকারে এখানে সংরক্ষণ করা হবে।
    -   উদাহরণস্বরূপ, img1-এ পণ্যের প্রধান ছবি সংরক্ষণ করা যেতে পারে, এবং img2, img3, img4-এ অন্যান্য কোণ থেকে তোলা ছবি রাখা যেতে পারে।

---

## 3. **Long Text ডাটা সংরক্ষণ করা**

```php
$table->longText('des');
```

-   **`longText()`** মেথডটি **বড় টেক্সট ডাটা** (যেমন: পণ্যের বিবরণ) সংরক্ষণের জন্য ব্যবহৃত হয়।
-   এটি **বিবরণ (description)** এর জন্য নিখুঁত, কারণ এতে কয়েক হাজার ক্যারেক্টার পর্যন্ত টেক্সট রাখা যায়।

---

## 4. **রঙ এবং আকারের জন্য String কলাম তৈরি করা**

```php
$table->string('color', 200);
$table->string('size', 200);
```

-   **`color`**: পণ্যের রঙ সংরক্ষণ করবে (যেমন: "Red", "Blue", "Green")।
-   **`size`**: পণ্যের আকার সংরক্ষণ করবে (যেমন: "M", "L", "XL", "42cm")।
-   প্রতিটি স্ট্রিং-এর জন্য সর্বাধিক ২০০ ক্যারেক্টারের সীমা নির্ধারণ করা হয়েছে।

---

## 5. **Unsigned Big Integer এবং Unique Constraint যুক্ত করা**

```php
$table->unsignedBigInteger('product_id')->unique();
```

-   **`unsignedBigInteger()`**: বড় পজিটিভ পূর্ণসংখ্যা (Big Integer) তৈরি করে, যা সাধারণত **Primary Key বা Foreign Key** হিসেবে ব্যবহৃত হয়।
-   **`product_id`**: এই টেবিলটি **পণ্যের আইডি** সংরক্ষণ করছে, যা **অন্য পণ্যের টেবিল** এর **`id`** এর সাথে সম্পর্কিত হবে।
-   **`unique()`**: পণ্যের আইডি ইউনিক হবে, অর্থাৎ একই পণ্য এই টেবিলে একবারই যুক্ত হতে পারবে।

---

## 6. **Foreign Key সম্পর্ক তৈরি করা**

```php
$table->foreign('product_id')->references('id')->on('products')
    ->restrictOnDelete()
    ->restrictOnUpdate();
```

-   **`foreign()`**: এটি **`product_id`** ফিল্ডকে **পণ্যের টেবিল (products)` এর** `id` ফিল্ডের সাথে যুক্ত করে।
-   **`references('id')`**: এটি বলে যে `product_id` কলামটি **products টেবিলের `id`** কলামের উপর নির্ভরশীল।
-   **`restrictOnDelete()`**: পণ্য ডিলিট করা নিষিদ্ধ, যদি সেই পণ্যের উপর নির্ভরশীল ডেটা এই টেবিলে থাকে।
-   **`restrictOnUpdate()`**: পণ্যের **ID আপডেট** করাও নিষিদ্ধ করা হয়েছে, যদি তা এই টেবিলের সাথে সংযুক্ত থাকে।

---

## 7. **Timestamp কলাম তৈরি করা**

```php
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

-   **`timestamp()`**: সময়-সংক্রান্ত ডেটা রাখার জন্য ব্যবহার করা হয় (যেমন: `2024-10-15 12:30:45`)।

    -   **`created_at`**:

        -   **`useCurrent()`** দ্বারা নতুন রেকর্ড তৈরি হওয়ার সময় স্বয়ংক্রিয়ভাবে বর্তমান সময় সেট করে।

    -   **`updated_at`**:
        -   **`useCurrent()`**: রেকর্ড তৈরি হওয়ার সময় বর্তমান সময় সেট করে।
        -   **`useCurrentOnUpdate()`**: যখনই রেকর্ড আপডেট হবে, তখন এটি **স্বয়ংক্রিয়ভাবে** বর্তমান সময়ে আপডেট হয়ে যাবে।

---

## **সংক্ষেপে**

এই মাইগ্রেশনটি একটি টেবিল তৈরি করছে, যেখানে বিভিন্ন পণ্যের ছবি, বিবরণ, রঙ, আকার এবং সম্পর্কিত পণ্যের আইডি রাখা হবে। **Foreign Key** এবং **Unique Constraint** ব্যবহার করে টেবিলের সাথে সম্পর্ক তৈরি করা হয়েছে। **created_at** এবং **updated_at** এর মাধ্যমে প্রতিটি রেকর্ডের সময় ট্র্যাক করা হবে।
