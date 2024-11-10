```php
<?php
$name = false;

if (isset($name)) { // php তে কোন ভেরিয়েবলে কোন ডাটা আছে কিনা এর জন্য এই isset ফাংশনটি $name = ' ' দিলেও সেট ধরবে।
    echo "Name is set";
} else {
    echo "Not set";
}
echo "\n";
if (empty($name)) { // php তে কোন ভেরিয়েবল empty কিনা এর জন্য এই ফাংশনটি হয় কিন্তু এই ফাংশনটি $name = 0/$name = false দিলেও empty দেখায় ।
    echo "Name is empty";
} else {
    echo "Not empty";
}
echo "\n";
if (isset($name) && (is_numeric($name) || $name != '')) { // best way and correct way if we want to see with both 0 and empty
    echo "Name is set and it's not empty";
} else {
    echo "Name is either not set or it's empty";
}
```