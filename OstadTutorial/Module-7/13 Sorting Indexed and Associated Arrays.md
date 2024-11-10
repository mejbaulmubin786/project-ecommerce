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

print_r($fruits);
//php তে সর্ট করার অনেক গুলো উপায় আছে এর মধ্যে একটি হচ্ছে
sort($fruits); // তবে এই ফাংশনটি কিন্তু মুল এরে কেই পরিবর্তন করে দেয়
print_r($fruits);
$number = [56, 87, 32, 99, 13, 24, 65, 10, 45, 78, 92, 53, 67, 18, 83, 29, 42, 5, 96, 71];
sort($number);
print_r($number);
```
এই সর্ট ফাংশনে একটি বিষয় লক্ষনিয় যে আমরা যদি এই ফাংশনটি ব্যবহার করি তবে উপদান গুলোর মাঝে যদি কোন একটি বা কয়েকটি কি সহ থাকে তবে সে সেই ডাটা গুলোর কি গুলো বাদ দিয়ে দিবে।
```php
$fruits2 = array(
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    'p' => "Pineapple",
    "Grape",
    "Strawberry",
    'b' => "Blueberry",
    "Watermelon",
    "Kiwi",
    "Peach",
    "Pear",
    'c' => "Coconut",
    "Avocado",
    "Grapefruit",
    "Cherry",
    "Papaya",
    "Dragonfruit",
    "Lychee",
    "Durian",
);
print_r($fruits2);
sort($fruits2);
print_r($fruits2);
//আমরা যদি কি কে প্রিজার্ভ করতে চাই তবে sort ব্যবহার না করে ব্যবহার করতে হবে।
asort($fruits2);
print_r($fruits2);
```
এখন যদি আমরা asort নাম্বার এর জায়গায় ব্যবহার করি তবে এদের কি গুলো এলোমেলো লাগতে পারে কারণ একুরেট কি টা প্রিজার্ভ করার কারণে।
```php
$number = [56, 87, 32, 99, 13, 24, 65, 10, 45, 78, 92, 53, 67, 18, 83, 29, 42, 5, 96, 71];
asort($number);
print_r($number);
//এখন for লুপ ব্যবহার করলে দেখা যাবে সটের পূবের্ অবস্থা পিরে পাবে।
for ($i = 0; $i < count($number); $i++) {
    echo $number[$i] . "\n";
}
// কিন্তু এখন foreach লুপ ব্যবহার করলে দেখা যাবে সটের পরের ওর্ডার ফলো করবে।
foreach ($number as $number) {
    echo $number . "\n";
}
//asort এর বদলে যদি আমরা arsort ব্যবহার করি তবে বড় থেকে ছোট অর্ডরে হবে।
arsort($number);
print_r($number);
//একই ভাবে sort এর ও একটি রিভার্স sort আছে
rsort($number);
```

```php
<?php
$fruits = array(
    'c' => "Apple",
    'a' => "Banana",
    't' => "Orange",
    'f' => "Mango",
    'n' => "Pineapple",
    'd' => "Grape",
    'l' => "Strawberry",
    'i' => "Blueberry",
    'o' => "Watermelon",
    'p' => "Kiwi",
    'b' => "Peach",
    's' => "Pear",
    'e' => "Coconut",
    'r' => "Avocado",
    'g' => "Grapefruit",
    'j' => "Cherry",
    'h' => "Papaya",
    'k' => "Dragonfruit",
    'm' => "Lychee",
    'q' => "Durian",
);

asort($fruits);
print_r($fruits);
foreach ($fruits as $fruit) {
    echo $fruit . "\n";
}
//আমরা যা আগে দেখেছি এখানে কি গুলো সর্ট হয় নি হয়েছে ভেলু কি গুলোকে সট করতে চাইলে।

ksort($fruits);
print_r($fruits);
foreach ($fruits as $fruit) {
    echo $fruit . "\n";
}
// এর রিভার্স krsort হবে।
krsort($fruits);
//
$number = [56, 87, 32, 99, 13, 24, 65, 10, 45, 78, 92, 53, 67, 18, 83, 29, 42, 5, 96, 71];
sort($number); // সাভাবিক ভাবে সর্ট হয় অর্থা 1 এর পর 2 এই ভাবে 
print_r($number);

sort($number, SORT_STRING); // কিন্তু এভাবে করলে স্ট্রিং এর মতো করে সাজবে অর্থা 1 এর সাথে মিল রেখে 11 এভাবে
print_r($number);
```
usort() ফাংশন হলো PHP-তে অ্যারে সাজানোর জন্য একটি উন্নত ফাংশন। এটি sort() ফাংশনের চেয়ে বেশি নমনীয় কারণ এটি ব্যবহারকারী নির্ধারিত তুলনা ফাংশন ব্যবহার করে অ্যারে উপাদানগুলিকে কীভাবে সাজানো হবে তা নিয়ন্ত্রণ করতে দেয়।
**usort(array, callback $comparison_func);** 
প্যারামিটার:

$array: যে অ্যারেটি সাজানো হবে।
$comparison_func: একটি callable ফাংশন যা দুটি অ্যারে উপাদান গ্রহণ করে এবং তাদের তুলনা করে। ফাংশনটি 0 (শূন্য) ফেরত দিতে হবে যদি প্রথম উপাদানটি দ্বিতীয়টির সমান হয়, 1 (এক) যদি প্রথম উপাদানটি দ্বিতীয়টির চেয়ে বড় হয় এবং -1 (নেতিবাচক এক) যদি প্রথম উপাদানটি দ্বিতীয়টির চেয়ে ছোট হয়।
```php
$number = [56, 87, 32, 99, 13, 24, 65, 10, 45, 78, 92, 53, 67, 18, 83, 29, 42, 5, 96, 71];

<?php
function my_sort($a, $b) {
  if ($a == $b) return 0;
  return ($a < $b) ? -1 : 1;
}

$a = $number;

usort($a,"my_sort");//

foreach($a as $key => $value) {
  echo "[" . $key . "] => " . $value;
  echo "<br>";
}
?> 
// 2 nd example
$students = array(
  array('name' => 'Alice', 'age' => 30),
  array('name' => 'Bob', 'age' => 25),
  array('name' => 'Charlie', 'age' => 22),
);

function cmp_by_name($a, $b) {
  return strcmp($a['name'], $b['name']);
}

usort($students, 'cmp_by_name');

print_r($students);

// 3 
<?php
$fruits = array(
    "Apple",
    "Banana",
    "Orange",
    "mango",
    "Pineapple",
    "Grape",
    "Strawberry",
    "Blueberry",
    "Watermelon",
    "kiwi",
    "Peach",
    "pear",
    "Coconut",
    "Avocado",
    "Grapefruit",
    "cherry",
    "papaya",
    "Dragonfruit",
    "Lychee",
    "durian",
);

sort($fruits); // এখানে একটি বিষয় লক্ষ্যনিয় এখানে বড় হাতের অক্ষর গুলো আগে আসবে পরে ছোট হাতের অক্ষর গুলো। কারণ এটি কেইস সেনসেটিভ সর্ট। এটি এসকি কি অনুসারে সর্ট হয়। 
print_r($fruits);
sort($fruits,SORT_STRING|STRING_FLAG_CASE); // কেইস সেনসেটিভ সর্ট না করতে চাইলে এভাবে লিখতে হবে 
print_r($fruits);
```
usort() ফাংশনের কিছু গুরুত্বপূর্ণ দিক:

তুলনা ফাংশন: usort() ফাংশনের কার্যকারিতা সম্পূর্ণরূপে তুলনা ফাংশন দ্বারা নির্ধারিত হয়। আপনি যেকোনো ধরনের তুলনা প্রয়োগ করতে পারেন, যেমন স্ট্রিং তুলনা, সংখ্যাসূচক তুলনা, বা এমনকি কাস্টম অবজেক্টের তুলনা।
স্থিতিশীলতা: usort() একটি স্থিতিশীল সাজানো অ্যালগরিদম ব্যবহার করে, যার মানে হল যে একই ইনপুট ডেটা সর্বদা একই ক্রমে সাজানো হবে।
কার্যকারিতা: usort() sort() ফাংশনের চেয়ে ধীর হতে পারে, বিশেষ করে বড় অ্যারেগুলির জন্য। যাইহোক, এটি অধিক নমনীয়তা প্রদান করে।
usort() ফাংশনটি অ্যারেগুলিকে আরও জটিল নিয়ম অনুসারে সাজানোর জন্য একটি শক্তিশালী হাতিয়ার। এটি ডেটা সাজানোর জন্য যেকোনো কাস্টম লজিক প্রয়োগ করার জন্য ব্যবহার করা যেতে পারে।


#sort, #rsort, #asort, #arsort, #ksort, #krsort,  #usort, 