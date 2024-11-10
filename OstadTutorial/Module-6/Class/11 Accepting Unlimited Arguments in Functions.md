```php
<?php
function sum(int ...$numbers): int // ...(variadic parameters) used to resive unlimited argument
{
  $result = 0;
  for ($i = 0; $i < count($numbers); $i++) {
    $result += $numbers[$i];
  }

  return $result;
}

echo sum(5) . "\n";
echo sum(5, 3) . "\n";
echo sum(5, 3, 4) . "\n";
echo sum(5, 3, 4, 5) . "\n";
echo sum(5, 3, 4, 5, 6) . "\n";
echo sum(5, 2, 3, 5, 6) . "\n";
```

```php
<?php
function sum($x, $y, int ...$numbers): int
{
  $result = 0;
  for ($i = 0; $i < count($numbers); $i++) {
    $result += $numbers[$i];
  }

  return $result;
}

echo sum(5) . "\n"; //wrong, at list two argument must be need
echo sum(5, 3) . "\n"; // Output is 0. because 5 and 3 is not in $numbers
echo sum(5, 3, 4) . "\n";
echo sum(5, 3, 4, 5) . "\n";
echo sum(5, 3, 4, 5, 6) . "\n";
echo sum(5, 2, 3, 5, 6) . "\n";
```

```php
<?php

function printNames(...$names) {
    foreach ($names as $name) {
        echo $name . "<br>";
    }
}

// ফাংশন কল করা
printNames("Alice", "Bob", "Charlie", "Diana");
```

PHP-তে `variadic parameters` (বা "variadic functions") আপনাকে একটি ফাংশনে একাধিক আর্গুমেন্ট প্রদান করার সুবিধা দেয়। এগুলি বিশেষভাবে ফাংশনের মধ্যে একটি অনির্দিষ্ট সংখ্যা আর্গুমেন্ট গ্রহণ করার জন্য ব্যবহৃত হয়। PHP-তে variadic parameters ব্যবহার করার প্রধান উপায় হল `...` (স্প্রেড অপারেটর) দিয়ে একটি প্যারামিটার ডিফাইন করা।

**বিস্তারিত ব্যবহার এবং উদাহরণ:**

### ১. বেসিক ব্যবহারের উদাহরণ

একটি সাধারণ ফাংশন যা একাধিক আর্গুমেন্ট নেয় এবং সেগুলোকে প্রিন্ট করে:

```php
function printArguments(...$args) {
    foreach ($args as $arg) {
        echo $arg . "<br>";
    }
}

// ফাংশন কল
printArguments("Hello", "World", "!", 123);
```

**ব্যাখ্যা:**
- `...$args`: এখানে `...` স্প্রেড অপারেটর দিয়ে একটি ভেরিএবল আর্গুমেন্ট লিস্ট ডিফাইন করা হয়েছে। এটি `$args` নামে একটি অ্যারে তৈরি করে যা সমস্ত প্রাপ্ত আর্গুমেন্ট ধারণ করে।

### ২. আর্গুমেন্টগুলির সংখ্যা সীমাহীন

আপনি কতগুলো আর্গুমেন্ট পাস করবেন তা নির্ধারণ করতে পারবেন না, কারণ variadic parameters যেকোনো সংখ্যা আর্গুমেন্ট গ্রহণ করতে সক্ষম:

```php
function sum(...$numbers) {
    $total = 0;
    foreach ($numbers as $number) {
        $total += $number;
    }
    return $total;
}

// ফাংশন কল
echo sum(1, 2, 3);         // 6
echo sum(5, 10, 15, 20);   // 50
```

**ব্যাখ্যা:**
- `sum` ফাংশন একাধিক সংখ্যা গ্রহণ করে এবং তাদের যোগফল প্রদান করে। এখানে `$numbers` একটি অ্যারে হিসেবে ব্যবহৃত হচ্ছে এবং foreach লুপ ব্যবহার করে তার উপাদানগুলো যোগ করা হচ্ছে।

### ৩. অন্যান্য প্যারামিটারের সাথে Variadic Parameters

Variadic parameters সাধারণত ফাংশনের শেষে রাখা হয়। আপনি যদি অন্যান্য প্যারামিটার (অবশ্যই নির্দিষ্ট সংখ্যক) ব্যবহার করতে চান, তাহলে variadic parameters সর্বশেষে থাকতে হবে:

```php
function displayUserInfo($name, ...$info) {
    echo "Name: " . $name . "<br>";
    echo "Additional Info:<br>";
    foreach ($info as $item) {
        echo "- " . $item . "<br>";
    }
}

// ফাংশন কল
displayUserInfo("Alice", "Engineer", "Loves coding", "Enjoys hiking");
```

**ব্যাখ্যা:**
- এখানে `displayUserInfo` ফাংশনে প্রথম প্যারামিটার `$name` এবং পরবর্তী সকল আর্গুমেন্ট variadic প্যারামিটার `$info` হিসেবে গ্রহণ করা হয়েছে।

### ৪. Array Unpacking

PHP 7.4 থেকে variadic parameters সহ array unpacking ব্যবহার করা যায়। এটি একটি অ্যারেকে variadic প্যারামিটার হিসেবে পাস করতে সাহায্য করে:

```php
function showDetails(...$details) {
    foreach ($details as $detail) {
        echo $detail . "<br>";
    }
}

$array = ["Detail1", "Detail2", "Detail3"];
showDetails(...$array);  // Array Unpacking
```

**ব্যাখ্যা:**
- `...$array` ব্যবহার করে অ্যারের উপাদানগুলো variadic প্যারামিটার হিসেবে `showDetails` ফাংশনে পাস করা হয়েছে।

### ৫. Variadic Parameters এবং Named Arguments

PHP 8.0 থেকে named arguments ব্যবহার করা যায়। এটি variadic parameters এর সাথে সম্মিলিতভাবে কাজ করে:

```php
function createProfile(string $name, ...$details) {
    echo "Name: " . $name . "<br>";
    foreach ($details as $detail) {
        echo "Detail: " . $detail . "<br>";
    }
}

createProfile(name: "Alice", "Age: 30", "Location: NYC");
```

**ব্যাখ্যা:**
- এখানে named arguments ব্যবহার করে `$name` প্যারামিটার নির্দিষ্ট করে বাকী `...$details` প্যারামিটার ব্যবহার করা হয়েছে।

Variadic parameters ব্যবহারের মাধ্যমে আপনি একটি ফাংশনে বিভিন্ন সংখ্যক আর্গুমেন্ট প্রক্রিয়া করতে পারবেন, যা কোডের নমনীয়তা এবং পুনরায় ব্যবহারযোগ্যতা বাড়ায়।

