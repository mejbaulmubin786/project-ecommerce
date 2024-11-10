```php
<?php

function serve($foodType, $numberOfItems = "1 cup")
{
  echo "{$numberOfItems} of {$foodType} has been served";
}


<?php
include_once("function.php");

$ft = "Coffee";
//$n = "2 cups";

serve($ft);
echo "\n";
serve("Salad", "2 Plates");
```