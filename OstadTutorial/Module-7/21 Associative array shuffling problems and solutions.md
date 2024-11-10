```php
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
shuffle($fruits);// এসোসিয়েট এরেকে সাফল করার কারণে এটি কি গুলোকে হারিয়ে ফেলছে।
print_r($fruits);
//এই ক্ষেত্রে আমরা যা করতে পারি 
$key = array_rand($fruits);// এবার array_rand ফাংশনটি এরে থেকে রেনডম একটি কি রিটার্ন করবে।
echo $key;
echo "\n"; 
echo $fruits[$key];
```