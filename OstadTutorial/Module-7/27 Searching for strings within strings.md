স্ট্রিং এর ভেতর যদি আমরা কোন স্ট্রিংকে খুজতে চাই তবে।
```php
<?php
$string = "Mejbaul Mubin, Rubel, Sanzida Islam, Pritey";
echo strpos($string, "Rubel");// ফাংশনটি ক্যাস সেনসেটিভ
echo stripos($string, "rubel");// ফাংশনটি ক্যাস সেনসেটিভ নয় কিন্তু কাজ একই
echo strpos($string, "Rubel", 13);// কত তম ইনডেক্স থেকে খুজতে হবে।

$offset = strpos($string, "Mejbaul");
if ($offset) {
    echo "n\The word was found\n";
} else {
    echo "n\The word was not found\n";
}

// যদিও ওয়ার্ড টি বিদ্যমান কিন্তু প্রোগ্রাম এর আউটপুট আসবে The word was not found কারন ওয়ার্ড টির ইনডিক্স 0 আর php তে 0 মানেও false প্রোগ্রামটিকে সঠিক করে লিখলে
if ($offset!==false) { // অর্থাৎ $offset যদি ফলস না হয়
    echo "n\The word was found\n";
} else {
    echo "n\The word was not found\n";
}


if ($offset!=false) { // এটিও প্রথমটির মতো কাজ করবে কারণ একই দ্বিতীয়টিতে টাইপ চেক করায় সঠিক উত্তর পাওয়া যায়।
    echo "n\The word was found\n";
} else {
    echo "n\The word was not found\n";
}


$offset = strpos($string, "Mejbaul");
echo $offset;
//শেষ দিক থেকে খুজতে চাইলে নিচের ফাংশন হবে
$offset2 = strrpos($string, "Mejbaul");
echo $offset2;
```