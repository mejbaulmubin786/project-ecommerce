```php
$numbers1 = [12, 23, 45, 14, 56, 34, 17, 21];
$numbers2 = [45, 12, 77, 23, 53, 15, 18, 15];
$fruits1 = array(
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

$fruits2 = array(
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
$common = array_intersect($numbers1, $numbers2); // কমন  ইলিমেন্ট গুলো পাবো
print_r($common);

$commonFruits = array_intersect($fruits1, $fruits2); // কমন  ইলিমেন্ট গুলো যদি আমরা এভাবে চেক করি তবে এখানে দুটি এরেতে একই উপাদান থাকলেও প্রথম এরের ইনডেক্স গ্রহণ করে । কারণ এই ফাংশন কি চেক করে না শুধু ভেলু চেক করে।
print_r($commonFruits);
$commonFruits2 = array_intersect_assoc($fruits1, $fruits2); // এটি ভেলূ চেক করার পাশাপাশি কি ও চেক করে।
print_r($commonFruits2);

$diff = array_diff($numbers1, $numbers2); //দ্বিতীয় এরেতে যে যে উপাদান গুলো আছে সেগুলোকে প্রথম এরে থেকে বাদ দিতে এই ফাংশন ব্যবহার হয়।
print_r($diff);
$diffFruits = array_diff($fruits1, $fruits2);
print_r($diffFruits);
$diffFruitsWithKey = array_diff_assoc($fruits1, $fruits2);// এটি ভেলূ চেক করার পাশাপাশি কি ও চেক করে।
print_r($diffFruitsWithKey);


```