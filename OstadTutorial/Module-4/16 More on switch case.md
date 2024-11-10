```php
<?php
$n = -11;
$r = $n % 2;

// Switch case to determine if $n is even or odd
switch ($r) {
  case 0:
    switch ($n) {
      case $n > 0:
        echo "{$n} is positive even number";
        break;
      case $n < 0:
        echo "{$n} is negative even number";
        break;
    }
    break;
  default:
    switch ($n) {
      case $n > 0:
        echo "{$n} is positive odd number";
        break;
      case $n < 0:
        echo "{$n} is negative odd number";
        break;
    }
}

echo "\n";

switch (true) {  // যা হোক না কেন কোড যেন চলে।
  case ($r == 0 && $n > 0): // using 0 ==$r is best
    echo "{$n} is positive even number";
    break;
  case ($r == 1 && $n > 0):
    echo "{$n} is positive odd number";
    break;
  case ($r == 0 && $n < 0):
    echo "{$n} is negative even number";
    break;
  case ($r == -1 && $n < 0): // এইভাবে - না লিখতে চাইলে আমরা abs($n)%2 লিখতে পারি
    echo "{$n} is negative odd number";
    break;
}
```






`switch (true)` এবং `switch (a variable)` একই নয়। তারা বিভিন্ন পরিস্থিতিতে ব্যবহৃত হয় এবং তাদের কাজের পদ্ধতি আলাদা।

### `switch (a variable)`

এই পদ্ধতিতে, আপনি একটি ভেরিয়েবল (`a variable`) এর মানের উপর ভিত্তি করে বিভিন্ন `case` চেক করেন। প্রতিটি `case` চেক করে যে ভেরিয়েবলটি একটি নির্দিষ্ট মানের সমান কিনা। উদাহরণস্বরূপ:

```php
<?php
$n = 5;

switch ($n) {
  case 1:
    echo "The number is 1";
    break;
  case 2:
    echo "The number is 2";
    break;
  case 5:
    echo "The number is 5";
    break;
  default:
    echo "The number is something else";
    break;
}
?>
```

উপরের উদাহরণে, `$n` এর মান চেক করা হচ্ছে, এবং যদি `$n` এর মান `5` হয়, তবে "The number is 5" প্রিন্ট হবে।

### `switch (true)`

এই পদ্ধতিতে, আপনি বিভিন্ন বুলিয়ান এক্সপ্রেশন চেক করতে পারেন। প্রতিটি `case` একটি বুলিয়ান এক্সপ্রেশন হিসাবে কাজ করে এবং যদি তা সত্য হয় (true), তবে সেই ব্লকটি এক্সিকিউট হয়। উদাহরণস্বরূপ:

```php
<?php
$n = -12;
$r = $n % 2;

switch (true) {  
  case ($r == 0 && $n > 0):
    echo "{$n} is a positive even number";
    break;
  case ($r != 0 && $n > 0):
    echo "{$n} is a positive odd number";
    break;
  case ($r == 0 && $n < 0):
    echo "{$n} is a negative even number";
    break;
  case ($r != 0 && $n < 0):
    echo "{$n} is a negative odd number";
    break;
}
?>
```

উপরের উদাহরণে, `switch (true)` দিয়ে প্রতিটি `case` বুলিয়ান এক্সপ্রেশন চেক করছে। যেটি সত্য হবে সেটি এক্সিকিউট হবে।

### পার্থক্য

1. **`switch (a variable)`**:
   - এক্ষেত্রে একটি নির্দিষ্ট ভেরিয়াবলের মানের উপর ভিত্তি করে বিভিন্ন `case` চেক করা হয়।
   - প্রতিটি `case` সেই ভেরিয়াবলের সাথে একটি নির্দিষ্ট মান তুলনা করে।

2. **`switch (true)`**:
   - এক্ষেত্রে প্রতিটি `case` একটি বুলিয়ান এক্সপ্রেশন চেক করে।
   - এক্সপ্রেশন সত্য (true) হলে সেই `case` এক্সিকিউট হয়।
   - এটি অনেকগুলি শর্ত একসাথে চেক করতে সহায়ক, যা সাধারণত একাধিক `if-else` ব্লকের মত কাজ করে।

সারসংক্ষেপে, `switch (a variable)` সাধারণত ব্যবহার করা হয় যখন আপনি একটি ভেরিয়াবলের মান চেক করতে চান, এবং `switch (true)` ব্যবহার করা হয় যখন আপনি বিভিন্ন জটিল শর্ত চেক করতে চান।