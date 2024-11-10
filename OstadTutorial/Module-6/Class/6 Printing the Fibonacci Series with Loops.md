```php
for ($i = 0, $j = 1; $i < 1000;) {
  echo $i . "\n";
  echo $j . "\n";
  $i = $i + $j;
  $j = $i + $j;
}
```