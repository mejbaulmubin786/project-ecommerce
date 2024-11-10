```php
<?php
class ParentClass {
    protected $name;
    function __construct($name) {
        $this->sayHi();
    }

    function sayHi() {
        echo "Hi from {$this->name}";
    }

}

class ChildClass extends ParentClass {
    function sayHi() {
        echo "Hello";
    }
}

$cc = new ChildClass("ABCD");
```

```php
<?php
class ParentClass {
    protected $name;
    function __construct($name) {
        $this->name = $name;
        $this->sayHi();
    }

    function sayHi() {
        echo "Hi from {$this->name}\n";
    }

}

class ChildClass extends ParentClass {
    function sayHi() {
        parent::sayHi(); // পেরেন্ট ক্লাসের মেথদ কল
        echo "Hello\n";
    }
}

$cc = new ChildClass("ABCD");
```