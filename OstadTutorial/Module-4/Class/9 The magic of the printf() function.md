PHP-তে `printf()` ফাংশনের মধ্যে নির্দিষ্ট আর্গুমেন্ট নম্বর উল্লেখ করে আর্গুমেন্টগুলি পুনর্ব্যবহার করা সম্ভব। এর জন্য ফরম্যাট স্পেসিফায়ারগুলির আগে একটি ডলার চিহ্ন (`$`) সহ আর্গুমেন্ট নম্বর ব্যবহার করতে হয়।

### উদাহরণ:

```php
<?php
$first = "apple";
$second = "banana";

// আর্গুমেন্টগুলি পুনর্ব্যবহার করার জন্য নম্বর উল্লেখ করে
printf("I like %1\$s and %2\$s. Do you like %2\$s and %1\$s?\n", $first, $second);

// আউটপুট: I like apple and banana. Do you like banana and apple?
?>
```

উপরের উদাহরণে, `%1\$s` প্রথম আর্গুমেন্ট `$first` কে নির্দেশ করে এবং `%2\$s` দ্বিতীয় আর্গুমেন্ট `$second` কে নির্দেশ করে। এইভাবে আপনি সহজেই আর্গুমেন্টগুলি পুনর্ব্যবহার করতে পারেন এবং বিভিন্ন অর্ডারে প্রদর্শন করতে পারেন।

### বিস্তারিত উদাহরণ:

```php
<?php
$num1 = 5;
$num2 = 10;
$num3 = 15;

// আর্গুমেন্ট পুনর্ব্যবহার এবং অর্ডার পরিবর্তন
printf("Numbers: %1\$d, %2\$d, %3\$d\n", $num1, $num2, $num3); // আউটপুট: Numbers: 5, 10, 15
printf("Numbers swapped: %3\$d, %1\$d, %2\$d\n", $num1, $num2, $num3); // আউটপুট: Numbers swapped: 15, 5, 10
printf("Repeat: %2\$d, %2\$d, %1\$d\n", $num1, $num2); // আউটপুট: Repeat: 10, 10, 5
?>
```

এখানে, `%1\$d`, `%2\$d`, এবং `%3\$d` যথাক্রমে `$num1`, `$num2`, এবং `$num3` নির্দেশ করে। আপনি এই নম্বরগুলি ব্যবহার করে আর্গুমেন্টগুলির পুনর্ব্যবহার এবং অর্ডার পরিবর্তন করতে পারেন।

### অন্যান্য ফরম্যাট স্পেসিফায়ারের সাথে ভেরিয়েবল সুইচিং:

```php
<?php
$name = "Alice";
$age = 30;
$height = 5.6;

printf("%1\$s is %2\$d years old and %3\$.1f feet tall.\n", $name, $age, $height);
// আউটপুট: Alice is 30 years old and 5.6 feet tall.

printf("In reverse order: %3\$.1f feet tall, %2\$d years old, %1\$s.\n", $name, $age, $height);
// আউটপুট: In reverse order: 5.6 feet tall, 30 years old, Alice.
?>
```

এই উদাহরণে, `%1\$s`, `%2\$d`, এবং `%3\$.1f` যথাক্রমে `$name`, `$age`, এবং `$height` নির্দেশ করে। আপনি এই নম্বরগুলি ব্যবহার করে আর্গুমেন্টগুলির পুনর্ব্যবহার এবং অর্ডার পরিবর্তন করতে পারেন।

### সংক্ষেপে:
- **ফরম্যাট স্পেসিফায়ারগুলির সাথে ডলার চিহ্ন (`$`) সহ আর্গুমেন্ট নম্বর ব্যবহার করা হয় ভেরিয়েবল সুইচিং করার জন্য।**
- **এই পদ্ধতি আপনাকে একটি ফরম্যাট স্ট্রিং এর মধ্যে একাধিকবার আর্গুমেন্টগুলি পুনর্ব্যবহার এবং বিভিন্ন অর্ডারে প্রদর্শন করার অনুমতি দেয়।**

এটি প্রয়োজনীয় হলে আপনার আউটপুট ফরম্যাটিং আরও নমনীয় এবং দক্ষ করে তুলতে সহায়ক হয়।

```PHP
<?php
$number = 100;
printf("The number is %1\$d equivalent of in binary %1\$b and equivalent of in octal %1\$o and equivalent of in hexadecimal %1\$x", $number);
//Output: The number is 100 equivalent of in binary 1100100 and equivalent of in octal 144 and equivalent of in hexadecimal 64
```
