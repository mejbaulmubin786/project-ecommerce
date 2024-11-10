```php
<?php
$fruits = array(
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Pineapple",
    "Grape",
    "Strawberry",
    "Blueberry",
    "Watermelon",
    "Kiwi",
    "Peach",
    "Pear",
    "Coconut",
    "Avocado",
    "Grapefruit",
    "Cherry",
    "Papaya",
    "Dragonfruit",
    "Lychee",
    "Durian",
);

$someFruits = array_slice($fruits, 4); // এর থেকে কিছুটা বের করা । প্রথম উপাদানটি কোন এরে থেকে ডাটা নিতে হবে তার নাম দ্বিতীয়টি হচ্ছে কত তম পজিসন থেকে ডাটা নিতে হবে।
$someFruits = array_slice($fruits, 4, 2); //তৃতিয় আরগুমেন্ট এ বুঝায় কয়টি উপাদান নিতে হবে এই আরগুমেন্ট না থাকলে শেষ পর্যন্ত যাবে।
$someFruits = array_slice($fruits, 2, 20); // যদি দ্বিতীয় উপদান থেকে 20 টি উপাদান না থাকে তবে শেষ পর্যন্ত যতটি আছে ততটি আসবে।
$someFruits = array_slice($fruits, -5, 2); // শেষের দিক থেকে হিসাব করতে চাইলে। 
print_r($someFruits);
$someFruits = array_slice($fruits, 10, -2); // 10 নাম্বার উপাদান থেকে শেষের ২টি উপাদানের আগ পর্যন্ত 

//array_slice ফাংশন ব্যবহারে একটা বিষয় লক্ষনিয় । এখানে যে নতুন এরেটি পাওয়া যায় তার উপাদান গুলোর ইনডিক্স চেঞ্জ হয়ে যায়। এগুলো নতুন 0 থেকে শুরু হয়। যদি আমরা চাই যে ইনডিক্সে আছে তা সংরক্ষিত থাকে তবে নতুন একটা আরগুমেন্ট যোগ করতে হবে।
$someFruits = array_slice($fruits, 10, -2, true); // এখানে offset প্রিজার্ভ করবে
```

```php
<?php
$random = ['a' => 12, 'b' => 45, 'c' => 34, 'd' => 22, 'e' => 77, 'f' => 31, 12 => 78, 'g' => 87];
$randomData = array_slice($random, 3);
print_r($randomData);

$randomData2 = array_slice($random, 3, null, true);
print_r($randomData2);
```
PHP-তে array_slice ফাংশনটি একটি অ্যারের নির্দিষ্ট অংশ বের করার জন্য ব্যবহৃত হয়। এই ফাংশনটির সিনট্যাক্স হলো:
```php
array_slice(array $array, int $offset, ?int $length = null, bool $preserve_keys = false): array
```

এখানে array, offset, length, এবং preserve_keys হল চারটি প্যারামিটার।

$array: যেই অ্যারে থেকে অংশ বের করতে হবে।
$offset: কোন ইনডেক্স থেকে অংশ শুরু হবে।
$length: কতগুলো উপাদান নিতে হবে। (ঐচ্ছিক)
$preserve_keys: ইনডেক্সগুলো সংরক্ষণ করতে হবে কিনা। (ঐচ্ছিক)
তোমার উদাহরণে:
```php
$randomData2 = array_slice($random, 3, null, true);
```
এখানে null এবং true এর মানে হলো:

null: length প্যারামিটারটি null সেট করা হয়েছে, যার মানে array_slice শেষ পর্যন্ত অ্যারের সব উপাদান নিবে, offset থেকে শুরু করে।
true: preserve_keys প্যারামিটারটি true সেট করা হয়েছে, যার মানে মূল অ্যারের ইনডেক্সগুলো সংরক্ষণ করা হবে।
অতএব, array_slice($random, 3, null, true) ফাংশনটি $random অ্যারের ৩ নম্বর ইনডেক্স থেকে শুরু করে শেষ পর্যন্ত সব উপাদানগুলো নিয়ে নতুন একটি অ্যারে তৈরি করবে এবং মূল ইনডেক্সগুলো সংরক্ষণ করবে।
