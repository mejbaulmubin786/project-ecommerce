### Laravel-এ Request Headers দিয়ে ডাটা হ্যান্ডেল করা

Laravel-এ আমরা শুধু রিকোয়েস্ট বডি থেকে ডাটা সংগ্রহ করতে পারি না, বরং রিকোয়েস্ট হেডার থেকেও ডাটা নিতে পারি। হেডার হলো HTTP রিকোয়েস্টের একটি গুরুত্বপূর্ণ অংশ যেখানে অনেক গুরুত্বপূর্ণ মেটাডাটা যেমন `Authorization`, `Content-Type`, ইত্যাদি পাঠানো হয়। তবে হেডারগুলোতে আমরা JSON অবজেক্ট বা নেস্টেড ভ্যালু পাঠাতে পারি না, বরং কেবল কী-ভ্যালু পেয়ার আকারে ডাটা পাঠাতে হবে। এই আলোচনা থেকে আমরা শিখবো কিভাবে Postman-এর মাধ্যমে Laravel অ্যাপ্লিকেশনে হেডারে ডাটা পাঠানো যায় এবং কন্ট্রোলারে সেটি হ্যান্ডেল করা যায়।

#### হেডারে ডাটা পাঠানো

Postman-এ আপনি হেডারে কী-ভ্যালু পেয়ার যুক্ত করে ডাটা পাঠাতে পারবেন। নিচের ধাপে এটি করা যাবে:

1. **Headers ট্যাবে** যান।
2. কী-ভ্যালু আকারে ডাটা লিখুন:
    - Key: `name`, Value: `Mejbaul Mubin`
    - Key: `age`, Value: `32`

এখানে "name" এবং "age" হলো হেডারের কী এবং "Mejbaul Mubin" এবং "32" হলো তাদের ভ্যালু।

### হেডার থেকে ডাটা রিসিভ করা:

Laravel-এর `Request` ক্লাসের সাহায্যে আপনি খুব সহজেই হেডার থেকে ডাটা সংগ্রহ করতে পারবেন। নিচে এর কয়েকটি উদাহরণ দেওয়া হলো:

#### সমস্ত হেডার সংগ্রহ করা:

যদি আপনি সমস্ত হেডার একসাথে দেখতে চান, তাহলে নিচের কোডটি ব্যবহার করতে পারেন:

```php
// DemoController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    function DemoAction(Request $request): array {
        return $request->header(); // সমস্ত হেডার রিটার্ন করবে
    }
}
```

এই কোডটি `header()` মেথড ব্যবহার করে সমস্ত ইনকামিং রিকোয়েস্টের হেডারগুলোকে অ্যারে আকারে রিটার্ন করবে। Postman-এ আপনি JSON আকারে সমস্ত হেডারের ডিটেইলস দেখতে পারবেন।

#### নির্দিষ্ট হেডার সংগ্রহ করা:

যদি আপনি নির্দিষ্ট একটি বা একাধিক হেডার থেকে ডাটা নিতে চান, তাহলে নিচের মতো কোড লিখতে হবে:

```php
// DemoController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    function DemoAction(Request $request): string {
        $name = $request->header('name'); // 'name' হেডার থেকে ডাটা সংগ্রহ করা
        $age = $request->header('age');   // 'age' হেডার থেকে ডাটা সংগ্রহ করা

        return "{$name} and {$age}"; // রিটার্ন: "Mejbaul Mubin and 32"
    }
}
```

এই উদাহরণে আমরা শুধু `name` এবং `age` হেডার থেকে ডাটা সংগ্রহ করেছি। Postman-এর মাধ্যমে যদি `name` এবং `age` হেডার পাঠানো হয়, তাহলে কন্ট্রোলার সেই ডাটা প্রসেস করে একটি স্ট্রিং হিসেবে রিটার্ন করবে।

### ডিফল্ট হেডার এবং Authorization হেডার:

হেডারগুলোতে সাধারণত কিছু ডিফল্ট ডাটা থাকে, যেমন `Content-Type`, `User-Agent`, `Authorization` ইত্যাদি। Laravel-এর `Request` ক্লাস ব্যবহার করে সহজেই এই হেডারগুলো এক্সেস করা যায়।

**Authorization হেডার থেকে ডাটা নেওয়া**:

```php
// DemoController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    function DemoAction(Request $request): string {
        $token = $request->header('Authorization'); // Authorization হেডার থেকে টোকেন সংগ্রহ করা

        return "Token: {$token}";
    }
}
```

Postman-এ আপনি একটি Authorization টোকেন সেট করতে পারেন, যা Laravel কন্ট্রোলারে এক্সেস করা যাবে এবং প্রসেস করা যাবে।

### সংক্ষেপে:

-   **হেডার ডাটা পাঠানো**: Postman-এর হেডার সেকশনে কী-ভ্যালু পেয়ার আকারে ডাটা পাঠানো হয়।
-   **সমস্ত হেডার একবারে নেওয়া**: `Request::header()` মেথড ব্যবহার করে সব হেডারকে অ্যারে আকারে নেওয়া যায়।
-   **নির্দিষ্ট হেডার থেকে ডাটা নেওয়া**: `Request::header('key')` মেথড ব্যবহার করে নির্দিষ্ট হেডার থেকে ডাটা নেওয়া যায়।
-   **Authorization টোকেন**: হেডার থেকে টোকেন বা অন্য কোনো মেটাডাটা নেওয়ার জন্য `Request::header()` মেথড ব্যবহার করা হয়।

Laravel-এর `Request` ক্লাস ব্যবহার করে আপনি রিকোয়েস্ট হেডার খুব সহজেই হ্যান্ডেল করতে পারবেন।
