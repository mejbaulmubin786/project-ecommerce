এবার দেখবো কিভাবে এরেতে সার্চ হতে পারে। কয়েক ধরনের সার্চ হতে পারে যেমন একটি হতে পারে কত তম আফসেটে বিদ্যমান অথবা উপাদানটি এরে তে আছে কিনা।
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
echo "\n";
if (in_array("Banana", $fruits)) {
    echo 'Banana is found';
}
echo "\n";

// 2nd 
$number = [56, 87, 32, 99, 13, 24, '65', 10, 45, 78, 92, 53, 67, 18, 83, 29, 42, 5, 96, 71];

if (in_array(53, $number)) { // এই ফাংশনটি যদি '53' স্ট্রিং হতো তবে ও সার্চ করে পেত 
    echo '53 is found';
}
echo "\n";

// যেমন 
if (in_array(65, $number)) { // এই ফাংশনটি যদি '53' স্ট্রিং হতো তবে ও সার্চ করে পেত 
    echo '53 is found';
}
echo "\n";

// টাইপকে যদি রেস্ট্রিক করতে হয়।
if (in_array(65, $number, true)) {  // এখন আর 65 কে পাওয়া যাবে না।
    echo '53 is found';
}

// আমরা যদি চাই আইটেমটি পাওয়ার সাথে সাথে এটি কতো তম ইনডেক্সে আছে তা ও বের করতে চাই।

$number = [56, 87, 32, 99, 13, 24, '65', 10, 45, 78, 92, 53, 67, 18, 83, 29, 42, 5, 96, 71];

$offset = array_search(65, $number);
echo $offset;
$offset = array_search(65, $number, true);// এবার পাওয়া যেত না। কারন এটি স্ট্রিং নয়।
echo $offset;
//array_search ব্যবহার করলে একটি বিষয় মনে রাখতে হবে যে যদি আমরা কোন একটি উপাদান সার্চ করি তবে সেই উপাদানটি এরেতে যতগুলোই থাকুক না কেন প্রথম উপাদানটিই বের হবে। 
```

```php
//এরে এর ভেতর কোন কি আছে কিনা তা সার্চ করতে চাইলে
if (key_exists('b', $fruits)) {
    echo "key b exists";
}
```
