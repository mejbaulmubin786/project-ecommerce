Calculate Leap Year:
```php
<?php
$year = 2000;

if ($year % 4 == 0 && $year % 100 != 0) {
  echo "$year is leap Year";
} elseif ($year % 4 == 0 && $year % 100 == 0 && $year % 400 == 0) {
  echo "$year is leap Year";
} else {
  echo "$year is not leap Year";
}
echo "\n";
//short

if ($year % 4 == 0 && ($year % 100 != 0 || $year % 400 == 0)) { 
//here we have to know
//true && true = true 
//false && true or true && false = false
//true || false = true
  echo "{$year} is leap Year";
} else {
  echo "{$year} is not leap Year";
}
```

যদিও টপিক নয় তবু ফাংশন ব্যবহার করে নিজের একটি কোর্ড করলাম।
```php
<?php
function isLeapYear($year) {
    return ($year % 4 == 0 && $year % 100 != 0) || ($year % 400 == 0);
}

$year = 2000;

if (isLeapYear($year)) {
    echo "$year is a leap year";
} else {
    echo "$year is not a leap year";
}
```

or 

```php
function isLeapYear($year) {
    return ($year % 4 == 0 && $year % 100 != 0) || ($year % 400 == 0);
}
$year = 2000;

echo isLeapYear($year) ? "$year is a leap year" : "$year is not a leap year";
```
