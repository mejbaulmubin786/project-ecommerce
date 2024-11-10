```php
<?php
$students = [
    '16' => "Abdullah",
    '27' => "Rahim",
    '29' => "Karim",
    '3' => "Jamal",
    '2' => "Akbar",
    '15' => "Nadim",
    '21' => "Iman",
    '24' => "Ali",
    '18' => "Rabi",
    '23' => "Sohel",
    '1' => "Rifat",
    '26' => "Shahzad",
    '10' => "Fahim",
    '5' => "Sharif",
    '8' => "Ripon",
    '17' => "Nasrullah",
];
echo $students['3'];
echo $students[3]; // যদিও ইনডেক্স ছিলো স্ট্রিং তবুও এটি সম্ভব কারণ সংখ্যাগুলো ছিলো ওয়েল ফর্ম ।
//কিন্তু যদি নিচের মতো লেখা থাকতো।
$staf = [
    '16k' => "Abdullah",
    '27k' => "Rahim",
    '29k' => "Karim",
    '3' => "Jamal",
    '2' => "Akbar",
    '15k' => "Nadim",
    '21' => "Iman",
    '24' => "Ali",
    '18' => "Rabi",
    '23' => "Sohel",
    '1' => "Rifat",
    '26' => "Shahzad",
    '10' => "Fahim",
    '5' => "Sharif",
    '8' => "Ripon",
    '17' => "Nasrullah",
];

echo $staf['15k'];
echo $staf[15k]; // এটি কোন মতে ই সম্ভব নয় কারণ সংখ্যা ওয়েল ফর্ম নয়।
```

```php
<?php

$foods = [
    'vegetables' => 'brinjal, brocolli, carrot, capsicam',
    'fruits' => 'orange, banana, apple',
    'drinks' => 'water, milk',
];

echo $foods['vegetables'];
echo "\n\n";
foreach ($foods as $key => $value) {
    echo $key . "=" . $value . "\n";
} // 1st
echo "\n\n";
$keys = array_keys($foods);
for ($i = 0; $i < count($keys); $i++) {
    $key = $keys[$i];
    echo $foods[$key] . "\n";
} //second
echo "\n\n";
$values = array_values($foods);
for ($i = 0; $i < count($values); $i++) {
    $value = $values[$i];
    echo $value . "\n";
} //third
$foods['drinks'] = $foods['drinks'] . ", orange juice"; // অর্থাৎ আগের আইটেমের সাথে নতুন আইটেম যোগ হবে। আরো সহজভাবে লিখতে হলে নিচের মতো করে লিখা যায়।
$foods['drinks'] .= ", orange juice";
```
