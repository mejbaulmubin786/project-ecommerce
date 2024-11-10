```php
$number = [1, 87, 12, 15, 3, 2, 16, 10, 14, 11, 9, 13, 7, 8, 17, 18, 4, 5, 6, 19];

$number = [1, 20, 12, 15, 3, 2, 16, 10, 14, 11, 9, 13, 7, 8, 17, 18, 4, 5, 6, 19];
sort($number);
function square($n) {
    printf("Sqare of %d is %d \n", $n, $n * $n);
}

array_walk($number, 'square'); // এই ফাংশনটি মুল এরেতে কোন পরিবর্তন করে না। এটি একটি এরের প্রতিটি উপাদানের উপর কোন কাজ করার জন্য ব্যবহার হয়।
function cube($n) {
    return $n * $n * $n;
}

$newArray = array_map('cube', $number);

print_r($number);
print_r($newArray);

function even($n) {
    return $n % 2 == 0;
}

$evenArray = array_filter($number, 'even');

print_r($evenArray);

function odd($n) {
    return $n % 2 == 1;
}

$oddArray = array_filter($number, 'odd');
print_r($oddArray);
```

```php
<?php
$person = array('sujon', 'kabir', 'sabab', 'selim', 'rony', 'Mejbaul', 'Mubin', 'jamal', 'kamal', 'sayma');

function filterlByS($name) { // যাদের নাম s দিয়ে শুরু শুধু তাদের নাম বের হবে।
    return $name[0] == 's';
}

$newPerson = array_filter($person, 'filterlByS');
print_r($newPerson);
```
#walk,  #map, #filter, 