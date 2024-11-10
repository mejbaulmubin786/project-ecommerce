
```php
$foods = [
    'vegetables' => explode(', ', 'brinjal, brocolli, carrot, capsicam'),
    'fruits' => explode(', ', 'orange, banana, apple'),
    'drinks' => explode(', ', 'water, milk')
]; // explode মেথডটি ব্যবহার করে স্ট্রিং গুলোকে ও এরেতে রুপান্তরিত করা হয়েছে।

print_r($foods);

array_push($foods['drinks'], 'orange juice'); // new item add
print_r($foods);

echo $foods['vegetables'][3]; // ফুড এরের ভেতর ভেজিটেবল এরে এর তিন নাম্বার offset (  উপাদান) দেখতে হলে।
``` 
#offset

```php
<?php

$sample = [
    'test' => [
        'test-again' => [
            'a',
            'b',
            'c',
            'd',
        ],
    ],
];

echo $sample['test']['test-again'][2]; //নেস্টেড লুপের ভেতর কোন উপদানকে সরাসরি একসেস করতে চাইলে
$sample2 = [
    [1, 2, 3, 4, 5, 6, 7],
    [11, 22, 33, 44, 55, 66, 77],
    [111, 222, 333, 444, 555, 666, 777],
    [1111, 2222, 3333, 4444, 5555, 6666, [8, 9, 10]],

];
echo $sample2[3][6][1];
```