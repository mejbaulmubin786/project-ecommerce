# কলব্যাক ফাংশন কি এবং কেন ব্যবহার করবো?
কলব্যাক ফাংশন হলো একটি ফাংশন যা অন্য একটি ফাংশনের মধ্যে পাস করা হয় এবং সেই ফাংশনের নির্দিষ্ট সময় বা স্থানে কাজ করানোর জন্য ব্যবহার হয়। আপনি কলব্যাক ফাংশন অন্য একটি ফাংশনের প্যারামিটার হিসেবে পাস করতে পারেন এবং সেই ফাংশনের সাথে আপনার কাস্টম লজিক প্রয়োগ করতে পারেন।

ধরুন, আমরা এখানে দুটি নাম্বার যোগ করার একটি ফাংশন লিখেছি, যে ফাংশন ২ টি নাম্বার এবং একটি কলব্যাক ফাংশন প্যারামিটার হিসেবে নেয়। বিষয় হলো আমরা এখানে ২টি নাম্বার যোগ করব ঠিকই কিন্তু ধরুন, আমাদের একটা রিকয়্যারমেন্ট দিয়ে দেয়া হয়েছে যে, যোগ করার আগে ১ম ভ্যারিয়েবলের মান ২ বাড়িয়ে এরপর যোগ করতে হবে।

এখন আমরা চাইলে এই কাজটি আমাদের মেইন ফাংশনের ভিতরেও লিখতে পারি। কোনো সমস্যা নেই। কিন্তু প্রোগ্রামিংয়ে একটা রুলস আছে, সেটা হলো; সিংগেল রেসপন্সিবিলিটি। যার মানে হলো একটা ফাংশন একটাই কাজ করবে। এখানে লক্ষ করুন, আমাদের মেইন ফাংশনের কাজ হলো যোগ করা। এখন তার কাজ যদি আবার ১ম ভ্যারিয়েবলের মান ২ করে বাড়ানোও হয়, তাহলে কাজ হয়ে গেলো ২ টি। তাই আমরা এই ২ করে বাড়ানোর দায়িত্বটা আরেকটা ফাংশনের উপর দিয়ে দিবো, এই ফাংশনটাই হলো কলব্যাক ফাংশন। আর মেইন ফাংশনে যোগ করার আগে জাস্ট এই কলব্যাক ফাংশনকে কল করবো।
এখানে আমি খুবই সিম্পল একটি উদাহরন দিয়ে বোঝানোর চেষ্টা করেছি। কিন্তু কলব্যাক ফাংশনের আরো অনেক ব্যবহার রয়েছে।
```php
<?php

function addNumbersWithCallback( $num1, $num2, $callback )
{

// Check if the callback is a valid callable function
    if ( is_callable( $callback ) ) {
        // Apply the callback function to the first number
        $num1 = $callback( $num1 );
    }

    // Add the modified first number to the second number
    $result = $num1 + $num2;

    return $result;
}

// Example callback function: Increase the number by 2
function increaseByTwo( $number )
{
    return $number + 2;
};

// Example usage:
$num1 = 5;
$num2 = 10;

$result = addNumbersWithCallback( $num1, $num2, "increaseByTwo" );
echo "Result: $result"; // Output: Result: 17 ((5 + 2) + 10)


//=============================================================================


//Another Implementation
function addNumbersWithCallback( $num1, $num2, $callback )
{

// Check if the callback is a valid callable function
    if ( is_callable( $callback ) ) {
        // Apply the callback function to the first number
        $num1 = $callback( $num1 );
    }

    // Add the modified first number to the second number
    $result = $num1 + $num2;

    return $result;
}

// Example callback function: Increase the number by 2
$increaseByTwo = function ( $number ) {
    return $number + 2;
};

// Example usage:
$num1 = 5;
$num2 = 10;

$result = addNumbersWithCallback( $num1, $num2, $increaseByTwo );
echo "Result: $result"; // Output: Result: 17 ((5 + 2) + 10)
```

