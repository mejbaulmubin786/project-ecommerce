```PHP
<?php

$random = ['a' => 12, 'b' => 45, 'c' => 34, 'd' => 22, 'e' => 77, 'f' => 31, 12 => 78, 'g' => 87];

$randomData = array_slice($random, 1, -1, true);
print_r($randomData);
print_r($random);
//পূর্বের উদাহরণে আমরা দেখেছি array_slice ব্যবহার করলে $randomData এর পরিবর্তন যা ই হোক না কেন  $random অর্থাৎ মুল এরে এর কোন পরির্বন ই হচ্ছে না। এখন যদি এমন হয় আমাদের এরে থেকে কিছু অংশ কেটে নিয়ে আসতে হবে।
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

$someFruits = array_splice($fruits, 2, 2);
print_r($someFruits);
print_r($fruits); // এই ফাংশনে মুল এর থেকে মান গুলো বাদ চলে গেছে।
$newFruits = ["jackfruit", "tamarind"];
//আমরা যদি চাই বাদ যাওয়ার পাশাপাশি নতুন ডাটা যোগ ও হোক
$someFruits2 = array_splice($fruits, 2, 2, $newFruits);
print_r($someFruits2);
print_r($fruits);
```


