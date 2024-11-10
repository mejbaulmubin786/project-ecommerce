php তে স্ট্রিংকে এরে এর মতো করে ব্যবহার করা যায়।
```php
<?php
$string = "Mejbaul Mubin";
echo $string[0];
echo "\n";

// লাস্টের তিনটি ওয়ার্ড এসসেস করতে চাইলে।
$length = strlen($string);
echo "\n";
echo substr($string, $length - 3);
echo "\n";

// উপরের পদ্ধতির চেয়ে আরো সহজ একটি পদ্ধতি আছে।
echo substr($string, -3); // শেষ পর্যন্ত যাওয়ার জন্য লেন্থ দিলাম না।
echo "\n";
echo substr($string, -3, 2); // লাস্টের তিন অক্ষর থেকে প্রথম দুটি
echo "\n";
echo substr($string, -3, -1); // উপরের টির মতোই আউটপুট হবে।
echo "\n";
```