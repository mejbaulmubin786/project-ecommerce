আমরা যখন code runner ব্যাবহার করি তখন প্রতিবার কোর্ড রান করলে সেই ডাটা গুলো এটি সেইভ রাখে যা বিরক্তি কর । এগুলোকে ক্লিন করতে আমরা নিচের আইকনে বার বার ক্লিক করা লাগে । 
![[WebDevelopment/Ostad/PHP/Ostad/Module-4/clear.png]]
আমরা যদি চাই এই কাজটি অটোমেটিক হোক তবো আমরা যা করতে পারি setting->(search) code runner -> clear previous output এ ক্লিক করে দিতে হবে। তাছাড়া আমরা চাইলে এর একটু নিচে নেমে save file before run অপশনটিও ক্লিক করে দিতে পারি।
![[WebDevelopment/Ostad/PHP/Ostad/Module-4/clear2.png]]
## PHP Variables
In PHP, a variable starts with the $ sign, followed by the name of the variable:
```php
$x = 5;
$y = "John"
```
### Rules for PHP variables:

- A variable starts with the $ sign, followed by the name of the variable
- A variable name must start with a letter or the underscore character
- A variable name cannot start with a number
- A variable name can only contain alpha-numeric characters and underscores (A-z, 0-9, and _ )
- ==Variable names are case-sensitive ($age and $AGE are two different variables)==
There are two commonly used styles when naming a variable in PHP. Camel case or snake case. 

### PHP Tags
A PHP script starts with <?php and ends with ?>:
```php
<?php
// PHP code goes here
?>
```
==PHP statements end with a semicolon (;)==

```PHP
<?php
$number = 34;
$age = "number";
$question = "How are you?";
$name = "Mejbaul Mubin";
echo $age; //output number
echo "\n"; // Make a new line it is always in double quotation "". Here 'single Quotation'' is wrong
echo $$age; //output 34
echo "\n"; 
echo "My name is Mejbaul Mubin and I am ".$$age; //output My name is Mejbaul Mubin and I am 34
echo "\n";
echo "My name is $name and I am $number";//output My name is Mejbaul Mubin and I am 34
echo 'My name is $name and I am $number'; //My name is $name and I am $number
echo "\n";
echo "My name is {$name} and I am {$number}"; //Good practice for writing variable
echo "\n";
echo "Hi {$name}, {$question}"; // Hi Mejbaul Mubin, How are you?
echo "\n";
echo "Hi ".$name.$question;// We can write in this way instade of echo "Hi {$name}, {$question}"; but it is Awkward Output: Hi Mejbaul MubinHow are you?
echo "\n";
echo "Hi ".$name." ".$question;// Hi Mejbaul Mubin How are you? (Make space)
```

