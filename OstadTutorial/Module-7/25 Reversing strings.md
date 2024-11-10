```php
<?php
$string = "Mejbaul Mubin";
$length = strlen($string) - 1;
echo "\n";
for ($i = $length; $i >= 0; $i--) {
    echo $string[$i];
}
echo "\n";
```