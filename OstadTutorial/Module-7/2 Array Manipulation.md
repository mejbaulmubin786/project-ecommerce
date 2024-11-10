```php
$students = [ //এবাবেও লেখা যায়
    "Rohim",
    "Karim",
    123,
    "Monir",
];
//এর immutabel নয় অর্থা’ এটি mutable
$students[2] = "Shafik"; //এখন 123, এর বদল হয়ে গেছে।
```

```php
<?php
$students = array(
    "Rohim",
    "Karim",
    123,
    "Monir",
    "Abdullah",
    "Rahim",
    "Karim",
    "Jamal",
    "Akbar",
    "Naseem",
    "Iman",
    "Ali",
    "Hasib",
    "Sohel",
    "Rifat",
    "Shahin",
    "Fahim",
    "Sharif",
    "Rabi",
    "Nadim",
    "Ripon",
    "Nasrullah",
    "Shahzad",
);
$students[2] = "Shafik";
$student = array_pop($students); // সর্বশেষ থেকে উপাদান তুলে নিতে।

echo $student;

$student = array_shift($students); // প্রথম থেকে উপাদান তুলে নিতে।
echo $student;


$students[] = "Mejbaul Mubin"; // লাস্টে উপাদান যোগ করতে
var_dump($students);

array_push($students, "Rubel");// শেষে উপাদান যুক্ত করা।
var_dump($students); 

array_unshift($students, "Salam"); // প্রথমে উপাদান যুক্ত করতে।
var_dump($students);

```
some mehtod for array.
array_shift();
array_unshift();
array_pop(); //
array_push();



