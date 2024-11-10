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

$random = ['a' => 12, 'b' => 45, 'c' => 34, 'd' => 22, 'e' => 77, 'f' => 31, 12 => 78, 'g' => 87];
// এবার দুইটা এরে কে মার্জ করে একটা এরে তৈরি।

$newFruits1 = array_slice($fruits, 0, 3);
$newFruits2 = array_slice($fruits, 13);

$newFruits = array_merge($newFruits1, $newFruits2);
print_r($newFruits1);
print_r($newFruits2);
print_r($newFruits);
//array_merge ছাড়াও আমাদের নিচের মতো একটি অপশন আছে

$newFruitsPlus = $newFruits1 + $newFruits2; //তবে লক্ষনিয় বিষয় এই ভাবে করলে array_merge মতো আউপুট পাওয়া যাচ্ছে না। কারণ এখানে এভাবে যদি আমরা করি তবে php দেখে $newFruits1 মানে প্রথমটার মাঝে কোন কোন ইলিমেন্ট আছে যে গুলো আছে সেগুলো বাদ দিনে দ্বিতীয়টির অন্য ইনডেক্স গুলে যোগ করবে।
print_r($newFruitsPlus);
//তবে আমরা যদি $newFruits2 বসাতাম তমে ইনডেক্স প্রিজার্ভ করতো এবং $newFruitsPlus  এর মতো আউটপুট পেতো।
$newFruits2 = array_slice($fruits, 13, null, true);
```

```php
<?php
//এখন যদি আমরা এসোসিয়েট এরে নিয়ে কাজ করি।
$random = ['a' => 12, 'b' => 45, 'c' => 34, 'd' => 22, 'e' => 77, 'f' => 31, 12 => 78, 'g' => 87];

$randomData = array_splice($random, 2, 2, array("j" => 45, "k" => 12));

print_r($randomData);
print_r($random); // এখানে লক্ষ করলে দেখা যায় মুল ("j" => 45, "k" => 12) এরের কি গুলো আর প্রিজার্ভ নেই আবার মুল আরে $random এর 12 => 78 এর ইনডেক্স ও আর প্রিজার্ভ নেই। এই সমস্যা থেকে মুক্তি পাওয়ার জন্য আমরা যা করতে পারি।

$r1 = array_slice($random, 0, 2, true);
$r2 = array_slice($random, 4, null, true);
$r3 = array("j" => 45, "k" => 12);

$randomDataCorrectWay = $r1 + $r2 + $r3;
print_r($randomDataCorrectWay); // এবার অফসেট প্রিজার্ভ আছে

```