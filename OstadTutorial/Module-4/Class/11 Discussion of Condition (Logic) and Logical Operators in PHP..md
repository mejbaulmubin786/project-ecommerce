
| Operator  | Name               | Example    |     |
| --------- | ------------------ | ---------- | --- |
| &&        | And                | $x && $y   |     |
| and       | Low-precedence and | $x and $y  |     |
| \|\|      | or                 | $x \|\| $y |     |
| or        | Low-precedence or  | $x or $y   |     |
| xor       | Exclusive or       | $x xor $y  |     |
```php
<?php
$n = 13;
if ($n % 2 == 0) {
  echo "$n is an even numver";
} else {
  echo "$n is a odd number";
}
$n2 = 0b1101;

if ($n == $n2) {
  echo "both number is equal";
} else {
  echo "both is not equal";
}
```
More complex. 
```php
<?php
$weather = 'raining';

if ($weather == 'sunny') {
    echo 'Wear sunglasses.';
} elseif ($weather == 'raining') {
    echo 'Take an umbrella.';
} else {
    echo 'Enjoy the weather.';
}
```
উপরের মতো করে কোড না লিখে নিচের মতো করে লেখলে ভালো কারণ উপরের মতো করে লিখলে যদি ভুল বসত একটি = চিহ্ন দেওয়া হয় তবে ভেরিয়েবলে নতুন ডাটা এসাইন হয়েছে ধরে প্রোগ্রাম চলবে কিন্তু ভুল রেজাল্ট দিবে। নিচের মতো করে লিখলে একটি = চিহ্ন দিলে error হবে। করণ স্টেটিক ডাটার ভেতর ভেরিয়েবল এসাইন করা যায় না । বরং উপরের মতো ভেরিয়েবলে স্টেটিক ডাটা এসাইন করা যায়।
```php
if ('sunny' == $weather) {
  echo 'Wear sunglasses.';
} elseif ('raining' == $weather) {
  echo 'Take an umbrella.';
} else {
  echo 'Enjoy the weather.';
}
```
একের অধিক শর্ত যুক্ত করতে চাইলে।
```php
$weather = 'raining';
$time = 'morning';

if ('sunny' == $weather) {
    echo 'Wear sunglasses.';
} elseif ('raining' == $weather || 'evening' == $time) {
    echo 'Take an umbrella.';
} else {
    echo 'Enjoy the weather.';
}
```
