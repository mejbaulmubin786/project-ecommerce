Remove Duplicate Characters

Problem Statement
Write a program that removes duplicate characters from a given string, keeping only the first occurrence of each character.

Input
The input consists of a string.

Output
The output will be a string without any duplicate character.

Constraints
0 ≤ |S| ≤ 1000
Example:
Enter string

Input:
apples
Output:
aples


একইরকম অক্ষর সরাও
EN

সমস্যার বিবরণ
এমন একটি প্রোগ্রাম লিখ যা একটি স্ট্রিং থেকে একইরকম অক্ষরগুলো সরিয়ে ফেলবে, শুধুমাত্র প্রথমবারের উপস্থিতিটি থাকবে প্রতিটি অক্ষরের।

ইনপুট
ইনপুট হবে একটি string

আউটপুট
আউটপুট হবে একটি স্ট্রিং যাতে একইরকমের কোন অক্ষর থাকবে না।

সীমাবদ্ধতা
0 ≤ |S| ≤ 1000
উদাহরণ:
Enter string

ইনপুট:
apples
আউটপুট:
aples

```php
<?php
function removeDuplicateCharacters($input) {
    $result = '';
    $seen = array();
    
    for ($i = 0; $i < strlen($input); $i++) {
        $char = $input[$i];
        if (!in_array($char, $seen)) {
            $result .= $char;
            $seen[] = $char;
        }
    }
    
    return $result;
}

// Get input from user
$input = trim(fgets(STDIN));
$output = removeDuplicateCharacters($input);
echo $output . "\n";
?>
```

Write a php program: 
Check Anagram
Problem Statement
You are given two strings A and B. Your task is check whether the string B is anagram of string A or not. An anagram of a string is another string that contains the same characters, only the order of characters can be different. For example, “abcd” and “dabc” are an anagram of each other whereas "abcd" and "aabc" are not.
Input
The input consists of two strings A and B in two lines containing only lowercase English letters.
Output
In output print "YES" if string B is anagram of string A or "NO" otherwise. Print without quotation mark.
Constraints
1 ≤ ∣A∣,∣B| ≤ 10000
strings contains only lowercase (a−z) English letters.
Example 1:
Input:
abcd
dbac
Output:
YES
Example 2:
Input:
abcd
aabc
Output:
NO


```php
<?php
function areAnagrams($a, $b) {
   
    if (strlen($a) !== strlen($b)) {
        return "NO";
    }
    
    
    $countA = array_fill(0, 26, 0);
    $countB = array_fill(0, 26, 0);
    
    
    for ($i = 0; $i < strlen($a); $i++) {
        $countA[ord($a[$i]) - ord('a')]++;
        $countB[ord($b[$i]) - ord('a')]++;
    }
    
   
    for ($i = 0; $i < 26; $i++) {
        if ($countA[$i] !== $countB[$i]) {
            return "NO";
        }
    }
    
    return "YES";
}


$handle = fopen ("php://stdin","r");
$a = trim(fgets($handle));
$b = trim(fgets($handle));
fclose($handle);

$output = areAnagrams($a, $b);
echo $output . "\n";
?>
```

```php
<?php
function areAnagrams($a, $b) {
   
    if (strlen($a) !== strlen($b)) {
        return "NO";
    }
    
    
    $countA = array_fill(0, 26, 0);
    $countB = array_fill(0, 26, 0);
    
    
    for ($i = 0; $i < strlen($a); $i++) {
        $countA[ord($a[$i]) - ord('a')]++;
        $countB[ord($b[$i]) - ord('a')]++;
    }
    
   
    for ($i = 0; $i < 26; $i++) {
        if ($countA[$i] !== $countB[$i]) {
            return "NO";
        }
    }
    
    return "YES";
}


$handle = fopen ("php://stdin","r");
$a = trim(fgets($handle));
$b = trim(fgets($handle));
fclose($handle);

$output = areAnagrams($a, $b);
echo $output . "\n";
?>
```







