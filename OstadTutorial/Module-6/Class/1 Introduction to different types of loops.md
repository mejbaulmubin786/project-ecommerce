```php
<?php
for ($x = 0; $x <= 10; $x++) {
  echo "The number is: $x";
  echo PHP_EOL;
}

echo PHP_EOL;
echo "------------------------for Loop------------------";

$i = 1;
while ($i < 6) {
  echo $i . PHP_EOL;
  $i++;
}
echo PHP_EOL;
echo "------------------------While Loop------------------";

$i = 0;
do {
  $i++;
  echo $i . PHP_EOL;
} while ($i < 10);
echo PHP_EOL;
echo "------------------------do While Loop------------------";
```