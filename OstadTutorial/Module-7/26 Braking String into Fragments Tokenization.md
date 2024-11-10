```php
<?php
//01
echo "Main Array";
echo "\n";
$string = "Mejbaul Mubin, Rubel, Sanzida Islam, Pritey";
echo ($string);
$parts = explode(" ", $string);
echo "\n";
echo "No 1 explode";
echo "\n";
print_r($parts); // স্পেস ওয়ালা অংশ গুলো আলাদা আলাদা এরের ইলিমেন্ট হবে।

echo "\n";
//02
$parts2 = explode(", ", $string); // যদি বলতাম , দিয়ে ভাঙ্গ
echo "\n";
echo "No 2 explode 2";
echo "\n";
print_r($parts2);

//এতক্ষন আমরা স্ট্রিং কে টুকরো টুকরো করেছি এখন যদি সেগুলোকে যোগ করে মুল স্ট্রিং ফিরিয়ে আনতে চাই তবে।
//First way
$original = join(" ", $parts);// এখানে " " এই অংশটি হচ্ছে GLUE 
print_r($original);
echo "\n";
echo "\n";
echo ($original);

echo "\n";
echo "No 3 join";
echo "\n";
echo "\n";
//Second way
$original2 = implode(" ", $parts2);
print_r($original2);
echo "\n";

// যদি প্রতিটি কেরেকটার দিয়ে করতে চাই তবে তো আর কোন ডেলিমিটার এর কোন কাজ নেই।

echo "\n";
echo "No 4 str_split";
echo "\n";
echo "\n";
$original3 = str_split($string);
print_r($original3);
echo "\n";
```

এখন কোন কেরেকটার কয়টা আছে তা যদি বের করতে চাই <mark style="background: #FFB8EBA6;">Assignment</mark> 

যদি আমরা চাই " " ও ", " এবং "," এবং আরো কিছু ডেলিমিটার যুক্ত করবো তা কি সম্ভব। অর্থাৎ মাল্টি ডেলিমিটার যু্ক্ত করতে চাই তবে কি সম্ভব না এটি সরাসরি সম্ভব নয়। তবে এর জন্য দুটি পদ্ধতি আছে একটি রেগুলার এক্সপ্রেশন আর একটি পদ্ধতি হচ্ছে strtok আমরা প্রথম পদ্ধতি পরে দেখবো।
```php
//ফাংশনের সিনট্যাক্স
strtok(string $string, string $token): string|false
```
**কিভাবে strtok কাজ করে**
প্রথমবার যখন strtok কল করা হয়, তখন দুটি প্যারামিটার পাস করতে হয়: প্রথমটি স্ট্রিং এবং দ্বিতীয়টি ডেলিমিটার।
পরবর্তী কল গুলোতে শুধুমাত্র ডেলিমিটার পাস করতে হয় এবং এটি পূর্ববর্তী স্ট্রিং থেকে পরবর্তী টোকেন রিটার্ন করে।
যদি আর কোন টোকেন না পাওয়া যায়, তাহলে এটি false রিটার্ন করে।
উদাহরণ

```php
<?php
$string = "Hello, world! Welcome to PHP programming.";
$delimiters = " ,!.";

$token = strtok($string, $delimiters);

while ($token !== false) {
    echo "$token\n";
    $token = strtok($delimiters);
}
?>
```
উপরের উদাহরণে, strtok প্রথমে "Hello, world! Welcome to PHP programming." স্ট্রিং এবং " ,!." ডেলিমিটার পাস করা হয়। প্রথম কল এ এটি "Hello" রিটার্ন করবে। তারপর প্রতিবার strtok ডেলিমিটার দিয়ে কল করলে, এটি পরবর্তী টোকেন রিটার্ন করবে।  এই ফাংশনটিট ব্যবহার করলে ওয়ার্ড গুলো কাউন্ট করা যায় না।
```php
<?php
$string = "Mejbaul Mubin, Rubel, Sanzida Islam, Pritey";
$parts3 = strtok($string, " ,");

while ($parts3 !== false) {
    echo $parts3;
    $parts3 = strtok(" ,");
}
```
যদি আমরা একই ভাবে ভঙতে ও চাই এবং কাউন্ট ও করতে চাই তবে রেগুলার এক্সপ্রেশন ব্যবহার করতে হবে।
preg_split একটি শক্তিশালী PHP ফাংশন যা নিয়মিত অভিব্যক্তি (regular expressions) ব্যবহার করে স্ট্রিং বিভক্ত করতে ব্যবহৃত হয়। এটি split বা explode এর মতো কাজ করে, তবে নিয়মিত অভিব্যক্তির সাহায্যে আরও জটিল এবং ডাইনামিক প্যাটার্নের ভিত্তিতে স্ট্রিং বিভাজন করতে পারে।
```php
//preg_split ফাংশনের সিনট্যাক্স
preg_split(string $pattern, string $subject, int $limit = -1, int $flags = 0): array|false

```

প্যারামিটারগুলি
$pattern: বিভাজনের জন্য ব্যবহার করা নিয়মিত অভিব্যক্তি।
$subject: যে স্ট্রিংটি বিভক্ত করা হবে।
$limit: কতোগুলি উপাদানে বিভক্ত করা হবে তার সীমা নির্ধারণ করে। ডিফল্ট মান হলো -1, যা কোন সীমা নেই বোঝায়।
$flags: অতিরিক্ত বিকল্প যা নিয়মিত অভিব্যক্তির সাথে কাজ করতে ব্যবহৃত হয়। কিছু সাধারণ ফ্ল্যাগ হল:
PREG_SPLIT_NO_EMPTY: খালি উপাদানগুলো বাদ দেয়।
PREG_SPLIT_DELIM_CAPTURE: বিভাজকের ক্যাপচার করা অংশগুলোও রিটার্ন করে।
PREG_SPLIT_OFFSET_CAPTURE: রিটার্ন করা উপাদানগুলোর সাথে তাদের অবস্থানও প্রদান করে।
উদাহরণ
সরল বিভাজন:
```php
<?php
$string = "Hello, world! Welcome to PHP programming.";
$pattern = "/[\s,!.]+/";  // Space, comma, exclamation mark, or dot

$result = preg_split($pattern, $string);

print_r($result);
?>
```
উপরের উদাহরণে, preg_split স্ট্রিংটি স্পেস, কমা, বিস্ময়বোধক চিহ্ন, এবং ডট দ্বারা বিভক্ত করে।

আউটপুট হবে:
```php
Array
(
    [0] => Hello
    [1] => world
    [2] => Welcome
    [3] => to
    [4] => PHP
    [5] => programming
)

```

PREG_SPLIT_NO_EMPTY ফ্ল্যাগ সহ ব্যবহার:
```php
<?php
$string = "Hello, world! Welcome to PHP programming.";
$pattern = "/[\s,!.]+/";

$result = preg_split($pattern, $string, -1, PREG_SPLIT_NO_EMPTY);

print_r($result);
?>
```

এই ক্ষেত্রে, খালি উপাদানগুলো রিটার্ন হবে না।

PREG_SPLIT_DELIM_CAPTURE ফ্ল্যাগ সহ ব্যবহার:
```php
<?php
$string = "Hello, world! Welcome to PHP programming.";
$pattern = "/([\s,!.]+)/";

$result = preg_split($pattern, $string, -1, PREG_SPLIT_DELIM_CAPTURE);

print_r($result);
?>
```

এই উদাহরণে, বিভাজকের অংশগুলোও রিটার্ন হবে।

আউটপুট হবে:
```php
Array
(
    [0] => Hello
    [1] => , 
    [2] => world
    [3] => ! 
    [4] => Welcome
    [5] =>  
    [6] => to
    [7] =>  
    [8] => PHP
    [9] =>  
    [10] => programming
    [11] => .
)
```
preg_split একটি স্ট্রিংকে নিয়মিত অভিব্যক্তির প্যাটার্ন অনুসারে বিভক্ত করতে একটি শক্তিশালী এবং নমনীয় টুল।
#assignment,  