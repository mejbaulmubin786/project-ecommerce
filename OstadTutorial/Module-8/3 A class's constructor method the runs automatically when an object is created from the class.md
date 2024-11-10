```php
<?php
class Human {
    public $name;

    function __construct($name) {
        echo "New Human Object Is Created\n";
        $this->name = $name;
    }

    function sayHi() {
        echo "Salam" . "\n";
        $this->sayName();
    }

    function sayName() {
        echo "My Name is {$this->name}";
    }
}

$h1 = new Human("Mejbaul Mubin");
//$h1->name = "Mejbaul Mubin";

$h1->sayHi();

$h2 = new Human("Rubel");
//$h1->name = "Mejbaul Mubin";

$h2->sayHi();
```

```php

<?php
class Human {
    public $name;
    public $age;
    function __construct($name, $age) {
        echo "New Human Object Is Created\n";
        $this->name = $name;
        $this->age = $age;
    }

    function sayHi() {
        echo "Salam" . "\n";
        $this->sayName();
    }

    function sayName() {
        echo "My Name is {$this->name}, I am {$this->age} years old\n";
    }
}

$h1 = new Human("Mejbaul Mubin", 34);
$h1->sayHi();
$h2 = new Human("Rubel", 32);
$h2->sayHi();
```

```php
<?php
class Human {
    public $name;
    public $age;
    function __construct($name, $age = 0) {
        $this->name = $name;
        $this->age = $age;
    }

    function sayHi() {
        echo "Salam" . "\n";
        $this->sayName();
    }

    function sayName() {
        if ($this->age) {
            echo "My Name is {$this->name}, I am {$this->age} years old\n";
        } else {
            echo "My Name is {$this->name}\n";
        }

    }
}

$h1 = new Human("Mejbaul Mubin", 34);
$h1->sayHi();
$h2 = new Human("Rubel");
$h2->sayHi();
```