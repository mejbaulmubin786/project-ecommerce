#### **Different types of loops, Multiple Stepping in For Loops | Continue and break between loops, Printing the Fibonacci Series with Loops | Why & How Functions in PHP, Writing-Calling | Function parameter, Type hinting-checking | Understanding Function Return Type**
# Function
#Function
##### Built in Function in PHP 
Built-in functions are pre-defined functions that you can use without explicitly declaring or defining them. These functions cover a wide range of tasks, from basic string manipulation and mathematical calculations to more advanced operations like database connectivity and file handling. 
```php
<?php
echo "Mejbaul Mubin";
print_r("Mejbaul Mubin");
var_dump("Mejbaul Mubin");
$m = strlen("Mejbaul Mubin");
echo $m;
```
##### User defined Function in PHP 
 User-defined Functions: These are functions created by the programmer. They're defined using the
 function keyword.
```PHP
 <?PHP
function sum()
{
  $num1 = 20;
  $num2 = 30;
  echo $num1 + $num2;
}
sum();

//Function With Params

function sum($num1, $num2)
{
  echo $num1 + $num2;
}
sum(1, 2);
```
**Function With Params Default Value**
One without a default value must be declared before the one with a default value.
```php
 function sum($num1, $num2=10) {
 echo $num1+$num2;
}
 sum(2);
```
 **Type Hinting**
 Primitive types: like int, float, bool, string.
 Classes and interfaces: Any class or interface name.
 Arrays: with the array keyword.
 Callable: for functions or objects that implement the invoke method.
 Nullable types: by prefixing with a ?.
 Iterables: with the iterable keyword, which includes both arrays and objects implementing the
 Traversable interface.
 Union types: introduced in PHP 8, where a parameter can accept multiple types
 ```php
function sum(int $num1, int $num2)
{
  echo $num1 + $num2;
}
sum(20, 20);
// Multiple type hinting in one parameter
 function sum(int|string $num1,int|string $num2) {
 echo $num1+$num2;
 }
 sum("33","20");
 // Nullable type hints
 function myName(?string $text): void
{
  if ($text) {
    echo "Text is: $text<br>";
  } else {
    echo "No text provided.<br>";
  }
}
myName("Jack");
myName(null);
```
 **Variadic Functions**
 Functions that accept an indefinite number of arguments.
 They use the ( ...) spread operator
 ```php
 function sum(...$numbers) {
 echo array_sum($numbers);
 }
 sum(1,2,3,4,5);
 function sum(...$numbers) {
 echo $numbers[0];
 }
 sum(1,2,"3",4,5);
```
**Anonymous Functions (or Closures)**
 These are functions without a name. They can be stored in variables or passed as arguments to other functions.
 **Creation & Execution Directly**
 ```php
  (function () {
 echo "Hello from the anonymous function!";
 })();
```
 Assign to a Variable and Execute
 ```php
  $greet = function($name) {
 echo "Hello, " . $name . "!";
 };
 $greet("OSTAD");
```
 Arrow functions provide a more concise syntax for writing anonymous functions. are designed for
 simple, single-expression use-cases.
 ```php
  $sum = fn($num1,$num2) =>$num1 * $num2;
 echo $sum(5,5);
```
 Recursive Functions
 Functions that call themselves to solve a problem.
 ```php
  function factorial($n) {
 if ($n == 0) {
 return 1;
 } else {
 return $n * factorial($n-1);
 }
 }
 echo factorial(5);
```
**Callback Function**
 Function that is passed as an argument to another function and is executed after the completion of
 that function. This pattern is quite common in programming, especially in scenarios like event handling,
 asynchronous operations, or functions that require custom logic.
 ```php
  function sum($a, $b) {
 echo $a + $b;
 }
 function calculate($num1, $num2, $callback) {
 return $callback($num1, $num2);
 }
 $result = calculate(5, 3, 'sum');
```
 Basic Return Types
 ```php
 function getAge(): int {
 return 25;  
}
 function isAdult(int $age): bool {
 return $age >= 18;  
}
 echo getAge();
 echo isAdult(11)
```
 **Nullable Return Type**
 ```php
 function findUsername(int $id): ?string
{
  if ($id === 1) {
    return "JohnDoe";
  }
  return null;  // It's valid because of the ? before string
}
echo findUsername(2);
```
**Return Type of void**
```php
<?php
function logMessage(string $message): void
{
  echo $message;
}
logMessage("Hello");
```
**Union Return Types**
```php
<?php
function sum($num1, $num2): int|string
{
  return $num1 + $num2;
}
echo sum("33", "20");
```
 **Strict mode in PHP
 - Affects how type hints are enforced.
 - By default, PHP will try to coerce values of the wrong type to match the expected type.
 - In strict mode, PHP will throw a Type Error if the provided value does not exactly match the
 expected type.
 ```php
 <?php

declare(strict_types=1);
function add(int $a, int $b): int
{
  return $a + $b;
}
echo add("5", "10");
```
# Loop
## For Loop
Used when you know in advance how many times you want to execute a statement or a block of
statements.
```php
for($x = 0; $x <= 5; $x++) {
   echo "The number is: $x <br>";
}
```
## Break
 It is used to exit a loop prematurely. Once break is encountered, the loop terminates and the program resumes execution after the loop.
```php
 <?php

for ($i = 0; $i < 10; $i++) {
  if ($i == 3) {
    break;
  }
  echo $i . "<br>";
}
```
## Continue 
The continue statement is used to skip the rest of the current loop iteration and proceed to the
evaluation of the loop condition for the next iteration.
``` php
<?php

for ($i = 0; $i < 10; $i++) {
  if ($i == 3) {
    continue;
  }
  echo $i . "<br>";
}
```
## Foreach Loop
Used for looping through arrays. For each loop iteration, the value of the current array element is
assigned to the value variable and the array pointer is moved by one, until it reaches the last array
element.
```php
 <?php

$colors = array("red", "green", "blue", "yellow");
foreach ($colors as $value) {
  echo "$value <br>";
}

$age = array("Peter" => "35", "Ben" => "37", "Joe" => "43");
foreach ($age as $key => $value) {
  echo "$key is $value years old. <br>";
}
```
## While Loop
It executes a block of code as long as the specified condition is true.
```php
$x = 1;
 while($x <= 5) {
 echo "The number is: $x <br>";
 $x++;
 }
```
## Do...While Loop
Similar to the while loop, but the condition is tested after the execution of the loop's statements.
```php
$x = 1;
do {
  echo "The number is: $x <br>";
  $x++;
} while ($x <= 5);
```

