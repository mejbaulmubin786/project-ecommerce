if, else, elseif Alternative Syntax
```php
<?php
if ($a == 5):
    echo "a equals 5";
    echo "...";
    echo PHP_EOL; // Work as "\n"
elseif ($a == 6):
    echo "a equals 6";
    echo "!!!";
else:
    echo "a is neither 5 nor 6";
endif;
?>
```
switch 
```php
<?php
switch ($expression):
    case $value1:
        // কোড ব্লক 1
        break;
    case $value2:
        // কোড ব্লক 2
        break;
    default:
        // ডিফল্ট কোড ব্লক
        break;
endswitch;
```
এই পদ্ধতি লুপের বেলায় ও কাজ করে।

এভাবে ও লেখা যায়

```php
<?php
$a = 5;
if ($a == 5) :
?>
  a equals 5
  ...
<?php
  echo PHP_EOL; // Work as "\n"
elseif ($a == 6) :
?>
  a equals 6
  !!!
<?php
else :
  echo "a is neither 5 nor 6";
endif;
?>
```
এভাবে কোর্ড লিখলে ?> ক্লোজিং করা টা বাধ্যতা মুলক । কিন্তু কোথাও শুধু মাত্র php কোর্ড থাকলে ?> না করা টাই সঠিক