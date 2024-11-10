```php
<?php

for ($i = 0; $i < 100; $i += 7) {
  echo $i . "\n";
}


for ($i = 0; $i < 100; $i++) {
  if ($i % 7 == 0) echo $i . "\n";
  if ($i % 11 == 0) echo $i . "\n";
}

for ($i = 0; $i < 100; $i++) {
  echo $i % 7 == 0 ? $i . "\n" : '';
  echo $i % 11 == 0 ? $i . "\n" : '';
}

for ($i = 0, $j = 0; $i < 100; $i += 7, $j += 11) { //Result is wrong
  echo $i . "\n";
  echo $j . "\n";
}


for ($i = 0, $j = 0; $i < 100; $i += 7, $j += 11) {
  echo $i . "\n";
  echo $j < 100 ? ($j . "\n") : '';
}
```
