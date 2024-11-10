```php
<?php
class RGB {
    private $color;
    private $red;
    private $green;
    private $blue;

    function __construct($color = '') {
        $this->color = ltrim($color, "#");
        $this->parseColor();
    }

    function getColor() {
        return $this->color;
    }

    function setColor($color) {
        $this->color = ltrim($color, "#");
        $this->parseColor();
    }

    private function parseColor() {
        if ($this->color) {
            $colors = sscanf($this->color, "%02x%02x%02x");
            print_r($colors);
        }
    }

}

$myColor = new RGB("#ffef27");
```

```php
<?php
class RGB {
    private $color;
    private $red;
    private $green;
    private $blue;

    function __construct($color = '') {
        $this->color = ltrim($color, "#");
        $this->parseColor();
    }

    function getColor() {
        return $this->color;
    }

    function getRGBColor() {
        return array($this->red, $this->green, $this->blue);
    }

    function redRGBColor() {
        echo "Red ={$this->red}\nGreen={$this->green}\nBlue={$this->blue}";
    }

    function setColor($color) {
        $this->color = ltrim($color, "#");
        $this->parseColor();
    }

    private function parseColor() {
        if ($this->color) {
            list($this->red, $this->green, $this->blue) = sscanf($this->color, "%02x%02x%02x");
        } else {
            list($this->red, $this->green, $this->blue) = array(0, 0, 0);
        }
    }

    function getRed() {
        return $this->red;
    }

    function getGreen() {
        return $this->green;
    }

    function getBlue() {
        return $this->blue;
    }

}

$myColor = new RGB("#ffef27");
$myColor->redRGBColor();
```

এই কোডটি একটি PHP ক্লাস তৈরি করে যার নাম `RGB`। এই ক্লাসটি রঙের তথ্য সংগ্রহ ও প্রক্রিয়াজাত করে, বিশেষ করে হেক্সাডেসিমাল (hexadecimal) ফরম্যাটে প্রদত্ত রঙকে RGB (Red, Green, Blue) ফরম্যাটে রূপান্তর করে। আসুন কোডটির প্রতিটি অংশ বুঝি:

### ক্লাস ডেফিনিশন

```php
class RGB {
    private $color;
    private $red;
    private $green;
    private $blue;
```

- `RGB` একটি ক্লাস যা তিনটি প্রাইভেট প্রপার্টি ($color, $red, $green, $blue) ডিফাইন করে।

### কন্সট্রাক্টর

```php
    function __construct($color = '') {
        $this->color = ltrim($color, "#");
        $this->parseColor();
    }
```

- কন্সট্রাক্টর ফাংশনটি যখন একটি নতুন `RGB` অবজেক্ট তৈরি করা হয় তখন কল করা হয়।
- এটি `$color` প্যারামিটার গ্রহণ করে, যা একটি হেক্সাডেসিমাল কালার স্ট্রিং হতে পারে (যেমন "#ffef27")।
- `ltrim` ফাংশন ব্যবহার করে স্ট্রিং এর শুরু থেকে "#" সরিয়ে ফেলা হয় এবং `$this->color` এ সেট করা হয়।
- `parseColor()` ফাংশন কল করা হয়, যা হেক্স কালারকে RGB মানে রূপান্তর করে।

### গেটার ফাংশনসমূহ

```php
    function getColor() {
        return $this->color;
    }

    function getRGBColor() {
        return array($this->red, $this->green, $this->blue);
    }

    function getRed() {
        return $this->red;
    }

    function getGreen() {
        return $this->green;
    }

    function getBlue() {
        return $this->blue;
    }
```

- `getColor()` ফাংশনটি `$color` রিটার্ন করে।
- `getRGBColor()` ফাংশনটি RGB মানগুলি (red, green, blue) একটি অ্যারেতে রিটার্ন করে।
- `getRed()`, `getGreen()`, এবং `getBlue()` ফাংশনগুলি পৃথকভাবে `red`, `green`, এবং `blue` মানগুলি রিটার্ন করে।

### RGB রঙ প্রদর্শন

```php
    function redRGBColor() {
        echo "Red ={$this->red}\nGreen={$this->green}\nBlue={$this->blue}";
    }
```

- `redRGBColor()` ফাংশনটি `$red`, `$green`, এবং `$blue` এর মানগুলি প্রদর্শন করে।

### সেটার ফাংশন

```php
    function setColor($color) {
        $this->color = ltrim($color, "#");
        $this->parseColor();
    }
```

- `setColor($color)` ফাংশনটি `$color` মান সেট করে এবং পুনরায় `parseColor()` কল করে।

### কালার পাসিং

```php
    private function parseColor() {
        if ($this->color) {
            list($this->red, $this->green, $this->blue) = sscanf($this->color, "%02x%02x%02x");
        } else {
            list($this->red, $this->green, $this->blue) = array(0, 0, 0);
        }
    }
```

- `parseColor()` ফাংশনটি `$color` স্ট্রিংকে RGB কম্পোনেন্টগুলিতে রূপান্তর করে।
- `sscanf` ব্যবহার করে হেক্সাডেসিমাল স্ট্রিংকে ইন্টিজার মানে রূপান্তর করা হয়।
- যদি `$color` খালি হয়, তাহলে `red`, `green`, এবং `blue` মানগুলি 0 সেট করা হয়।

### অবজেক্ট তৈরি ও ব্যবহারের উদাহরণ

```php
$myColor = new RGB("#ffef27");
$myColor->redRGBColor();
```

- `$myColor` নামে একটি নতুন `RGB` অবজেক্ট তৈরি করা হয় এবং "#ffef27" রঙ সেট করা হয়।
- `redRGBColor()` ফাংশনটি কল করে RGB মানগুলি প্রদর্শন করা হয়।

### আউটপুট
কোডটির আউটপুট হবে:
```
Red =255
Green=239
Blue=39
```

এইভাবে, আপনি একটি হেক্স রঙকে RGB মানে রূপান্তর এবং প্রদর্শন করতে পারেন এই `RGB` ক্লাস ব্যবহার করে।