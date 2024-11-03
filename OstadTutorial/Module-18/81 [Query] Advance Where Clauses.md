এবার আমরা শিখবো ‍advance where clauses এর বেশ কিছু মেথড দেখবো ।

## ছবিটির টেক্সট:

**Advance Where Clauses**

- The orWhere method to join a clause to the query using the or operator.
- The whereNot and orWhereNot methods may be used to negate a given group of query constraints.
- The whereBetween method verifies that a column's value is between two values.
- The whereNotBetween method verifies that a column's value lies outside of two values.
- The whereBetweenColumns method verifies that a column's value is between the two values of two columns in the same table row.
- The whereNotBetweenColumns method verifies that a column's value lies outside the two values of two columns in the same table row.
- The whereIn method verifies that a given column's value is contained within the given array.
- The whereNotIn method verifies that the given column's value is not contained in the given array.
- The whereNull method verifies that the value of the given column is NULL.
- The whereNotNull method verifies that the column's value is not NULL
- The whereDate method may be used to compare a column's value against a date.
- The whereMonth method may be used to compare a column's value against a specific month.
- The whereDay method may be used to compare a column's value against a specific day of the month.
- The whereYear method may be used to compare a column's value against a specific year.
- The whereTime method may be used to compare a column's value against a specific time.
- The whereColumn method may be used to verify that two columns are equal.

## বাংলায় অর্থ:

**অ্যাডভান্স হোয়ার ক্লজ**

এই টেক্সটটি ডাটাবেজ কুয়েরি (যে কোন ডাটাবেজ থেকে তথ্য খুঁজে বের করার একটি পদ্ধতি) সম্পর্কে। বিশেষ করে, এটি "হোয়ার ক্লজ" নামে পরিচিত একটি বিশেষ ধরনের ক্লজ সম্পর্কে ব্যাখ্যা করে, যা কোনো নির্দিষ্ট শর্তের ভিত্তিতে ডাটাবেজ থেকে তথ্য ফিল্টার করতে ব্যবহৃত হয়।

**বিভিন্ন ধরনের হোয়ার ক্লজ:**

- **orWhere:** এই ক্লজটি দুটি বা ততোধিক শর্তকে "অথবা" (OR) অপারেটর দিয়ে যুক্ত করে। অর্থাৎ, যদি কোনো রো (row) এই শর্তগুলোর মধ্যে অন্তত একটি পূরণ করে, তাহলে সেই রো ফলাফল হিসেবে আসবে।
- **whereNot, orWhereNot:** এই ক্লজগুলো কোনো নির্দিষ্ট শর্তকে নেগেট করে। অর্থাৎ, যদি কোনো রো এই শর্তটি পূরণ না করে, তাহলে সেই রো ফলাফল হিসেবে আসবে।
- **whereBetween, whereNotBetween:** এই ক্লজগুলো কোনো কলামের মান একটি নির্দিষ্ট পরিসরের মধ্যে আছে কি না তা পরীক্ষা করে।
- **whereBetweenColumns, whereNotBetweenColumns:** এই ক্লজগুলো একটি কলামের মান অন্য দুটি কলামের মানের মধ্যে আছে কি না তা পরীক্ষা করে।
- **whereIn, whereNotIn:** এই ক্লজগুলো কোনো কলামের মান একটি নির্দিষ্ট তালিকার মধ্যে আছে কি না তা পরীক্ষা করে।
- **whereNull, whereNotNull:** এই ক্লজগুলো কোনো কলামের মান NULL (কোনো মান নেই) কি না তা পরীক্ষা করে।
- **whereDate, whereMonth, whereDay, whereYear, whereTime:** এই ক্লজগুলো কোনো কলামের মান একটি নির্দিষ্ট তারিখ, মাস, দিন, বছর বা সময়ের সাথে মিলে যায় কিনা তা পরীক্ষা করে।
- **whereColumn:** এই ক্লজটি দুটি কলামের মান সমান কিনা তা পরীক্ষা করে।

**উদাহরণ:**

ধরুন, আপনার একটি "গ্রাহক" টেবিল আছে। এই টেবিলের মধ্যে "নাম", "বয়স" এবং "শহর" নামে তিনটি কলাম আছে। আপনি যদি 25 বছরের উপরে এবং ঢাকা শহরে থাকা সকল গ্রাহকের তালিকা দেখতে চান, তাহলে আপনি নিম্নলিখিত কুয়েরিটি ব্যবহার করতে পারেন:

```sql
SELECT * FROM গ্রাহক WHERE বয়স > 25 AND শহর = 'ঢাকা';
```

এখানে, `WHERE বয়স > 25 AND শহর = 'ঢাকা'` অংশটি হল একটি হোয়ার ক্লজ। এই ক্লজটি নির্দিষ্ট করে যে, ফলাফল হিসেবে শুধুমাত্র সেইসব রো আসবে যেখানে "বয়স" কলামের মান 25 এর চেয়ে বেশি এবং "শহর" কলামের মান "ঢাকা" হবে।

**বিঃদ্রঃ:** এই ব্যাখ্যাটি একটি সাধারণ ধারণা দেওয়ার জন্য। বিভিন্ন ডাটাবেজ সিস্টেমে হোয়ার ক্লজ ব্যবহারের সিনট্যাক্স কিছুটা ভিন্ন হতে পারে।

`where` ক্লজের এই এডভান্স মেথডগুলো Laravel Query Builder-এ বিভিন্ন জটিল শর্ত যুক্ত করতে ব্যবহার করা যায়। এগুলো দিয়ে আরো নির্দিষ্টভাবে তথ্য ফিল্টার করা যায়। নিচে প্রতিটি মেথডের বিস্তারিত বর্ণনা ও উদাহরণ দেওয়া হলো।

### 1. `orWhere`

এই মেথড দিয়ে `or` অপারেটরের মাধ্যমে শর্ত যোগ করা হয়।

```php
$products = DB::table('products')
    ->where('price', '>', 2000)
    ->orWhere('category_id', '=', 3)
    ->get();
```

উপরে দেখানো হয়েছে, যদি `price` ২০০০ এর বেশি অথবা `category_id` ৩ হয় তাহলে সেই সব রেকর্ড রিটার্ন হবে।

### 2. `whereNot` এবং `orWhereNot`

এই মেথডগুলো দিয়ে কোনো শর্তকে নেগেট করতে বা `NOT` অপারেটর ব্যবহার করতে পারি।

```php
$products = DB::table('products')
    ->whereNot('price', '<', 1000)
    ->get();
```

এখানে যেসব প্রোডাক্টের `price` ১০০০ এর কম নয়, সেগুলো রিটার্ন হবে।

### 3. `whereBetween`

এই মেথড দিয়ে একটি কলামের মান দুইটি ভ্যালুর মধ্যে থাকলে তা ফিল্টার করা যায়।

```php
$products = DB::table('products')
    ->whereBetween('price', [1000, 5000])
    ->get();
```

এখানে প্রোডাক্টের `price` ১০০০ থেকে ৫০০০ এর মধ্যে হলে সেইসব রেকর্ড রিটার্ন হবে।

### 4. `whereNotBetween`

দুইটি ভ্যালুর বাইরে থাকলে সেই রেকর্ডগুলো পেতে এই মেথড ব্যবহার করা হয়।

```php
$products = DB::table('products')
    ->whereNotBetween('price', [1000, 5000])
    ->get();
```

এখানে `price` ১০০০ থেকে ৫০০০ এর বাইরে থাকা রেকর্ডগুলো রিটার্ন হবে।

### 5. `whereBetweenColumns`

দুইটি কলামের মানের মধ্যে মান থাকলে ফিল্টার করে।

```php
$products = DB::table('products')
    ->whereBetweenColumns('price', ['min_price', 'max_price'])
    ->get();
```

এখানে `price` যদি `min_price` এবং `max_price` এর মধ্যে থাকে, তাহলে সেই রেকর্ডগুলো রিটার্ন হবে।

### 6. `whereNotBetweenColumns`

দুইটি কলামের মানের বাইরে থাকলে ফিল্টার করে।

```php
$products = DB::table('products')
    ->whereNotBetweenColumns('price', ['min_price', 'max_price'])
    ->get();
```

### 7. `whereIn`

কোনো একটি নির্দিষ্ট মানগুলোর মধ্যে থাকলে তা ফিল্টার করা যায়।

```php
$products = DB::table('products')
    ->whereIn('category_id', [1, 2, 3])
    ->get();
```

### 8. `whereNotIn`

এই মেথড দিয়ে নির্দিষ্ট মানগুলোর বাইরে থাকা রেকর্ডগুলো ফিল্টার করা যায়।

```php
$products = DB::table('products')
    ->whereNotIn('category_id', [1, 2, 3])
    ->get();
```

### 9. `whereNull`

এই মেথড দিয়ে কলামের মান `NULL` হলে তা ফিল্টার করা হয়।

```php
$products = DB::table('products')
    ->whereNull('deleted_at')
    ->get();
```

### 10. `whereNotNull`

এই মেথড দিয়ে কলামের মান `NULL` না হলে তা ফিল্টার করা হয়।

```php
$products = DB::table('products')
    ->whereNotNull('deleted_at')
    ->get();
```

### 11. `whereDate`

তারিখের সাথে কম্পেয়ার করতে `whereDate` ব্যবহার করা হয়।

```php
$products = DB::table('products')
    ->whereDate('created_at', '2024-01-01')
    ->get();
```

### 12. `whereMonth`

নির্দিষ্ট মাসের সাথে কম্পেয়ার করতে এই মেথড ব্যবহার করা হয়।

```php
$products = DB::table('products')
    ->whereMonth('created_at', '01')
    ->get();
```

### 13. `whereDay`

নির্দিষ্ট দিনের সাথে কম্পেয়ার করতে ব্যবহার করা হয়।

```php
$products = DB::table('products')
    ->whereDay('created_at', '15')
    ->get();
```

### 14. `whereYear`

নির্দিষ্ট বছরের সাথে কম্পেয়ার করতে ব্যবহার করা হয়।

```php
$products = DB::table('products')
    ->whereYear('created_at', '2024')
    ->get();
```

### 15. `whereTime`

নির্দিষ্ট সময়ের সাথে কম্পেয়ার করতে এই মেথড ব্যবহার করা হয়।

```php
$products = DB::table('products')
    ->whereTime('created_at', '12:00:00')
    ->get();
```

### 16. `whereColumn`

দুইটি কলামের মান সমান হলে ফিল্টার করতে ব্যবহার করা হয়।

```php
$products = DB::table('products')
    ->whereColumn('created_at', 'updated_at')
    ->get();
```

### সংক্ষেপে

এই এডভান্স `where` ক্লজগুলো Laravel এ জটিল শর্ত নিয়ে কাজ করতে সহজ এবং উন্নত ফিল্টারিং প্রদান করে।

`where` ক্লজের প্রতিটি এডভান্স মেথড Laravel Query Builder-এ জটিল শর্তাবলী যোগ করার জন্য অত্যন্ত গুরুত্বপূর্ণ। নিচে প্রতিটি পয়েন্টের আরো বিস্তারিত আলোচনা দেওয়া হলো।

---

### 1. **`orWhere`**

`orWhere` মেথডটি `where` মেথডের মতোই কাজ করে, তবে এটি শর্তাবলী যুক্ত করার জন্য `OR` অপারেটর ব্যবহার করে। অর্থাৎ, যেকোনো একটি শর্ত পূরণ হলেই সেই রেকর্ডটি রিটার্ন করবে।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->where('price', '>', 2000)
    ->orWhere('category_id', '=', 3)
    ->get();
```

**বিশ্লেষণ:**
এখানে, দুটি শর্ত দেওয়া হয়েছে। প্রথম শর্তে প্রোডাক্টের `price` যদি ২০০০ এর বেশি হয়, তাহলে রেকর্ড রিটার্ন হবে। যদি প্রথম শর্তটি পূরণ না হয়, তাহলে `category_id` যদি ৩ হয়, তাহলেও রেকর্ডটি রিটার্ন হবে। অর্থাৎ, `price > 2000` অথবা `category_id = 3` — যেকোনো একটি শর্ত পূরণ হলেই সেই প্রোডাক্টটি আউটপুটে আসবে।

---

### 2. **`whereNot` এবং `orWhereNot`**

`whereNot` এবং `orWhereNot` মেথডগুলো দিয়ে নির্দিষ্ট শর্তকে `NOT` দিয়ে নেগেট করা হয়। অর্থাৎ, যদি শর্তটি পূরণ না করে, তখন রেকর্ডটি রিটার্ন হবে।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereNot('price', '<', 1000)
    ->get();
```

**বিশ্লেষণ:**
উপরের উদাহরণে দেখানো হয়েছে যে, প্রোডাক্টের `price` যদি ১০০০ এর কম না হয়, অর্থাৎ `price >= 1000` হলে সেই রেকর্ডগুলো আউটপুটে আসবে। একইভাবে, `orWhereNot` ব্যবহার করা হয়, যখন একটি শর্ত অপূর্ণ থাকলে `OR` অপারেটরের মাধ্যমে অন্য শর্তগুলো যাচাই করা হয়।

---

### 3. **`whereBetween`**

`whereBetween` মেথডটি ব্যবহার করা হয়, যখন একটি কলামের মান নির্দিষ্ট দুটি ভ্যালুর মধ্যে থাকে।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereBetween('price', [1000, 5000])
    ->get();
```

**বিশ্লেষণ:**
এই কোডে প্রোডাক্টগুলোর `price` যদি ১০০০ থেকে ৫০০০ এর মধ্যে থাকে (সহজভাবে বলতে গেলে, ১০০০ ≤ price ≤ ৫০০০), তাহলে সেই রেকর্ডগুলো রিটার্ন হবে। এটি বিশেষ করে রেঞ্জের মধ্যে থাকা মান খুঁজে বের করার জন্য সুবিধাজনক।

---

### 4. **`whereNotBetween`**

`whereNotBetween` মেথডটি `whereBetween` এর বিপরীত। এটি দুটি ভ্যালুর বাইরে থাকা মানগুলোকে রিটার্ন করে।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereNotBetween('price', [1000, 5000])
    ->get();
```

**বিশ্লেষণ:**
এখানে প্রোডাক্টের `price` যদি ১০০০ থেকে ৫০০০ এর বাইরে থাকে, তখন সেই রেকর্ডগুলো আউটপুটে আসবে। অর্থাৎ `price < 1000` অথবা `price > 5000` এর শর্ত পূরণ করলে সেই প্রোডাক্টটি রিটার্ন হবে।

---

### 5. **`whereBetweenColumns`**

`whereBetweenColumns` মেথডটি `whereBetween` এর মতোই কাজ করে, তবে দুটি কলামের মানের মধ্যে ফিল্টার করতে ব্যবহৃত হয়।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereBetweenColumns('price', ['min_price', 'max_price'])
    ->get();
```

**বিশ্লেষণ:**
এখানে `price` কলামের মান `min_price` এবং `max_price` কলামের মানের মধ্যে থাকলে সেই রেকর্ডগুলো রিটার্ন হবে। এটি এমন পরিস্থিতিতে উপকারী যখন একটি কলামের মান একই টেবিলের দুই কলামের মধ্যে থাকে কিনা তা যাচাই করতে হয়।

---

### 6. **`whereNotBetweenColumns`**

`whereNotBetweenColumns` মেথডটি `whereBetweenColumns` এর বিপরীত। এটি দুটি কলামের মানের বাইরে থাকলে সেই মান রিটার্ন করে।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereNotBetweenColumns('price', ['min_price', 'max_price'])
    ->get();
```

**বিশ্লেষণ:**
এখানে `price` যদি `min_price` এবং `max_price` এর বাইরে থাকে, সেই রেকর্ডগুলো আউটপুটে আসবে। অর্থাৎ, `price < min_price` অথবা `price > max_price` হলে সেই প্রোডাক্ট রিটার্ন হবে।

---

### 7. **`whereIn`**

`whereIn` মেথডটি ব্যবহার করা হয়, যখন একটি কলামের মান নির্দিষ্ট তালিকার মধ্যে থাকে কিনা তা যাচাই করতে।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereIn('category_id', [1, 2, 3])
    ->get();
```

**বিশ্লেষণ:**
এখানে, `category_id` যদি ১, ২, অথবা ৩ এর মধ্যে থাকে, তাহলে সেই প্রোডাক্টটি রিটার্ন হবে। এটি একটি লিস্টের মধ্যে থাকা মান যাচাই করতে সহজ উপায়।

---

### 8. **`whereNotIn`**

`whereNotIn` মেথডটি `whereIn` এর বিপরীত। এটি নির্দিষ্ট তালিকার বাইরে থাকা মানগুলো রিটার্ন করে।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereNotIn('category_id', [1, 2, 3])
    ->get();
```

**বিশ্লেষণ:**
এখানে, `category_id` যদি ১, ২, অথবা ৩ এর বাইরে থাকে, তাহলে সেই প্রোডাক্টগুলো রিটার্ন হবে।

---

### 9. **`whereNull`**

`whereNull` মেথডটি ব্যবহার করা হয়, যখন একটি কলামের মান `NULL` কিনা তা যাচাই করতে।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereNull('deleted_at')
    ->get();
```

**বিশ্লেষণ:**
এখানে, প্রোডাক্টের `deleted_at` কলামটি যদি `NULL` হয়, তাহলে সেই রেকর্ডগুলো রিটার্ন হবে। এটি বিশেষ করে ডিলিটেড বা একটিভ রেকর্ড খুঁজে বের করতে উপকারী।

---

### 10. **`whereNotNull`**

`whereNotNull` মেথডটি `whereNull` এর বিপরীত। এটি সেইসব রেকর্ডকে রিটার্ন করে যেগুলোর কলামের মান `NULL` নয়।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereNotNull('deleted_at')
    ->get();
```

**বিশ্লেষণ:**
এখানে, `deleted_at` কলামটি `NULL` না হলে সেই প্রোডাক্টগুলো রিটার্ন হবে।

---

### 11. **`whereDate`**

`whereDate` মেথডটি ব্যবহার করা হয়, যখন একটি কলামের মান নির্দিষ্ট তারিখের সাথে তুলনা করতে হয়।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereDate('created_at', '2024-01-01')
    ->get();
```

**বিশ্লেষণ:**
এখানে, `created_at` কলামের মান যদি `2024-01-01` হয়, তাহলে সেই রেকর্ডগুলো রিটার্ন হবে।

---

### 12. **`whereMonth`**

`whereMonth` মেথডটি নির্দিষ্ট মাসের সাথে তুলনা করার জন্য ব্যবহৃত হয়।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereMonth('created_at', '01')
    ->get();
```

**বিশ্লেষণ:**
এখানে, `created_at` কলামের মাস যদি জানুয়ারি হয়, তাহলে সেই রেকর্ডগুলো রিটার্ন হবে।

---

### 13. **`whereDay`**

`whereDay` মেথডটি নির্দিষ্ট দিনের সাথে তুলনা করার জন্য ব্যবহৃত হয়।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereDay('created_at', '15')
    ->get();
```

**বিশ্লেষণ:**
এখানে, `created_at` কলামের দিন যদি ১৫ হয়, তাহলে সেই রেকর্ডগুলো রিটার্ন হবে।

---

### 14. **`whereYear`**

`whereYear` মেথডটি নির্দিষ্ট বছরের সাথে তুলনা করার জন্য ব্যবহৃত হয়

।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereYear('created_at', '2024')
    ->get();
```

**বিশ্লেষণ:**
এখানে, `created_at` কলামের বছর যদি ২০২৪ হয়, তাহলে সেই রেকর্ডগুলো রিটার্ন হবে।

---

### 15. **`whereColumn`**

`whereColumn` মেথডটি ব্যবহার করা হয়, যখন একটি কলামের মান আরেকটি কলামের মানের সাথে তুলনা করতে হয়।

**ব্যবহার:**

```php
$products = DB::table('products')
    ->whereColumn('updated_at', '>', 'created_at')
    ->get();
```

**বিশ্লেষণ:**
এখানে, `updated_at` কলামের মান যদি `created_at` কলামের মানের চেয়ে বড় হয়, তাহলে সেই রেকর্ডগুলো রিটার্ন হবে।
