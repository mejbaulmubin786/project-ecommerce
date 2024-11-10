```php
$number = [1, 87, 12, 15, 3, 2, 16, 10, 14, 11, 9, 13, 7, 8, 17, 18, 4, 5, 6, 19];

function sum($oldValue, $newValue) {
    return $oldValue + $newValue;
}

$sum = array_reduce($number, 'sum');
echo $sum;

//এভাবে কাজ করে
sum(0, 1); // return 1
sum(1, 87); // return 88
sum(88, 12); //return 100
// এভাবে চলতে থাকবে

function sum($oldValue, $newValue) {
    if ($newValue % 2 == 0) {
        return $oldValue + $newValue;
    }
    return $oldValue;
}

$sum = array_reduce($number, 'sum');
echo $sum;

echo count($number) . "\n"; // এই ফাংশনটিও একটি রিডিউসার
```
#Reduce, 