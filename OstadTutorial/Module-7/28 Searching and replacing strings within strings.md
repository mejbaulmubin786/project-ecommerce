```php
<?php

$string = "Quick Brown brown Fox fox jumps over the lazy dog";

$replaceString = str_replace('brown', 'Brown', $string);
echo $replaceString;
echo "\n";

$replaceString2 = str_ireplace('brown', 'red', $string); // case insensative
echo $replaceString2;
echo "\n";

$replaceString3 = str_ireplace('brown', 'red', $string, $count); // $count ভ্যারিয়েবল কয়টি রিপ্লেস হয়েছে তা দেখায়।
echo "Total replace: {$count}";
echo "\n";


$replaceString4 = str_replace('brown', 'red', $string, $count); // $count ভ্যারিয়েবল কয়টি রিপ্লেস হয়েছে তা দেখায়।
echo "Total replace: {$count}"; // এটি আবার কম হতো
echo "\n";

$string = str_replace('brown', 'red', $string, $count); // অরিজিনাল স্ট্রিং চেঞ্জ করতে চাইলে
```

```php
<?php

$string = "Quick Brown brown Fox fox jumps over the lazy dog";
$string = str_ireplace('brown', 'red', $string); // brown to red
$string = str_ireplace('fox', 'cat', $string); //fox to cat

//চাইলে দুটি কাজ একসাথে করা যেত।

$string = str_ireplace(array('brown', 'fox'), array('red', 'cat'), $string); 


$string = str_ireplace(array('brown', 'fox'), 'word', $string); // দুটি শব্দই একটি শব্দ word দিয়ে রিপ্লেস হবে।

```