
```php
<?php
$color = array(122, 233, 65);
$red = $color[0];
$green = $color[1];
$blue = $color[2];

// আমরা উপরের মতো কোন এরের মানকে  বিভিন্ন ভেরিয়েবলে এসাইন না করে নিচের মতো আরে া সহজে করতে পারি।
list($red, $green, $blue) = $color; // আমাদের মুল ফাংশনে যদি তিনের অধিক ডাটা থাকতো তবে প্রথম তিনটা আসতো 
echo $blue;


$my_array = array("Dog","Cat","Horse");

list($a, $b, $c) = $my_array;
echo "I have several animals, a $a, a $b and a $c.";
```