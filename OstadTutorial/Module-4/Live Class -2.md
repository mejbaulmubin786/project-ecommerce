# Sprintf | If Else | Nested If Else | Ternary Operators | Nested Ternary Operators | Switch Case | VSCode Power Tips | VSCode Settings & Extensions for PHP Laravel Web Development

Vs code Extensions:
1. install PHP DEVSENSE Extension(from Ben DEVSENSE | devsense.com ) in vs code. 

```php
<?php
$firstName = "Mejbaul ";
$lastName = "Mubin";
$title = "Mr.";
$age = 35;
printf("His Name is %s %s %s and his age is %d", $title, $firstName, $lastName, $age);
$output = sprintf("His Name is %s %s %s and his age is %d", $title, $firstName, $lastName, $age);
echo $output;
```

```php
<?php
$number = 35;

$evenOrOdd = $number % 2 == 0 ? "Even" : "Odd";

printf("This number %d is %s", $number, $evenOrOdd);
```


