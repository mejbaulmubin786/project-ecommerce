
Look For Ten
বাং

Problem Statement
Write a program to create a function that takes two arguments. Both arguments are integers, a and b. Return true if one of them is 10 or if their sum is 10.

Input
The input consists of two integers.

Output
The output will print "True" if one of the input is 10 or their sum is 10. Otherwise, it will print "False".

Constraints
0 ≤ |S| ≤ 10000
Example:
Enter numbers

Input:
5 5
Output:
True
Notes:
None

দশকে খুঁজ
EN

সমস্যার বিবরণ
এমন একটি প্রোগ্রাম লিখ যেখানে একটি ফাংশন দুইটি আর্গুমেন্ট নিবে। দুইটি আর্গুমেন্টই হবে integer। ফাংশনটি ট্রু রিটার্ন করবে যদি তাদের মধ্যে যে কোন একটি সংখ্যা 10 বা তাদের যোগফল 10 হয়।

ইনপুট
ইনপুট হবে দুইটি integr

আউটপুট
আউটপুটে True প্রিন্ট হবে যদি একটি সংখ্যা বা দুইটি সংখ্যার যোগফল 10 হয়। অন্যথায় False প্রিন্ট হবে।

সীমাবদ্ধতা
0 ≤ |S| ≤ 10000
উদাহরণ:
Enter numbers

ইনপুট:
5 5
আউটপুট:
True
মন্তব্য:
নেই

-------------
Certainly! Here is how you can write the same functionality in PHP:

```php
<?php
function check_ten($a, $b) {
    if ($a == 10 || $b == 10 || ($a + $b) == 10) {
        return "True";
    } else {
        return "False";
    }
}

// Input from user
fscanf(STDIN, "%d %d", $a, $b);

// Output the result
echo check_ten($a, $b);
?>
```

### Explanation

1. **Function Definition**: We define the function `check_ten($a, $b)` which takes two arguments.
2. **Condition Check**:
   - `if ($a == 10 || $b == 10 || ($a + $b) == 10)`: Checks if either of the numbers is 10 or if their sum is 10.
3. **Return Result**: The function returns "True" if any of the conditions are true; otherwise, it returns "False".
4. **User Input**: We use `fscanf(STDIN, "%d %d", $a, $b)` to read two integers from the user.
5. **Output**: The result of the function `check_ten($a, $b)` is echoed.

### Usage

To run this PHP script, you can save it to a file, for example, `check_ten.php`, and run it from the command line:

```sh
php check_ten.php
```

When prompted, enter two integers separated by a space, for example:

```sh
Enter numbers: 5 5
True
```
-----------

Concatenate Two String

Problem Statement
Write a program where two strings will be given, firstName and lastName, return a single string in the format "lastName, firstName".

Input
The input consists of two strings.

Output
The output will print a string.

Constraints
0 ≤ |S| ≤ 10000
Example:
Enter strings

Input:
John Doe
Output:
Doe, John
Notes:
None

দুইটি স্ট্রিংকে জোড়া দাও
EN

সমস্যার বিবরণ
এমন একটি প্রোগ্রাম লিখ যেখানে ইনপুটে দুইটি string দেয়া হবে firstName, lastName। আউটপুটের ফরম্যাট হবে "lastName, firstName"।

ইনপুট
ইনপুট হবে দুইটি string

আউটপুট
আউটপুট হবে একটি string

সীমাবদ্ধতা
0 ≤ |S| ≤ 10000
উদাহরণ:
Enter strings

ইনপুট:
John Doe
আউটপুট:
Doe, John
মন্তব্য:
নেই

-----------------------------------------------
To solve this problem in PHP, we will write a function that takes two strings, `firstName` and `lastName`, and returns them in the format `"lastName, firstName"`.

Here is the PHP code for the solution:

```php
<?php
function concatenate_names($firstName, $lastName) {
    return $lastName . ", " . $firstName;
}

// Input from user
fscanf(STDIN, "%s %s", $firstName, $lastName);

// Output the result
echo concatenate_names($firstName, $lastName);
?>
```

### Explanation

1. **Function Definition**: We define the function `concatenate_names($firstName, $lastName)` which takes two arguments, `firstName` and `lastName`.
2. **Concatenation**: 
   - The function concatenates the `lastName` and `firstName` strings with a comma and space in between.
3. **Return Result**: The function returns the concatenated string.
4. **User Input**: We use `fscanf(STDIN, "%s %s", $firstName, $lastName)` to read two strings from the user.
5. **Output**: The result of the function `concatenate_names($firstName, $lastName)` is echoed.

### Usage

To run this PHP script, you can save it to a file, for example, `concatenate_names.php`, and run it from the command line:

```sh
php concatenate_names.php
```

When prompted, enter two strings separated by a space, for example:

```sh
Enter strings: John Doe
Doe, John
```

This approach ensures that the program behaves as specified in the problem statement.

----------------------------
Second to Hour:Minute
বাং

Problem Statement
Write a program which will take seconds as input and output into hour:minute.

Input
The input consists of a integer.

Output
The output will print in the form hour:minute. For example if it takes 130 as input then it will print 0:2.

Constraints
0 ≤ |S| ≤ 10000
Example:
Enter number

Input:
130
Output:
0:2
Notes:
None

সেকেন্ড থেকে ঘণ্টা:মিনিট
EN

সমস্যার বিবরণ
এমন একটি প্রোগ্রাম লিখ যা ইনপুটে সেকেন্ড গ্রহণ করবে এবং আউটপুটে ঘণ্টা:মিনিট এভাবে প্রিন্ট করবে।

ইনপুট
ইনপুট হবে একটি integer

আউটপুট
আউটপুটে সবসময় ঘণ্টা:মিনিট এভাবে প্রিন্ট করবে। উদাহরণস্বরূপ যদি 130 কে ইনপুট হিসেবে গ্রহণ করে তাহলে আউটপুটে প্রিন্ট করবে 0:2

সীমাবদ্ধতা
0 ≤ |S| ≤ 1000
উদাহরণ:
Enter number

ইনপুট:
130
আউটপুট:
0:2
মন্তব্য:
নেই

-------------------------
To solve this problem, we will write a PHP program that takes an integer representing seconds as input and converts it to the format "hour:minute".

Here is the PHP code for the solution:

```php
<?php
function convert_seconds_to_hour_minute($seconds) {
    $hours = floor($seconds / 3600);
    $minutes = floor(($seconds % 3600) / 60);
    return $hours . ":" . $minutes;
}

// Input from user
fscanf(STDIN, "%d", $seconds);

// Output the result
echo convert_seconds_to_hour_minute($seconds);
?>
```

### Explanation

1. **Function Definition**: We define the function `convert_seconds_to_hour_minute($seconds)` which takes an integer argument representing seconds.
2. **Calculation**:
   - `$hours = floor($seconds / 3600)`: This calculates the number of full hours in the given seconds.
   - `$minutes = floor(($seconds % 3600) / 60)`: This calculates the number of full minutes remaining after the hours are accounted for.
3. **Return Result**: The function returns a string in the format "hour:minute".
4. **User Input**: We use `fscanf(STDIN, "%d", $seconds)` to read an integer from the user.
5. **Output**: The result of the function `convert_seconds_to_hour_minute($seconds)` is echoed.

### Usage

To run this PHP script, you can save it to a file, for example, `convert_seconds.php`, and run it from the command line:

```sh
php convert_seconds.php
```

When prompted, enter an integer representing the number of seconds, for example:

```sh
Enter number: 130
0:2
```

This approach ensures that the program converts the given number of seconds into the format "hour:minute" correctly, adhering to the problem statement.

------------------
