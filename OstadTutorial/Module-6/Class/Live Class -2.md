#### **Dividing a large function into smaller functions | Recursion and Recursive Functions | Variable Scope in PHP Function**

Some important extention for browser
https://app.daily.dev/
https://muz.li/


https://dev.to/

```php
function countx()
{
  static $countn = 0;
  $countn++;

  echo "Function has been called {$countn} times\n";
}

countx();
countx();
countx();
countx();
countx();
```

**Optional parameters in PHP can never be placed before required parameters, they must be placed at the end.**
```php
function sendOrderNotification($to, $from = 'noreply@ecommerce.com', $subject = 'Order Confirmation', $body = 'Thank you for your order!') 
{ // called parameter in function definitation 
  // Assuming you have an email sending function
  // mail($to, $subject, $body, "From: {$from}");

  // For demonstration, we'll just print the email details
  // পেরামিটারের অর্ডার যেমনই হোক না কেন আমরা যদি $from = নেইমড আরগুমেন্ট পাঠাই তবে কোন সমস্যা নেই।
  echo "To: {$to}\n";
  echo "From: {$from}\n";
  echo "Subject: {$subject}\n";
  echo "Body: {$body}\n";
  echo "-------------------------\n";
}

// Example calls
sendOrderNotification('customer1@example.com'); 
// called argument in function call
echo "\n";

sendOrderNotification('customer2@example.com', 'support@ecommerce.com');
echo "\n";

sendOrderNotification('customer3@example.com', 'support@ecommerce.com', 'Special Offer');
echo "\n";

sendOrderNotification(to: 'customer4@example.com', subject: 'Your Custom Order', body: 'Your custom order has been shipped.');
```

```php
<?php

function claculateTax(Int $amount, Int $taxPercentage = 10) {
    return $amount * $taxPercentage / 100;
}

echo claculateTax(50000);
```

#Function 
*<mark style="background: #FFF3A3A6;">(ctrl+g</mark>* line number)/(<mark style="background: #FFB86CA6;">ctrl+p</mark>->:line number)to find a individual line in VS Code.

**argument vs parameter(actual value)**

```php
$name = "John Doe";

function greet($person) {
    $person = "Jane Deo";
    $greet = "Hello {$person}\n";
    echo $greet;
}

greet($name);
echo $name;
```
এই ফাংশনে পেরামিটার হিসেবে ভেলু পাস হচ্ছে ফলে নতুন ভেলু আরগুমেন্ট হিসেবে পাস করলে ভেতরে চেঞ্জ হলেও বাহিরে এর এফেক্ট পড়ে না । কিন্তু যদি আমরা চাই বাহিরে এর প্রভাব পড়ুক তবে নিচেন নিয়মে করা যায়।
```php
$name = "Mejbaul Mbuin";

function greet(&$person) {
    $person = "Jane Deo";
    $greet = "Hello {$person}\n";
    echo $greet;
}

greet($name);
echo $name;
greet("Sanzida Islam");//not possible because paramitter is reference. 
```
এখানে পেরামিটার হিসেবে রেফারেন্স পাস করা হয়েছে তাই ভেতরের টার পাশাপাশি বাহিরের ভেলুও চেঞ্জ হয়ে গেছে।

```php
<?php

function completeOrder($orderId) {
    //database connection
    //
    //code for reduce product stock
    //
    //change order status
    //
    //calculate total price
    //code for reduce product stock
    //
    //generate pdf invoice
    //
    //send email for order confirmation
    //

    return true;
}
```
এই রকম ফাংশন করা বাস্তব জীবনে কোন মতেই ঠিক না আমাদের এই ফাংশনকে ছোট ছোট কিছু পার্ট এ ভাগ করে নিতে হবে । এতে কোড এর রি-ইউজেবিলিটি বাড়বে রিডেবিলিটি বাড়বে। 
```php
function reduceStock($orderId) {

}

function getOrderDetails($orderId) {
    //return order datails

}

function updateOrderStatus($orderId, $status) {
    //update order status
}

function getTotalPrice($orderId) {
    //return total price
}

function generateInvoice($orderId) {
// generate pdf invoice
}

function sendOrderCompleteEmail($orderId, $invoice) {
    //send email for order confirmation
}
function sendRefundProcessedEmail($orderId, $invoice) {
    //send email for refund
}
```
এই ভাবে আমরা উপরের ফাংশনটিকে ছোট ছোট অংশে ভাগ করে নিয়ে পূবের্র ফাংশনটিকে মডিফাইড করে নি।
```php
function completeOrder() {
    
    $orderDetails = getOrderDetails($orderId);
    reduceStock($orderId);
    updateOrderStatus($orderId, 'complete');

    $totalPrice = getTotalPrice($orderId);
    $invoice = generateInvoice($orderId);
    return true;
}
```

Recursive Function: 
In real life, we ​​should avoid using recursive functions as much as possible. is the sentence is grammatically correct?
```php
<?php
function recursivelyReduceAndPrint($number) {
    echo "Current Number = $number\n";

    $number = $number - 1;
    if ($number > 0) {
        recursivelyReduceAndPrint($number);
    }
}



function ReduceAndPrintWithForLoop($number) {
    for ($i = $number; $i > 0; $i--) {
        echo "current Number = $i\n";
    }
}

recursivelyReduceAndPrint(5);
ReduceAndPrintWithForLoop(5);
```

```php
<?php
function getFactorialRecursively($number) {
    if ($number == 1) {
        return 1;
    } else {
        return $number * getFactorialRecursively($number - 1);
    }

}

echo getFactorialRecursively(5);

function getFactorialWithFoorLoop($number){
$factorial = 1;
for ($i = 1; $i <= $number; $i++){
$factorial = $factorial * $i;
}
}
echo getFactorialWithFoorLoop(5);
```



### Anonymous functions
```php
<?php
$number = [12, 23, 24, 15, 17, 20, 14, 16, 13, 25, 29, 30, 45];

$evenNumber = array_filter($number, function ($number) {
    if ($number % 2 == 0) {
        return true;
    }
    return false;

});

print_r($evenNumber);
```

```php
<?php
$number = [12, 23, 24, 15, 17, 20, 14, 16, 13, 25, 29, 30, 45];

function filterEvenNumbers($number) {
    if ($number % 2 == 0) {
        return true;
    }
    return false;
}

//odd number
function filterOddNumbers($number) {
    if ($number % 2 == 1) {
        return true;
    }
    return false;
}

$evenNumbers = array_filter($number, 'filterEvenNumbers');
$oddNumbers = array_filter($number, 'filterOddNumbers');

print_r($evenNumbers);
```



অ্যানোনিমাস (বা ল্যাম্বডা) ফাংশন এবং ক্লোজার (closure) একই নয়, তবে তারা সম্পর্কিত ধারণা এবং প্রায়শই একসাথে ব্যবহৃত হয়। আসুন আমরা এদের পার্থক্য এবং সম্পর্কটি ব্যাখ্যা করি।

অ্যানোনিমাস ফাংশন (ল্যাম্বডা ফাংশন)
অ্যানোনিমাস ফাংশন হল একটি ফাংশন যা নামবিহীন এবং সাধারণত তাৎক্ষণিকভাবে ব্যবহার করার জন্য তৈরি করা হয়। এটি সাধারণত একটি ভেরিয়েবলের মধ্যে সংরক্ষণ করা হয় বা কলব্যাক হিসেবে পাস করা হয়। উদাহরণস্বরূপ:
```php
$greet = function($name) {
    return "Hello, $name";
};

echo $greet("John"); // আউটপুট: Hello, John
```
ক্লোজার (Closure)
ক্লোজার হল একটি বিশেষ ধরনের অ্যানোনিমাস ফাংশন যা এর তৈরি হওয়া স্কোপের ভেরিয়েবলগুলিতে অ্যাক্সেস করতে পারে। ক্লোজারগুলি সাধারণত ফাংশনের বাইরের ভেরিয়েবলগুলিকে ফাংশনের ভিতরে "বন্ধ" করে রেখে তাদের ব্যবহারের জন্য তৈরি করা হয়। পিএইচপি তে, use কীওয়ার্ড ব্যবহার করে ক্লোজার তৈরি করা হয়। উদাহরণস্বরূপ:

```php
$message = "Hello";

$greet = function($name) use ($message) {
    return "$message, $name";
};

echo $greet("John"); // আউটপুট: Hello, John
```
এখানে $message ভেরিয়েবলটি ক্লোজারের মধ্যে ব্যবহৃত হয়েছে, যদিও এটি ক্লোজারটির বাইরে ডিক্লেয়ার করা হয়েছে।

# ক্লোজার এবং অ্যানোনিমাস ফাংশনের পার্থক্য
অ্যানোনিমাস ফাংশন: কোন নাম ছাড়াই ফাংশন, সাধারণত তাৎক্ষণিকভাবে ব্যবহৃত হয়।
ক্লোজার: একটি বিশেষ ধরনের অ্যানোনিমাস ফাংশন যা বাইরের স্কোপের ভেরিয়েবলগুলিতে অ্যাক্সেস করতে পারে।
উদাহরণ
অ্যানোনিমাস ফাংশন:
```php
$sum = function($a, $b) {
    return $a + $b;
};

echo $sum(5, 10); // আউটপুট: 15
```
ক্লোজার:
```php
$x = 10;
$addX = function($y) use ($x) {
    return $x + $y;
};

echo $addX(5); // আউটপুট: 15

```
ক্লোজারটি বাইরের $x ভেরিয়েবলটি ব্যবহার করতে পারে, যা একটি সাধারণ অ্যানোনিমাস ফাংশনের পক্ষে সম্ভব নয়।

```php
<?php
$persons = [
    ['name' => "John", 'age' => 34],
    ['name' => "Jane", 'age' => 23],
    ['name' => "Joe", 'age' => 45],
    ['name' => "Jemi", 'age' => 17],
    ['name' => "Jaba", 'age' => 25],
    ['name' => "Jarin", 'age' => 30],
    ['name' => "Jara", 'age' => 35],
    ['name' => "Jehan", 'age' => 16],
    ['name' => "Joglo", 'age' => 55],
    ['name' => "Jolamukhi", 'age' => 12],
];
//first method
$adults = array_filter($persons, function ($person) {
    if ($person['age'] > 25) {
        return true;
    }
    return false;
});
//second method
$adults = array_filter($persons, function($person) {
    return $person['age'] > 25;
});


//$adults = array_filterBy25($person, 'filterBy25');

print_r($adults);
```

Array  
//filter, map, reduce