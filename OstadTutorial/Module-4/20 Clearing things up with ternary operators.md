```php
<?php
$n = 13;
$result = ($n % 2 == 0) ? "A" : (($n == 11) ? "B" : "C");
echo $result . "\n";
$province = 6;
$Myprovince = (($province == 6) ? "city-1" : (($province == 7) ? "city-2" : (($province == 8) ? "city-3" : (($province == 30) ? "city-4" : "out of borders"))));

echo $Myprovince . "\n";
```
// এখনো বাকি
