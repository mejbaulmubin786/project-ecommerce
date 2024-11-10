```php
<?php
$contition1 = false;
$contition2 = false;
$contition3 = false;

if ($contition1) {
  if ($contition2) {
    if ($contition3) {
      echo "hello";
    } else {
      echo "no 1";
    }
  } else {
    echo "no 2";
  }
} else {
  echo "no 3";
}

// We can write shortly
echo "\n";
if ($contition1 && $contition2 && $contition3) {
  echo "hello";
} else if ($contition1 && $contition2) {
  echo "no 1";
} else if ($contition1) {
  echo "no 2";
} else {
  echo "no 3";
}
```
