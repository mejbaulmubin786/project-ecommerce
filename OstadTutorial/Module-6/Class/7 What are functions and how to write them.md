```php
<?php  //name function.php

/**
 * Determines if the argument is even or odd
 * @param mixed $n
 * @return bool
 */
function isEven($n) //parameter
{
  if ($n % 2 == 0) {
    return true;
  }
  return false;
}
?>


<?php
include_once("function.php");

$x = 13;
if (isEven($x)) {  //argument
  echo "{$x} is an even number";
} else {
  echo "{$x} is an odd number";
}
```
