```php
$numbers = array();
for ($i = 1; $i < 20; $i++) {
    array_push($numbers, $i);
} // আমরা যদি একটি নির্দিষ্ট সংখ্যা থেকে আরেকটি সংখ্যা পর্যন্ত সংখ্যা গুলো নিয়ে একটি এরে তৈরি করতে চাই

print_r($numbers);

// এটি কে আরো সহজে করা যায়
$numbers2 = range(1, 19);
print_r($numbers2);

$numbersEv = range(2, 19, 2); // স্টেপিং উলেখ করে শুধুমাত্র যোড় সংখ্যা গুলো নেওয়া যায়।
print_r($numbersEv);

foreach (range(2, 20, 2) as $evenNumber) {
    echo $evenNumber."\n";
}
foreach (range(0, 50, 7) as $sevenMultiple) {

    if ($sevenMultiple > 0) {
        echo $sevenMultiple . "\n";
    }
}
```
#range, 