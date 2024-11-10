### `sprintf` ফাংশন:
`printf` এর একটি ভ্যারিয়েন্ট `sprintf`। এটি একইভাবে কাজ করে, তবে আউটপুট স্ট্রিংকে রিটার্ন করে, ইকো বা প্রিন্ট করার পরিবর্তে।

```php
<?php
$fname = "Isaac";
$lname = "Newton";
printf("His name is %s %s\n", $fname, $lname);
$greeting = sprintf("His name is %s %s", $fname, $lname);
echo $greeting;
/* Output
His name is Isaac Newton
His name is Isaac Newton