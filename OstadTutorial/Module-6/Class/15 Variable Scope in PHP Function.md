```php
<?php
$name = "Earth";

function doSomethig()
{
  global $name; //Using global is badpractice
  echo $name;
  //echo $GLOBALS['name'];
}

doSomethig();
```

```php
<?php
$name = "Earth";

function doSomethig()
{
  //global $name;
  //echo $name;
  echo $GLOBALS['name'];
}

doSomethig();
```

```php
<?php
function doSomethig()
{
  $name = "Earth"; //Local variable
  echo $name;
}

doSomethig();
echo $name; //is not possible because $name is local
```

```php
<?php
function doSomethig()
{
  global $name;
  $name = "Earth"; //Local variable
  echo $name;
}

doSomethig();
echo $name; //is possible because $name is global
```

```php
<?php
function doSomething()
{
  static $i; //static scope
  $i = $i ?? 0;
  $i++;
  echo $i;
  echo "\n";
}

doSomething(); 
doSomething();
echo $i; // is not possible because $i is not global 
```


In PHP, variable scope refers to the context in which a variable is defined and accessed. Understanding variable scope is crucial for managing variables effectively in different parts of your code. Here’s a breakdown of the different types of variable scope in PHP:

### 1. **Global Scope**

Variables declared outside of functions are in the global scope. These variables can be accessed from anywhere outside functions, but not directly inside functions. To access a global variable inside a function, you need to use the `global` keyword.

```php
$globalVar = "I am a global variable";

function myFunction() {
    global $globalVar;
    echo $globalVar; // Accessing global variable
}

myFunction(); // Outputs: I am a global variable
```

### 2. **Local Scope**

Variables declared inside a function or method are in the local scope of that function. They are only accessible within that function.

```php
function myFunction() {
    $localVar = "I am a local variable";
    echo $localVar; // Accessing local variable
}

myFunction(); // Outputs: I am a local variable
echo $localVar; // Error: Undefined variable
```

### 3. **Static Scope**

Static variables retain their value between function calls. They are declared with the `static` keyword and are only visible within the function in which they are declared.

```php
function myStaticFunction() {
    static $count = 0;
    $count++;
    echo $count;
}

myStaticFunction(); // Outputs: 1
myStaticFunction(); // Outputs: 2
```

### 4. **Function Parameter Scope**

Parameters passed to functions are in the local scope of that function. They are only accessible within that function.

```php
function myFunction($param) {
    echo $param; // Accessing function parameter
}

myFunction("Hello, World!"); // Outputs: Hello, World!
```

### 5. **Superglobals**

Superglobal variables are built-in global arrays that are accessible from any part of the script, including functions. Examples include `$_GET`, `$_POST`, `$_SESSION`, `$_COOKIE`, `$_FILES`, `$_SERVER`, `$_ENV`, and `$_GLOBALS`.

```php
$_SESSION['user'] = "JohnDoe";

function checkSession() {
    echo $_SESSION['user']; // Accessing superglobal variable
}

checkSession(); // Outputs: JohnDoe
```

### 6. **Global Keyword**

The `global` keyword is used to access global variables within functions. Without using this keyword, you can’t directly modify global variables from within a function.

```php
$globalVar = "Hello";

function modifyGlobal() {
    global $globalVar;
    $globalVar = "Goodbye";
}

modifyGlobal();
echo $globalVar; // Outputs: Goodbye
```

### 7. **$GLOBALS Array**

The `$GLOBALS` array is another way to access global variables from within functions. It is a superglobal array that contains all global variables.

```php
$globalVar = "Hello";

function modifyGlobal() {
    $GLOBALS['globalVar'] = "Goodbye";
}

modifyGlobal();
echo $globalVar; // Outputs: Goodbye
```

### Example Summary

Here’s a summary of how different variable scopes work in a single script:

```php
$globalVar = "Global variable";

function testScope() {
    global $globalVar; // Accessing global variable
    $localVar = "Local variable";
    static $staticVar = 0;
    
    $staticVar++;
    echo $globalVar . "<br>"; // Outputs: Global variable
    echo $localVar . "<br>";  // Outputs: Local variable
    echo $staticVar . "<br>"; // Outputs: 1 (on first call), 2 (on second call)
}

testScope();
testScope(); // Static variable retains its value
```

Understanding and correctly managing variable scope is essential for avoiding bugs and ensuring your code behaves as expected.
