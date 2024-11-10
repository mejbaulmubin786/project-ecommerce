```php
<?php
$n = 11;

// Using if-else statements
if (12 == $n) {
  echo "Twelve";
} else if (10 == $n) {
  echo "Ten";
} else { 
  echo "A Number";
}

echo "\n";

// Using ternary operator
$numberInWord = (12 == $n) ? "Twelve" : "A Number";

// Using nested ternary operators with proper parentheses
$numberInWord2 = (12 == $n) ? "Twelve" : ((10 == $n) ? "Ten" : "A Number");

echo $numberInWord;
echo "\n";
echo $numberInWord2;
echo "\n";

// Checking if a number is even or odd using if-else
if ($n % 2 == 0) {
  echo "$n is an even number";
} else {
  echo "$n is an odd number";
}

echo "\n";

// Checking if a number is even or odd using ternary operator
echo ($n % 2 == 0) ? "{$n} is an even number" : "{$n} is an odd number";
``` 
