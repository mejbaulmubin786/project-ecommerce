```php
<?php
$numbers = range(40, 72);
//print_r($numbers);

$random = mt_rand(0, 32);
echo $numbers[$random];
echo "\n";
$random1 = mt_rand(0, 32);
echo $numbers[$random1];

$luck = $numbers[$random];
echo "\n";
if ($luck % 2 == 0) {
    echo "Head";
} else {
    echo "Tail";
}

// 2nd process
shuffle($numbers);
print_r($numbers);

$randomNumber = $numbers[3];
echo $randomNumber;
```
#shuffle, #mt_rand, 
