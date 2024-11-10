$Substring Occurrences Counting

Problem Statement
Write a program to create a function that finds and counts all occurrences of a substring within a larger string. For instance, in the string "abababab," the substring "ab" appears four times.

Input
The input consists of two strings 
𝑆
S and 
𝑇
T.

Output
The output will print the number of occurrences of a substring which will be an integer.

Constraints
0 ≤ |S| ≤ 10000
0 ≤ |T| ≤ 10000
Example:
Enter strings

Input:
abababab ab
Output:
4


সাবস্ট্রিং গণনা
EN

সমস্যার বিবরণ
এমন একটি প্রোগ্রাম লিখ যা এমন একটি ফাংশন তৈরি করবে যা একটি বড় স্ট্রি এর মধ্যে একটি সাবস্ট্রিং কতবার আছে তা গণনা করবে। যেমন abababab এই স্ট্রিং টির মধ্যে ab সাবস্ট্রিং টি 4 বার আছে।

ইনপুট
ইনপুটে দুইটি string থাকবে যারা হল যথাক্রমে 
𝑆
S এবং 
𝑇
T।

আউটপুট
আউটপুটে একটি সাবস্ট্রিং কতবার আছে তা প্রিন্ট হবে। সংখ্যাটি হবে একটি integer

সীমাবদ্ধতা
0 ≤ |S| ≤ 10000
0 ≤ |T| ≤ 10000
উদাহরণ:
Enter strings

ইনপুট:
abababab ab
আউটপুট:
4

```php
<?php
function countOccurrences($S, $T) {
    // If the substring T is empty, return 0 to avoid issues with strpos
    if ($T === '') {
        return 0;
    }
    
    // Initialize count and starting position
    $count = 0;
    $pos = 0;

    // Use strpos in a loop to find all occurrences of T in S, including overlapping ones
    while (($pos = strpos($S, $T, $pos)) !== false) {
        $count++;
        $pos++; // Move to the next position to allow for overlapping substrings
    }

    return $count;
}

// Read input strings from the user
$input = trim(fgets(STDIN));
list($S, $T) = explode(' ', $input);

// Count occurrences
$result = countOccurrences($S, $T);

// Print the result
echo $result . "\n";
?>
```

String Rotation

Problem Statement
Write a program to create a function that checks if one string is a rotation of another. For example, "waterbottle" is a rotation of "erbottlewat" because you can rotate it to get the original string.

Input
The input consists of two strings 
𝑆
S and 
𝑇
T.

Output
The output will print either "True" or "False".

Constraints
0 ≤ |S| ≤ 10000
0 ≤ |T| ≤ 10000
Example:
Enter strings

Input:
waterbottle erbottlewat
Output:
True

স্ট্রিং রোটেশন
EN

সমস্যার বিবরণ
এমন একটি প্রোগ্রাম লিখ যা এমন একটি ফাংশন তৈরি করবে যা চেক করবে একটি স্ট্রিং আরেকটি স্ট্রিং এর ঘূর্ণন কীনা। যেমন "waterbottle" হল "erbottlewat" স্ট্রিং টির রোটেশন বা ঘূর্ণন।

ইনপুট
ইনপুটে থাকবে দুইটি string, যারা হল যথাক্রমে 
𝑆
S এবং 
𝑇
T।

আউটপুট
আউটপুটে True অথবা False প্রিন্ট হবে।

সীমাবদ্ধতা
0 ≤ |S| ≤ 10000
0 ≤ |T| ≤ 10000
উদাহরণ:
Enter strings

ইনপুট:
waterbottle erbottlewat
আউটপুট:
True

```php
<?php
function is_rotation($S, $T) {
    // Check if lengths are different
    if (strlen($S) != strlen($T)) {
        return "False";
    }
    
    // Concatenate S with itself
    $concatenated = $S . $S;
    
    // Check if T is a substring of concatenated S
    if (strpos($concatenated, $T) !== false) {
        return "True";
    } else {
        return "False";
    }
}

// Read input from the user
fscanf(STDIN, "%s %s", $S, $T);

// Check if T is a rotation of S and print the result
echo is_rotation($S, $T) . "\n";
?>


<?php
function isRotation($s, $t) {
    // Check if lengths of both strings are equal and non-zero
    if (strlen($s) == strlen($t) && strlen($s) > 0) {
        // Concatenate $s with itself and check if $t is a substring of the result
        $sTwice = $s . $s;
        return strpos($sTwice, $t) !== false;
    }
    return false;
}

// Read input from command line
fscanf(STDIN, "%s %s", $s, $t);

// Check if one string is a rotation of another
if (isRotation($s, $t)) {
    echo "True\n";
} else {
    echo "False\n";
}
?>
```

