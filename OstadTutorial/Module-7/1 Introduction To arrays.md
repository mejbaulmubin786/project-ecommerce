```php
<?php
$students = array(
    "Rohim",
    "Karim",
    123,
    "Monir",
);

$students = [ //এবাবেও লেখা যায়
    "Rohim",
    "Karim",
    123,
    "Monir",
];

var_dump($students);

$n = count($students); // প্রথমে এভাবে $n বের করাটা গুড প্রেকটিস কারণ ফর লুপের মাঝে যদি আমরা count($students) বের করতাম তবে অপ্রয়োজনে এই ফাংশনটি বার বার বের করা লাগতো। এইক কাজের হিসাব বার বার করা লাগতো। কিন্তু আমারা এভাবে লেখায় হিসাব এক বার ই হয়েছে।

for ($i = 0; $i < $n; $i++) {
    echo $students[$i] . "\n";
}

for ($i = $n-1; $i >=0; $i--) {
    echo $students[$i] . "\n";
}

```