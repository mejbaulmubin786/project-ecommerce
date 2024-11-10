```php
<?php
function printN($i)
{
  if ($i >= 10) {
    return;
  }
  echo $i . "\n";
  $i++;
  printN($i);
}

printN(1);
```

```php
<?php

function printNumber($counter, $end)
{
  if ($counter >= $end) {
    return;
  }
  echo $counter . "\n";
  $counter++;
  printNumber($counter, $end);
}

printNumber(20, 25);
```

```php
<?php
function printNumber($counter, $end, $stepping = 1)
{
  if ($counter >= $end) {
    return;
  }
  echo $counter . "\n";
  $counter += $stepping;
  printNumber($counter, $end, $stepping);
}

printNumber(20, 25, 2);
```
