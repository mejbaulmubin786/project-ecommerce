Laravel এর **Query Builder** একটি গুরুত্বপূর্ণ ফিচার যা ডেভেলপারদের ডেটাবেজের সাথে কাজ করার সময় জটিল SQL কোয়েরি না লিখেই সহজে এবং দ্রুত কাজ করতে সাহায্য করে। এটি ব্যবহার করে ডেটাবেজ থেকে ডেটা সিলেক্ট, ইনসার্ট, আপডেট, ডিলিট করার পাশাপাশি বিভিন্ন টেবিলের মধ্যে যোগসূত্র (join) তৈরি করা যায়। এটি ডেভেলপমেন্টের সময়, কোডের পাঠযোগ্যতা এবং নিরাপত্তা বাড়াতে সাহায্য করে।

### Laravel Query Builder এর গুরুত্বপূর্ণ ফিচারসমূহ

#### ১. **ডেটা সিলেক্ট করা (Selecting Data)**

ডেটাবেজ থেকে ডেটা রিড করার সবচেয়ে সাধারণ কাজ হচ্ছে সিলেক্ট করা।

**উদাহরণ:**

```php
$users = DB::table('users')->get();
```

এখানে `users` টেবিলের সব ডেটা সিলেক্ট করা হচ্ছে।

**নির্দিষ্ট কলাম সিলেক্ট করা:**

```php
$users = DB::table('users')->select('name', 'email')->get();
```

এখানে শুধু `name` এবং `email` কলামগুলো সিলেক্ট করা হচ্ছে।

**শর্ত দিয়ে ডেটা ফিল্টার করা (where):**

```php
$activeUsers = DB::table('users')->where('active', 1)->get();
```

এটি `active` ফিল্ডের মান ১ থাকা ইউজারদের ডেটা রিটার্ন করবে।

#### ২. **ডেটা ইনসার্ট করা (Inserting Data)**

ডেটাবেজে নতুন ডেটা ইনসার্ট করা Query Builder এর মাধ্যমে খুব সহজ।

**একটি রেকর্ড ইনসার্ট করা:**

```php
DB::table('users')->insert([
    'name' => 'John Doe',
    'email' => 'john@example.com',
    'password' => bcrypt('secret')
]);
```

**ইনসার্ট করার পর আইডি রিটার্ন করা (insertGetId):**

```php
$id = DB::table('users')->insertGetId([
    'name' => 'Jane Doe',
    'email' => 'jane@example.com',
    'password' => bcrypt('secret')
]);
```

এটি ইনসার্ট করা রেকর্ডের আইডি রিটার্ন করে।

#### ৩. **ডেটা আপডেট করা (Updating Data)**

অলরেডি ডেটাবেজে থাকা রেকর্ড আপডেট করাও সহজ।

**একটি রেকর্ড আপডেট করা:**

```php
DB::table('users')->where('id', 1)->update([
    'email' => 'newemail@example.com'
]);
```

**ভ্যালু বাড়ানো বা কমানো (increment/decrement):**

```php
DB::table('users')->where('id', 1)->increment('balance', 50);
```

এটি ইউজারের ব্যালেন্স ৫০ দ্বারা বৃদ্ধি করবে।

#### ৪. **ডেটা ডিলিট করা (Deleting Data)**

Query Builder এর মাধ্যমে ডেটাবেজ থেকে ডেটা ডিলিট করা খুব সহজ।

**একটি রেকর্ড ডিলিট করা:**

```php
DB::table('users')->where('id', 1)->delete();
```

**পুরো টেবিল খালি করা (truncate):**

```php
DB::table('users')->truncate();
```

এটি পুরো টেবিলের ডেটা ডিলিট করে এবং রিসেট করে।

#### ৫. **টেবিল জয়েন করা (Join Queries)**

একাধিক টেবিল থেকে ডেটা রিড করার সময় জয়েন করা দরকার হয়।

**ইনার জয়েন (Inner Join):**

```php
$users = DB::table('users')
    ->join('posts', 'users.id', '=', 'posts.user_id')
    ->select('users.name', 'posts.title')
    ->get();
```

এখানে `users` এবং `posts` টেবিলের ডেটা একসাথে দেখানো হচ্ছে।

**লেফট জয়েন (Left Join):**

```php
$users = DB::table('users')
    ->leftJoin('posts', 'users.id', '=', 'posts.user_id')
    ->select('users.name', 'posts.title')
    ->get();
```

লেফট জয়েন ব্যবহার করে, `users` টেবিলের সব রেকর্ড পাওয়া যাবে, এমনকি যদি `posts` টেবিলে কোন মিল না থাকে।

#### ৬. **অ্যাগ্রিগেট (Aggregates)**

Query Builder দিয়ে আপনি বিভিন্ন অ্যাগ্রিগেট ফাংশন যেমন `count()`, `sum()`, `avg()` ইত্যাদি ব্যবহার করতে পারবেন।

**কাউন্ট করা (Count Example):**

```php
$userCount = DB::table('users')->count();
```

**সাম করা (Sum Example):**

```php
$totalBalance = DB::table('users')->sum('balance');
```

#### ৭. **প্যাগিনেশন (Pagination)**

লার্জ ডেটাসেট ব্যবহারের সময় প্যাগিনেশন খুব কার্যকর। Query Builder এর মাধ্যমে সহজেই প্যাগিনেশন করা যায়।

```php
$users = DB::table('users')->paginate(15);
```

এটি প্রতি পেজে ১৫টি ইউজার রিটার্ন করবে।

#### ৮. **রও এক্সপ্রেশন (Raw Expressions)**

যখন খুব কমপ্লেক্স কোয়েরি দরকার হয়, তখন রও SQL এক্সপ্রেশনও ব্যবহার করা যায়।

```php
$users = DB::table('users')
    ->select(DB::raw('count(*) as user_count, status'))
    ->where('active', 1)
    ->groupBy('status')
    ->get();
```

এখানে `DB::raw()` ব্যবহার করে SQL অ্যাগ্রিগেট ফাংশন `count()` ব্যবহার করা হয়েছে।

### Laravel Query Builder ব্যবহারের সুবিধা

1. **সহজ এবং পড়ার মতো সিনট্যাক্স:** এর সিনট্যাক্স খুবই সরল এবং বুঝতে সহজ।
2. **SQL ইনজেকশন প্রতিরোধ:** Query Builder নিজেই ইনপুটকে এস্কেপ করে, যা SQL ইনজেকশন থেকে সুরক্ষা দেয়।
3. **ডেটাবেজ ইন্ডিপেন্ডেন্স:** বিভিন্ন ডেটাবেজ সিস্টেম (MySQL, SQLite ইত্যাদি) এর সাথে সহজে কাজ করা যায়।
4. **কমপ্লেক্সিটি কমায়:** জটিল SQL লেখার ঝামেলা থেকে মুক্তি দেয়।
5. **ফ্লুয়েন্ট ইন্টারফেস:** ধাপে ধাপে কোয়েরি বিল্ড করার সুবিধা আছে।

সুতরাং, Laravel এর Query Builder একটি ডেভেলপার-ফ্রেন্ডলি ফিচার যা দ্রুত, নিরাপদ এবং সহজ ডেটাবেজ ম্যানেজমেন্টের সুযোগ দেয়।
