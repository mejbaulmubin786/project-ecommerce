```php
<?php

function factorial(int $n)
{
  $result = 1;
  for ($i = $n; $i > 1; $i--) {
    $result *= $i;
  }
  return $result;
}
?>

<?php
include_once("function.php");

$x = 5;
echo "Factorial of {$x} is " . factorial($x);
```

```php
//bellow in php 7 where type hinting is not possible and we want to chelk type
<?php

function factorial($n)
{
  if (gettype($n) == "integer") {
    return "invalid";
  }
  $result = 1;
  for ($i = $n; $i > 1; $i--) {
    $result *= $i;
  }
  return $result;
}

<?php
<?php
include_once("function.php");

$x = 5;
echo "Factorial of {$x} is " . factorial($x);

```