#### What is array?
An array in PHP is a special variable that can hold multiple values under a single name. You can access these values by referring to an index number or a named key.
How to create
```php
$array1 = array("apple", "banana", "cherry");
$array2 = ["apple", "banana", "cherry"];
//Accessing Values
echo $array1[0];
echo $array2[0];
//For Loop Through an Indexed Array
for ($i = 0; $i < count($array1); $i++) {
    echo $array1[$i] . "<br>";
}
//ForEach Loop Through an Indexed Array
foreach ($array1 as $value) {
    echo $value . "<br>";
}
```
**Associative arrays**
 Associative arrays in PHP are arrays that use named keys instead of numeric indexes.
 This - makes them more expressive and useful when dealing with key-value pairs.
 Associative arrays can be defined using the array() function or the short array syntax [].
```php
$person1 = array("first_name" => "John", "last_name" => "Doe");
$person2 = ["first_name" => "Jane", "last_name" => "Smith"];
// Accessing Values
echo $person1["first_name"];
//Looping Through an Associative Array
foreach ($person1 as $key => $value) {
    echo "$key : $value<br>";
}
```
**Multidimensional arrays**
 Multidimensional arrays are arrays that contain other arrays as their elements. The contained
 arrays can be indexed or associative
```php
//Declaring a Multidimensional Array
$array = array(
    array(1, 2, 3),
    array(4, 5, 6),
    array(7, 8, 9),
);
//Accessing Elements
echo $array[1][2];
//Associative Multidimensional Array
$users = array(
    "john" => array(
        "age" => 25,
        "email" => "john@example.com",
    ),
    "jane" => array(
        "age" => 30,
        "email" => "jane@example.com",
    ),
);
echo $users["john"]["email"];
//Looping Through Multidimensional Arrays
foreach ($users as $username => $details) {
    echo "Username: $username\n";
    foreach ($details as $key => $value) {
        echo "$key: $value\n";
    }
}
```
array() - Creates an array.
```php
 $fruits = array("apple", "banana", "cherry");
```
array_values() - Returns all the values from the array.
```php
$assoc = array("a" => "apple", "b" => "banana", "c" => "cherry");
$values = array_values($assoc);
```
array_keys() - Returns all the keys from the array.
```php
$assoc = array("a" => "apple", "b" => "banana", "c" => "cherry");
$keys = array_keys($assoc);
```
array_combine() - Combines two arrays: one for keys and the other for values.
```php
$keys = array("a", "b", "c");
$values = array("apple", "banana", "cherry");
$combined = array_combine($keys, $values);
```
array_fill() - Fills an array with values.
```php
 $filled = array_fill(0, 3, "apple");
```
array_push() - Adds one or more elements to the end of an array.
```php
 $fruits = array("apple", "banana", "cherry");
 array_push($fruits, "date", "elderberry");
```
 array_pop( ) - Removes the last element from an array.
```php
$fruits = array("apple", "banana", "cherry");
$lastFruit = array_pop($fruits);
```
array_unshift() - Adds one or more elements to the beginning of an array.
```php
$fruits = array("apple", "banana", "cherry");
array_unshift($fruits, "apricot");
```
 array_shift() - Removes the first element from an array.
```php
$fruits = array("apple", "banana", "cherry");
$firstFruit = array_shift($fruits);
```
 array_splice() - Removes a portion of the array and replaces it with something else.
```php
$fruits = array("apple", "banana", "cherry");
 array_splice($fruits, 1, 2, array("fig", "grape"));
```
 array_slice() - Extracts a portion of the array
```php
 array_slice() - Extracts a portion of the array
```
-----------------------------------------------
count() - Counts the number of elements in an array.
```php
 $numbers = array(1, 2, 3, 4, 5);
 echo count($numbers)
```
 sizeof() - An alias of count() . Also counts the number of elements in an array.
```php
$numbers = array(1, 2, 3, 4, 5);
echo sizeof($numbers);
```
 array_sum()- Computes the sum of values in an array.
```php
$numbers = array(1, 2, 3, 4, 5);
 echo array_sum($numbers);
```
  array_product() - Computes the product of values in an array.
```php
$numbers = array(1, 2, 3, 4, 5);
echo array_product($numbers);
```
  in_array() - Checks if a value exists in an array.
```php
$numbers = array(1, 2, 3, 4, 5);
 if(in_array(3, $numbers)) {
 echo "3 is in the array.";  // This will be printed
 }
 if(is_array($numbers)) {
 echo "This is an array.";
 }
```
  array_key_exists() - Checks if a key exists in an array.
```php
$assoc = array("first" => "apple", "second" => "banana");
 if(array_key_exists("first", $assoc)) {
 echo "Key 'first' exists in the array.";
 }
```
 array_search() - Searches the array for a given value and returns the first corresponding key.
```php
$assoc = array("first" => "apple", "second" => "banana");
$key = array_search("banana", $assoc);
echo $key;
```
-----------------------------------------
array_map() - Applies a callback function to the elements of one or more arrays.
```php
 function square($n) {
 return $n * $n;
 }
 $numbers = array(1, 2, 3, 4);
 $squaredNumbers = array_map('square', $numbers);
 print_r($squaredNumbers);
 ```
 array_filter() - Filters elements of an array using a callback function.
```php
 function is_even($n) {
 return $n % 2 == 0;
 }
 $numbers = array(1, 2, 3, 4);
 $evenNumbers = array_filter($numbers, 'is_even');
 print_r($evenNumbers);
```
 array_merge() - Merges one or more arrays.
 ```php
 $arr1 = array("apple", "banana");
 $arr2 = array("cherry", "date");
 $merged = array_merge($arr1, $arr2);
 print_r($merged);
 ```
 array_replace() - Replaces values from one array to another.
 ```php
 $base = array("apple", "banana", "cherry");
 $replacements = array(0 => "apricot", 2 => "date");
 $replaced = array_replace($base, $replacements);
 print_r($replaced);
 ```
 array_flip() - Exchanges all keys with their associated values in an array.
 ```php
 $input = array("a" => 1, "b" => 2, "c" => 3);
 $flipped = array_flip($input);
 print_r($flipped);
 ```
 array_change_key_case() - Changes the case of all keys in an array.
 ```php
 $input = array("First" => 1, "SecONd" => 4);
 $result = array_change_key_case($input, CASE_UPPER);
print_r($result);
```
 array_column() - Returns the values from a single column of the input array.
 ```php
 $records = array(
 array('id' => 2135, 'first_name' => 'John', 'last_name' => 'Doe'),
 array('id' => 3245, 'first_name' => 'Sally', 'last_name' => 'Smith'),
 array('id' => 5342, 'first_name' => 'Jane', 'last_name' => 'Jones')
 );
 $firstNames = array_column($records, 'first_name');
 print_r($firstNames)
 ```
 -------------------------------------------------
 sort() - Sorts an array in ascending order.
 ```php
 $numbers = array(3, 1, 4, 1, 5);
 sort($numbers);
 ```
 rsort() - Sorts an array in descending order.
 ```php
 $numbers = array(3, 1, 4, 1, 5);
 rsort($numbers);
 ```
 asort() - Sorts an array and maintains index association.
 ```php
 $fruit = array("key1" => "lemon", "key2" => "orange", "key3" => "banana");
 asort($fruit);
 print_r($fruit);
 ```
 
 arsort() - Sorts an array in reverse order and maintains index association.
```php
 $fruit = array("key1" => "lemon", "key2" => "orange", "key3" => "banana");
 arsort($fruit);
 print_r($fruit);
```
 ksort() - Sorts an array by key.
 ```php
 $fruit = array("d" => "lemon", "a" => "orange", "b" => "banana");
 ksort($fruit);
 print_r($fruit);
  ```
 krsort() - Sorts an array by key in reverse order.
 ```php
 $fruit = array("d" => "lemon", "a" => "orange", "b" => "banana");
 krsort($fruit);
 print_r($fruit);
  ```
 natsort() - Sorts an array using natural order algorithm.
 ```php
 $files = array("img1.png", "img10.png", "img12.png", "img2.png");
 natsort($files);
 print_r($files);
  ```
 natcasesort() - Sorts an array using a case-insensitive natural order algorithm.
 ```php
$files = array("Img1.png", "img10.png", "img12.png", "IMG2.png");
 natcasesort($files);
 print_r($files);
  ```
 uasort() - Sorts an array with a user-defined comparison function and maintains index association.
 ```php
 $people = array( "Peter" => 35, "Jack" => 32,  "Mary" => 28);
 function ageComparator($a, $b) {
 return $a - $b;
 }
 uasort($people , 'ageComparator');
 print_r($people);
  ```
 uksort() - Sorts an array by keys using a user-defined comparison function.
 ```php
 $people = array( "Peter" => 35, "Jack" => 32,  "Mary" => 28);
 function ageComparator($a, $b) {
 return $a <=> $b;
 }
 uksort($people , 'ageComparator');
 print_r($people);
  ```
  -----------------------------------------------
array_walk() - Applies a user-defined function to each item in an array.
 ```php
 $fruits = array("apple", "banana", "cherry");
 function test_alter(&$item, $key, $prefix) {
 $item = "$prefix: $item";
 }
 array_walk($fruits, 'test_alter', 'fruit');
 print_r($fruits);
 ```
 array_walk_recursive() - Applies a user-defined function recursively to each item in an array.
  ```php
 $sweet = array('a' => 'apple', 'b' => array('p' => 'pear', 'c' => 'cherry'));
 function test_print($item, $key) {
 echo "$key holds $item\n";
 }
 array_walk_recursive($sweet, 'test_print');
 ```
 array_reduce() - Iteratively reduces the array to a single value using a callback function.
 ```php
 $numbers = array(1, 2, 3, 4, 5);
 function sum($carry, $item) {
 $carry += $item;
 return $carry;
 }
 $result = array_reduce($numbers, 'sum');
 echo $result;  // Outputs: 15
 ```
 ----------------------------------------------------------
 array_multisort() This function can be used to sort multiple arrays at once or a multi
dimensional array by one or more dimensions.
```php
 $names = ["Tina", "Bob", "Alice"];
 $ages  = [28, 22, 25];
 array_multisort($names, $ages);
 print_r($names);
 print_r($ages);
 ```
 array_column() This function returns the values from a single column in the input array.
 ```php
 $users = [
 ['id' => 1, 'name' => 'Alice', 'email' => 'alice@example.com'],
 ['id' => 2, 'name' => 'Bob', 'email' => 'bob@example.com'],
 ['id' => 3, 'name' => 'Tina', 'email' => 'tina@example.com'],
 ];
 $names = array_column($users, 'name');
 print_r($names);
 ```
 array_map() This function applies a callback to the elements of the given arrays and returns an
 array containing all the elements after applying the callback function.
 ```php
 $numbers = [1, 2, 3, 4, 5];
 $squaredNumbers = array_map(function($n) {
 return $n * $n;
 }, $numbers);
 print_r($squaredNumbers);
 ```
 ------------------------------------------
 array_diff()
 Computes the difference of arrays. It compares the values of the first array with the values of
 following arrays and returns the differences.
```php
 $array1 = ["a", "b", "c", "d"];
 $array2 = ["b", "c"];
 $result = array_diff($array1, $array2);
 print_r($result);
 array_diff_assoc()
```
 Computes the difference of arrays with additional index check.
  ```php
 $array1 = ["a" => "green", "b" => "brown", "c" => "blue", "red"];
 $array2 = ["a" => "green"];
 $result = array_diff_assoc($array1, $array2);
 print_r($result);
  ```
 array_diff_key() Computes the difference of arrays using keys for comparison.
  ```php
 $array1 = ["blue" => 1, "red" => 2, "green" => 3];
 $array2 = ["green" => 4, "yellow" => 7];
 $result = array_diff_key($array1, $array2);
 print_r($result);
  ```
 array_intersect() Computes the intersection of arrays.
  ```php
 $array1 = ["a", "b", "c", "d"];
 $array2 = ["b", "c", "e"];
 $result = array_intersect($array1, $array2);
 print_r($result);
  ```
 array_intersect_assoc()  Computes the intersection of arrays with additional index check.
  ```php
 $array1 = ["a" => "green", "b" => "brown", "c" => "blue"];
 $array2 = ["a" => "green", "b" => "yellow", "c" => "blue"];
 $result = array_intersect_assoc($array1, $array2);
 print_r($result);
  ```
`array_intersect_key()
 ```php
 Computes the intersection of arrays using keys for comparison.
 $array1 = ["blue" => 1, "red" => 2, "green" => 3];
 $array2 = ["green" => 4, "yellow" => 7];
 $result = array_intersect_key($array1, $array2);
 print_r($result);
  ```
  ---------------------------------------------------
array_unique()
 Removes duplicate values from an array.
 ```php
 $input = ["a", "b", "a", "c", "d", "b"];
 $result = array_unique($input);
 print_r($result);
 ```
 array_reverse() Returns an array with elements in reverse order.
 ```php
 $input = [1, 2, 3, 4, 5];
 $result = array_reverse($input);
 print_r($result);
 ```
 array_rand() Picks one or more random entries out of an array.
 ```php
 $input = ["apple", "banana", "cherry", "date", "fig"];
 $randomKey = array_rand($input);
 echo $input[$randomKey];
 $randomKeys = array_rand($input, 2);
 print_r($randomKeys);
 ```
 shuffle() Shuffles (randomizes the order of) the elements in an array.
 ```php
 $numbers = [1, 2, 3, 4, 5];
 shuffle($numbers);
 print_r($numbers)
 ```
 range() Creates an array containing a range of elements.
 ```php
 // Create an array of numbers from 1 to 5
 $numbers = range(1, 5);
 print_r($numbers);
 // Create an array of letters from 'a' to 'e'
 $letters = range('a', 'e');
 print_r($letters);
// Using a step value
 $evenNumbers = range(0, 10, 2);
 print_r($evenNumbers);
 ```
 