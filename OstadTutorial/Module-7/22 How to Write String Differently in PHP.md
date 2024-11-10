```php
<?php
$name = "Mejbaul Mubin";

$string01 = "My name is: $name \n \t New Data";
echo $string01 . "\n";
// ভেরিয়েবল এর নাম সরাসরি বা {$name} লেখা যায়। $string01 = "My name is: {$name} \n";
// তবে এখানে সিঙ্গেল কোর্ট ব্যবহার করলে ভেরিয়েবলের ভেলু দেখাবে না শুধু ভেরিয়েবলের নাম দেখাবে এবং \n বিশেষ স্ট্রিং লিটারেল গুলো ও কাজ করবে না।
```
PHP তে স্ট্রিং লেখার আরো দুটো পদ্ধতি আছে। একটি হেয়ারডক 
```php
$name = "Mejbaul Mubin";
$heredoc = <<<EOD
data 1
new line {$name} 
more text
EOD;//শেষ লাইনে কোন স্পেস হবে না। এবং নতুন লাইনে হতে হবে।
//এর ভেতর ভেরিয়েবলের মান ও \n গুলোও কাজ করবে।

echo $heredoc;

$name = "Mejbaul Mubin";
$heredoc = <<<'EOD' 
data 1
new line {$name} 
more text
EOD;//'EOD' লেখাতে আর এর ভেতর ভেরিয়েবলের মান ও \n গুলোও কাজ করবে না।

echo $heredoc;


```