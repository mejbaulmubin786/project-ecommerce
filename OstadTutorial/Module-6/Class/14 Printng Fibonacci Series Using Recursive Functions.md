```php
<?php
function fibonacci($old, $new, $start, $end)
{
  if ($start > $end) {
    return;
  }
  $start++;
  echo $old . " ";
  $_temp = $old + $new;
  $old = $new;
  $new = $_temp;

  fibonacci($old,  $new, $start, $end);
}



fibonacci(0, 1, 1, 10);

```

```php
<?php
function fibonacci($old, $new, $end)
{
  static $start;
  $start = $start ?? 1; //The null coalescing operator (also known as the double question mark ?? operator) in PHP provides a concise way to handle situations where you want to assign a default value to a variable if it’s either null or undefined.
  /*
Basic Usage:
Suppose you have a variable $name that you want to assign a value to based on whether $_POST['name'] exists or not. Traditionally, you might use the ternary operator with isset() like this:
*/

  if ($start > $end) {
    return;
  }
  $start++;

  echo $old . " ";
  $_temp = $old + $new;
  $old = $new;
  $new = $_temp;

  fibonacci($old,  $new, $end);
}
fibonacci(0, 1, 10);
```