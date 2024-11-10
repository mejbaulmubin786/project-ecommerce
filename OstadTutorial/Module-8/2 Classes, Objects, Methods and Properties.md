ক্লাস নেইম সবসময় বড় হাতের অক্ষর দিয়ে শুরু করতে হয়।
```php
<?php

class Human {
    public $name;
    function sayHi() {
        echo "Salam";
    }
}

class Cat {
    function sayHi() {
        echo "Meow";
    }
}

class Dog {
    function sayHi() {
        echo "Woof";
    }
}

$h1 = new Human();
$h1->name = "Rubel";
$c1 = new Cat();

$d1 = new Dog();

$h1->sayHi();
echo $h1->name;
```

```php
<?php
class Human {
    public $name;

    function sayHi() {
        echo "Salam";
    }

    function sayName() {
        echo "My Name is {$this->name}";
    }
}

$h1 = new Human();
$h1->name = "Mejbaul Mubin";

$h1->sayName();
```


chat GPT
In PHP, object-oriented programming (OOP) involves the use of classes, objects, methods, and properties. Let's discuss each concept with examples:

### Classes and Objects

A **class** is a blueprint for creating objects. It defines properties (variables) and methods (functions) that the objects created from the class can use.

An **object** is an instance of a class. When you create an object, you are creating a specific instance of the class with its own set of properties and methods.

### Example: Defining a Class and Creating an Object

```php
<?php
class Car {
    // Properties
    public $make;
    public $model;
    public $year;

    // Constructor
    public function __construct($make, $model, $year) {
        $this->make = $make;
        $this->model = $model;
        $this->year = $year;
    }

    // Methods
    public function displayInfo() {
        return "Car: $this->make $this->model, Year: $this->year";
    }
}

// Creating an object of the Car class
$car1 = new Car("Toyota", "Corolla", 2020);

// Accessing properties and methods
echo $car1->displayInfo();
?>
```

### Properties

Properties are variables that belong to a class. They are used to store data for objects.

### Example: Defining and Using Properties

In the example above, `make`, `model`, and `year` are properties of the `Car` class.

### Methods

Methods are functions that belong to a class. They define behaviors or actions that objects created from the class can perform.

### Example: Defining and Using Methods

In the example above, `displayInfo` is a method of the `Car` class. This method returns a string containing the car's information.

### Access Modifiers

PHP uses access modifiers to control the visibility of properties and methods. The three most common access modifiers are:

- `public`: The property or method can be accessed from anywhere.
- `protected`: The property or method can be accessed within the class and by classes derived from that class.
- `private`: The property or method can only be accessed within the class itself.

### Example: Using Access Modifiers

```php
<?php
class Car {
    // Properties with different access modifiers
    public $make;
    protected $model;
    private $year;

    // Constructor
    public function __construct($make, $model, $year) {
        $this->make = $make;
        $this->model = $model;
        $this->year = $year;
    }

    // Public method
    public function displayInfo() {
        return "Car: $this->make $this->model, Year: $this->year";
    }

    // Protected method
    protected function getModel() {
        return $this->model;
    }

    // Private method
    private function getYear() {
        return $this->year;
    }
}

$car1 = new Car("Honda", "Civic", 2018);
echo $car1->displayInfo(); // Accessible
// echo $car1->getModel(); // Error: Cannot access protected method
// echo $car1->getYear(); // Error: Cannot access private method
?>
```

### Conclusion

In PHP, classes, objects, methods, and properties form the foundation of object-oriented programming. By defining classes and creating objects, you can encapsulate data and functionality, making your code more modular, reusable, and easier to maintain. Access modifiers allow you to control the visibility and access level of properties and methods, enhancing the security and robustness of your code.