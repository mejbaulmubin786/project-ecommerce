```php
<?php
$person = [
    'fname' => 'Hello',
    'lname' => 'World',
];

$newperson = $person; // একটি ভেরিয়েবল যখন আর একটি ভেরিয়েবলে কপি হবে তবে একটি ভেরিয়েবলের সাথে আর একটির কোন সম্পর্ক থাকবে না। সম্পূন্ন নতুন করে হবে। এগুলোকে বলা হয় ডিপকপি
$newperson['lname'] = 'Pluto'; // এই কারণে এখানে পরিবর্তন করলেও পূর্বের টিতে কোন পরিবর্তন হয় নি।

print_r($person);
print_r($newperson);
// একে বলে copy by value / deep copy

//কিন্তু আমরা যদি ভেরিয়েবলের সামনে  & এটি দিতাম তবে এখানে ভেলু কপি হতো না কপি হতো এর রেফারেন্স

$anotherPerson = &$person;
$anotherPerson['lname'] = 'Pluto';

print_r($person);
print_r($anotherPerson); // ফলে দুই জায়গায়ই পরিবর্তন হবে।
// এটি হচ্ছে copy by reference/shallow copy
//-----------------------------------------

function printData($person) { //use copy by value / deep copy
    $person['fname'] .= " Changed";
    print_r($person);
}

printData($person);
print_r($person);

function printData(&$person) { //use copy by reference/shallow copy
    $person['fname'] .= " Changed";
    print_r($person);
}

printData($person);
print_r($person);
```