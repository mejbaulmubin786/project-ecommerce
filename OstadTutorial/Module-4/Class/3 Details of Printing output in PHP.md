# var_dump() 
আমরা এতদিন PHP তে শুধুমাত্র echo দিয়ে আউটপুট পেতাম । এখান আমরা আরো কিছু জানবো।
var_dump() হল PHP এর একটি বিল্ট-ইন ফাংশন যা কোনো ভেরিয়েবলের তথ্য ডাম্প করার জন্য ব্যবহৃত হয়। এটি ভেরিয়েবলের ধরন এবং মান উভয়ই প্রদর্শন করে। var_dump() ফাংশনটি ডিবাগিং করার সময় বিশেষভাবে উপকারী।

নীচে একটি উদাহরণ দেওয়া হল:
```PHP
<?php
// একটি ইন্টিজার ভেরিয়েবল
$intVar = 123;
var_dump($intVar);

// একটি স্ট্রিং ভেরিয়েবল
$stringVar = "Hello, World!";
var_dump($stringVar);

// একাধিক স্ট্রিং ভেরিয়েবল
$Name = "Mejbaul Mubin";
$Uni = "UoPeople";
var_dump($Name, $Uni);

// একটি অ্যারে
$arrayVar = array(1, 2, 3, "foo", "bar");
var_dump($arrayVar);

// একটি অবজেক্ট
class MyClass {
    public $prop1 = "Property 1";
    public $prop2 = "Property 2";
}
$objVar = new MyClass();
var_dump($objVar);
```
Output:
```SCSC
int(123)
string(13) "Hello, World!"
string(13) "Mejbaul Mubin"
string(8) "UoPeople"
array(5) {
  [0]=>
  int(1)
  [1]=>
  int(2)
  [2]=>
  int(3)
  [3]=>
  string(3) "foo"
  [4]=>
  string(3) "bar"
}
object(MyClass)#1 (2) {
  ["prop1"]=>
  string(10) "Property 1"
  ["prop2"]=>
  string(10) "Property 2"
}
```
==PHP-তে মোট আট প্রকারের ডাটা টাইপ আছে। এই ডাটা টাইপগুলো প্রধানত দুইটি ক্যাটেগরিতে ভাগ করা যায়: Scalar Types এবং Compound Types। এছাড়া PHP তে বিশেষ ধরণের দুইটি ডাটা টাইপও রয়েছে। নিচে প্রতিটি ক্যাটেগরি এবং তার অন্তর্ভুক্ত ডাটা টাইপগুলো উল্লেখ করা হলো:==
### Scalar Types:
1. **Integer:** পূর্ণসংখ্যা (যেমন: 1, -2, 100)
2. **Float (double):** দশমিক সংখ্যা (যেমন: 3.14, -0.99)
3. **String:** স্ট্রিং বা টেক্সট (যেমন: "Hello", 'PHP')
4. **Boolean:** বুলিয়ান (যেমন: true, false)

### Compound Types:
5. **Array:** অ্যারে (একাধিক ভ্যালু ধারণ করে) (যেমন: array(1, 2, 3))
6. **Object:** অবজেক্ট (যেমন: class MyClass { } $obj = new MyClass())

### Special Types:
7. **NULL:** নাল (একটি একক মান null)
8. **Resource:** রিসোর্স (একটি বিশেষ ধরন যা PHP বাইরের রিসোর্সের সাথে ইন্টারঅ্যাক্ট করার জন্য ব্যবহার করে, যেমন: একটি ডাটাবেস সংযোগ)

### উদাহরণ:

```php
<?php
// Scalar Types
$integerVar = 42; // Integer
$floatVar = 3.14159; // Float
$stringVar = "Hello, PHP!"; // String
$booleanVar = true; // Boolean

// Compound Types
$arrayVar = array(1, 2, 3, "foo", "bar"); // Array
class MyClass {
    public $prop = "A property";
}
$objectVar = new MyClass(); // Object

// Special Types
$nullVar = NULL; // NULL

// Resource (উদাহরণস্বরূপ একটি ফাইল রিসোর্স)
$resourceVar = fopen("test.txt", "r"); // Resource

// var_dump() দিয়ে প্রতিটি ভেরিয়েবলের টাইপ এবং মান দেখানো
var_dump($integerVar);
var_dump($floatVar);
var_dump($stringVar);
var_dump($booleanVar);
var_dump($arrayVar);
var_dump($objectVar);
var_dump($nullVar);
var_dump($resourceVar);

// Resource ক্লোজ করা
fclose($resourceVar);
?>
```

এই কোডটি চালালে প্রতিটি ভেরিয়েবলের টাইপ এবং মান প্রদর্শিত হবে। PHP তে এই আটটি প্রকারের ডাটা টাইপ বিদ্যমান যা বিভিন্ন ধরণের ডাটা ধারণ এবং প্রক্রিয়া করার জন্য ব্যবহৃত হয়।
Note: PHP is a Loosely Typed Language
In the example above, notice that we did not have to tell PHP which data type the variable is.

PHP automatically associates a data type to the variable, depending on its value. Since the data types are not set in a strict sense, you can do things like adding a string to an integer without causing an error.


PHP-তে escape characters ব্যবহার করা হয় বিশেষ অক্ষর বা সিকোয়েন্সগুলি একটি স্ট্রিংয়ের মধ্যে প্রবেশ করানোর জন্য যা সাধারণত টেক্সট হিসাবে সরাসরি টাইপ করা যাবে না। এগুলি সাধারনত ব্যাকস্ল্যাশ (`\`) চিহ্ন ব্যবহার করে প্রকাশ করা হয়।

নীচে কয়েকটি সাধারণ escape characters এবং তাদের ব্যবহার উদাহরণ সহ ব্যাখ্যা করা হয়েছে:

# সাধারণ Escape Characters:

1. **\n:** নতুন লাইন (Newline)
2. **\t:** ট্যাব (Tab)
3. **\\:** ব্যাকস্ল্যাশ (Backslash)
4. **\":** ডাবল কোট (Double quote)
5. **\':** সিঙ্গেল কোট (Single quote)
6. **\$:** ডলার সাইন (Dollar sign)

### উদাহরণ:

```php
<?php
// নতুন লাইনে টেক্সট ভেঙে দেখানো
echo "Hello,\nWorld!";
// আউটপুট: 
// Hello,
// World!

// ট্যাব ব্যবহার করে টেক্সট দেখানো
echo "Hello,\tWorld!";
// আউটপুট: Hello,  World!

// ব্যাকস্ল্যাশ দেখানো
echo "This is a backslash: \\";
// আউটপুট: This is a backslash: \

// ডাবল কোট দেখানো
echo "She said, \"Hello!\"";
// আউটপুট: She said, "Hello!"

// সিঙ্গেল কোট দেখানো
echo 'It\'s a nice day!';
// আউটপুট: It's a nice day!

// ডলার সাইন দেখানো
echo "This is a dollar sign: \$100";
// আউটপুট: This is a dollar sign: $100
?>
```

### স্ট্রিংয়ের মধ্যে ভেরিয়েবল ব্যবহার:
PHP তে ডাবল কোটেশন স্ট্রিং এর মধ্যে ভেরিয়েবল ব্যবহার করার সময়, যদি আপনি ডলার সাইন (\$) চিহ্নটি স্ট্রিং হিসেবে দেখাতে চান, তবে escape character ব্যবহার করতে হবে।

```php
<?php
$price = 50;
echo "The price is \$" . $price;
// আউটপুট: The price is $50
?>
```

### হেরেডক এবং নাউডক সিনট্যাক্স:
হেরেডক এবং নাউডক সিনট্যাক্স ব্যবহার করে multiline string তৈরি করা যায়, যেখানে escape characters ব্যবহার করার প্রয়োজন নেই।

```php
<?php
// হেরেডক
$str = <<<EOD
This is a string
spanning multiple lines,
without the need for escape characters.
EOD;

echo $str;
// আউটপুট: 
// This is a string
// spanning multiple lines,
// without the need for escape characters.

// নাউডক
$str = <<<'EOD'
This is another string
spanning multiple lines,
also without the need for escape characters.
EOD;

echo $str;
// আউটপুট: 
// This is another string
// spanning multiple lines,
// also without the need for escape characters.
?>
```

এসকেপ ক্যারেক্টারগুলি স্ট্রিং-এর ভিতরে বিশেষ অক্ষরগুলি প্রবেশ করানোর জন্য খুবই গুরুত্বপূর্ণ। এগুলি ব্যবহার করে আপনি স্ট্রিংয়ে নতুন লাইন, ট্যাব, কোটেশন মার্কস ইত্যাদি যোগ করতে পারেন।
# `printf`
ধরুন আমি একটি ভেরিয়েবল এর মান কে আপার কেসে দেখাতে চাচ্ছি তাহলে আমাকে করতে হবে।
```php
<?php
$name = "Mejbaul Mubin";
$uname = strtoupper($name);
echo "My name is {$uname}";
```
এখানে এই সামান্য কাজটি করার জন্য আমাদের নতুন একটি ভেরিয়েবল ডিক্লার করা লাগছে এর থেকে বাচার জন্য আমরা ব্যবহার করতে পারি `printf` ফাংশন ।
```php
<?php
$name = "Mejbaul Mubin";
printf("My name is %s", strtoupper($name));
```
এটি ছাড়াও PHP-তে `printf` ফাংশন একটি গুরুত্বপূর্ণ ফাংশন যা ফরম্যাট করা স্ট্রিং আউটপুট করার জন্য ব্যবহৃত হয়। এটি মূলত স্ট্রিং-এ বিভিন্ন ডেটা টাইপ ইনসার্ট করার জন্য ব্যবহৃত হয়।
 ফাংশনের সিনট্যাক্স:
```php
printf(format, args1, args2, ...);
```

- `format`: একটি স্ট্রিং যা ফরম্যাট স্পেসিফায়ার ধারণ করে।
- `args1, args2, ...`: যেকোনো সংখ্যক আর্গুমেন্ট যা ফরম্যাট স্পেসিফায়ারের সাথে মিলে যাবে।

### ফরম্যাট স্পেসিফায়ার:
ফরম্যাট স্পেসিফায়ারগুলো `%` চিহ্ন দিয়ে শুরু হয় এবং এরপর একটি ক্যারেক্টার থাকে যা ডেটা টাইপ নির্ধারণ করে।

কিছু সাধারণ ফরম্যাট স্পেসিফায়ার:
- `%s` : একটি স্ট্রিং মুদ্রণ করতে ব্যবহৃত হয়।
	  স্ট্রিংয়ের জন্য অতিরিক্ত বৈশিষ্ট্য
	 -  `%-20s`: কমপক্ষে 20টি অক্ষর মুদ্রণ করবে, বাম দিকে সারিবদ্ধ করবে।
- `%d` : দশমিক সংখ্যা (ইন্টিজার)
	  **পূর্ণসংখ্যার জন্য অতিরিক্ত বৈশিষ্ট্য:**
	- `%03d`: কমপক্ষে 3টি অঙ্ক মুদ্রণ করবে, শূন্য দিয়ে ভরাট করবে। (উদাহরণ: 007)
	- `%-10d`: কমপক্ষে 10টি অঙ্ক মুদ্রণ করবে, বাম দিকে সারিবদ্ধ করবে।
- `%f` : ভাসমান বিন্দু সংখ্যা (ফ্লোট)
	 **ভাসমান বিন্দু সংখ্যার জন্য অতিরিক্ত বৈশিষ্ট্য:**
	 - %.2f: দশমিকের পরে 2টি অঙ্ক মুদ্রণ করবে।
	 - %10.2f: কমপক্ষে 10টি অঙ্ক মুদ্রণ করবে, দশমিকের পরে 2টি অঙ্ক, ডান দিকে সারিবদ্ধ করবে।
- `%x` : হেক্সাডেসিমাল সংখ্যা
	- `%x, %X`: একটি পূর্ণসংখ্যাকে হেক্সাডেসিমালে রূপান্তর করতে।(x=lowercase, X=Upper Case)
	- `%o`: একটি পূর্ণসংখ্যাকে অক্টালে রূপান্তর করতে।
- `%c`: একটি একক অক্ষর মুদ্রণ করতে ব্যবহৃত হয়।
- %e, %E: একটি ভাসমান বিন্দু সংখ্যাকে বৈজ্ঞানিক নোটেশনে রূপান্তর করতে।
### উদাহরণ:

1. **স্ট্রিং ফরম্যাটিং:**

```php
$name = "John";
printf("Hello, %s!", $name);
```
আউটপুট: `Hello, John!`

2. **ইন্টিজার ফরম্যাটিং:**

```php
$year = 2024;
printf("The year is %d.", $year);
```
আউটপুট: `The year is 2024.`

3. **ভাসমান বিন্দু সংখ্যা ফরম্যাটিং:**

```php
$price = 123.45;
printf("The price is %.2f.", $price);
//output: The price is 123.45.
```
> **বিঃদ্রঃ** এখানে `%.2f` ফরম্যাট স্পেসিফায়ারটি ভাসমান বিন্দু সংখ্যাকে ২ দশমিক স্থান পর্যন্ত ফরম্যাট করবে।

4. **মাল্টিপল আর্গুমেন্টস:**

```php
$name = "Alice";
$age = 30;
printf("%s is %d years old.", $name, $age);
```
আউটপুট: `Alice is 30 years old.`
```php
$fname = "Mejbaul";
$lname = "Mubin";
printf("My %s Name is %s %s", "Full", $fname, $lname);
//output: My Full Name is Mejbaul Mubin
```


5. **হেক্সাডেসিমাল ফরম্যাটিং:**

```php
$number = 255;
printf("The number %d in hexadecimal is %x.", $number, $number);
```
আউটপুট: `The number 255 in hexadecimal is ff.`

### অন্যান্য ফরম্যাটিং অপশন:
- `%b` : বাইনারি সংখ্যা
- `%e` : বৈজ্ঞানিক নোটেশন (ভাসমান বিন্দু সংখ্যা)
- `%c` : ASCII ভ্যালুর ক্যারেক্টার

### পূর্ণ ফরম্যাটিং এর উদাহরণ:

```php
$name = "Bob";
$score = 95.75;
$age = 20;

printf("Name: %s\nScore: %.2f\nAge: %d", $name, $score, $age);
```
আউটপুট:
```
Name: Bob
Score: 95.75
Age: 20
```

### `sprintf` ফাংশন:
`printf` এর একটি ভ্যারিয়েন্ট `sprintf`। এটি একইভাবে কাজ করে, তবে আউটপুট স্ট্রিংকে রিটার্ন করে, ইকো বা প্রিন্ট করার পরিবর্তে।

```php
$name = "Charlie";
$greeting = sprintf("Hello, %s!", $name);
echo $greeting;
```
আউটপুট: `Hello, Charlie!`

এইভাবে, `printf` এবং এর ফরম্যাট স্পেসিফায়ারগুলো ব্যবহার করে আপনি বিভিন্ন ডেটা টাইপ সুন্দরভাবে ফরম্যাট করে আউটপুট করতে পারবেন।

```php
<?php
$planet1 = "Mercury";
$planet2 = "Jupiter";
echo "The smallest planet is ".$planet1." and the biggest planet is ".$planet2."\n";
echo "The smallest planet is {$planet1} and the bigget planet is {$planet2}\n";
printf("The smallest planet is %s and the biggest planet is %s\n", $planet1, $planet2); // যখন আমরা সারভারে কাজ করবো তখন \n এটি কাজ করবে না তখন হবে <br>
printf("The smallest planet is %s and the biggest planet is %s\n", strtoupper($planet1), strtorev($planet2));
//output: The smallest planet is Mercury and the biggest planet is Jupiter
//        The smallest planet is Mercury and the bigget planet is Jupiter
//        The smallest planet is Mercury and the biggest planet is Jupiter
//        The smallest planet is MERCURY and the biggest planet is retipuJ
```
