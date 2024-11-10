```php
<?php
//various string operations

$str1 = "Hello";
$str2 = "World";

$str3 = $str1 . " " . $str2;
$str3 = "{$str1} {$str2}";
// echo $str3;

$date = "16th July";
$expense = "516 Taka";

// $result = "On " . $date . " Total Expense = " . $expense;

$result = "On {$date} Total expense = {$expense}";

echo $result;
```

```php
<?php
$string = "Hello World";

$reverse = strrev($string);

echo $reverse;

// // echo strlen($string);
// $reverse = '';
// for ($i = strlen($string) - 1; $i >= 0; $i--) {
//     $reverse = $reverse . $string[$i];
// }

// echo $reverse;
```

```php
<?php 
$string = "***-";

$final = str_repeat($string, 10);
// $final = "";
// for($i=0;$i<10;$i++){
//     // $final = $final . $string;
//     $final .= $string; //final = final + string
// }

echo $final;
```

```php
<?php 
$string = "Hello from Ostad";

$shuffle = str_shuffle($string);

echo $shuffle;
```

```php
<?php 
$string = "Hello World";
$string2 = "hello from ostad"; //Hello From Ostad

//lowercase
$lower = strtolower($string);
// echo $lower;

//uppercase
$upper = strtoupper($string);
// echo $upper;

//ucwords
$ucwords = ucwords($string2);
echo $ucwords;
// echo $ucfirst;
```

```php
<?php 
$article = "HellO world, thiS Is a Sample Article. Did You Notice the mixEd caSe";
$article = strtolower($article);
$string1 = "hello world. how are you";

$parts = explode(".",$article);
$fixed = "";
for($i=0;$i<count($parts);$i++){
    $parts[$i] = ucfirst(trim($parts[$i]));
}

$fixed = join(". ", $parts);
echo $fixed;
```



