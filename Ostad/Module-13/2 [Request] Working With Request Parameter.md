Laravel রাউট প্যারামিটার অত্যন্ত গুরুত্বপূর্ণ, কারণ এটি রাউটের মাধ্যমে ডাইনামিক ইনপুট গ্রহণ করে কন্ট্রোলার বা অ্যাকশনে প্রেরণ করতে সাহায্য করে। প্যারামিটারগুলো রাউটের ইউআরএল (URI) থেকে ডাটা সংগ্রহ করে এবং কন্ট্রোলারে পৌঁছায়। এই আলোচনায় আমরা Laravel রাউট প্যারামিটার, তাদের ডিফল্ট মান দেওয়া, এবং প্যারামিটার অপশনাল করার বিস্তারিত আলোচনা করবো।

### সাধারণ রাউট প্যারামিটার ব্যবহার:

রাউট প্যারামিটার ব্যবহার করে আমরা ইউআরএল থেকে ডাইনামিক ডাটা গ্রহণ করতে পারি। নিচে একটি উদাহরণ দেওয়া হলো:

```php
// web.php
Route::get('/hello/{name}/{age}', [DemoController::class, 'DemoAction']);
```

এই রাউটে `{name}` এবং `{age}` প্যারামিটার হিসেবে উল্লেখ করা হয়েছে। ইউআরএল এ `/hello/John/25` এরকমভাবে অ্যাক্সেস করা হলে, এটি `name` এবং `age` প্যারামিটার হিসেবে "John" এবং "25" মান পাঠাবে।

### কন্ট্রোলারে রাউট প্যারামিটার গ্রহণ:

কন্ট্রোলারে আমরা Laravel-এর `Request` ক্লাস ব্যবহার করে প্যারামিটারগুলোকে গ্রহণ করতে পারি। নিচে একটি উদাহরণ দেওয়া হলো:

```php
// DemoController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request; // Request ইমপোর্ট করতে হবে

class DemoController extends Controller {
    function DemoAction(Request $request): string {
        $name = $request->name; // প্যারামিটার 'name' রিসিভ
        $age = $request->age;   // প্যারামিটার 'age' রিসিভ
        return "My name is {$name} and my age is {$age}";
    }
}
```

এখানে `Request` ক্লাসের মাধ্যমে আমরা প্যারামিটারগুলোকে `$request` অবজেক্ট থেকে অ্যাক্সেস করেছি। `Request`-এর মাধ্যমে বিভিন্ন ধরনের ইনপুট ডাটা যেমন কুয়েরি প্যারামিটার, রিকোয়েস্ট বডি, ফাইল ইত্যাদি সহজেই অ্যাক্সেস করা যায়।

### অপশনাল প্যারামিটার:

Laravel-এ আপনি প্যারামিটারগুলোকে অপশনাল করতে পারেন। এর মানে হলো, যদি সেই প্যারামিটারটি ইউআরএল-এ না দেওয়া হয়, তবুও অ্যাকশনের রিকোয়েস্টটি সঠিকভাবে কাজ করবে। অপশনাল প্যারামিটার ডিফাইন করার জন্য প্যারামিটারের পাশে `?` যোগ করতে হয় এবং সেই প্যারামিটারের ডিফল্ট ভ্যালু কন্ট্রোলারে নির্ধারণ করা যায়।

#### উদাহরণ: অপশনাল প্যারামিটার

```php
// web.php
Route::get('/hello/{name}/{age?}', [DemoController::class, 'DemoAction']);
```

এখানে `{age?}` প্যারামিটারটি অপশনাল করা হয়েছে। যদি ইউআরএল-এ বয়স না দেওয়া হয়, তাহলে ডিফল্ট মান প্রদান করতে পারি।

```php
// DemoController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    function DemoAction(Request $request): string {
        $name = $request->name;
        $age = $request->age ?? 'Unknown'; // যদি age না থাকে, তাহলে 'Unknown' ভ্যালু ব্যবহার হবে
        return "My name is {$name} and my age is {$age}";
    }
}
```

এখানে, `$request->age` যদি না থাকে, অর্থাৎ `null` থাকে, তাহলে ডিফল্ট মান হিসেবে `'Unknown'` রিটার্ন করা হবে।

### ডিফল্ট ভ্যালু প্যারামিটারে:

আপনি কন্ট্রোলারে ডিফল্ট প্যারামিটার মান সরাসরি সেট করতে পারেন যদি কোনো মান না পাওয়া যায়:

```php
// DemoController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    function DemoAction(Request $request, $name = 'Guest', $age = 'N/A'): string {
        return "My name is {$name} and my age is {$age}";
    }
}
```

এখানে, যদি ইউআরএল-এ কোনো প্যারামিটার না পাঠানো হয়, তখন ডিফল্ট মান হিসেবে `name` হবে `'Guest'` এবং `age` হবে `'N/A'`। যেমন, `/hello` রিকোয়েস্ট করলে ডিফল্ট মানগুলো রিটার্ন হবে।

### একাধিক প্যারামিটার গ্রহণ:

Laravel-এ আপনি একাধিক প্যারামিটার রাউট থেকে গ্রহণ করতে পারেন এবং সেগুলোকে কন্ট্রোলারে হ্যান্ডেল করতে পারেন। প্রতিটি প্যারামিটারকে `/` দিয়ে আলাদা করা হয়।

```php
// web.php
Route::get('/hello/{name}/{age}/{city}', [DemoController::class, 'DemoAction']);
```

```php
// DemoController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    function DemoAction($name, $age, $city): string {
        return "My name is {$name}, I am {$age} years old, and I live in {$city}.";
    }
}
```

### সারসংক্ষেপ:

1. **বেসিক প্যারামিটার**: `{param}` ফরম্যাটে রাউটে প্যারামিটার ডিফাইন করা হয়।
2. **অপশনাল প্যারামিটার**: `{param?}` ফরম্যাটে অপশনাল প্যারামিটার ডিফাইন করা হয়।
3. **ডিফল্ট মান**: কন্ট্রোলারে সরাসরি প্যারামিটারের ডিফল্ট মান নির্ধারণ করা যায়।
4. **একাধিক প্যারামিটার**: `/` চিহ্নের মাধ্যমে একাধিক প্যারামিটার পাঠানো যায় এবং কন্ট্রোলারে হ্যান্ডেল করা যায়।

## Laravel-এর রাউট প্যারামিটার ব্যবহার করে আপনি যেকোনো ডাইনামিক ইউআরএল-কে সহজেই হ্যান্ডেল করতে পারবেন, যা আপনার অ্যাপ্লিকেশনের ইন্টারঅ্যাকশনকে আরও ফ্লেক্সিবল এবং ডাইনামিক করে তোলে।

### আমার নিজের নোট

Laravel রাউটিং সিস্টেমে `Route::get('/hello/{name}/{age?}', [DemoController::class, 'DemoAction']);` এই স্ট্রাকচার অনুযায়ী URL এর মাধ্যমে ডাটা পাঠানোর জন্য আপনি কয়েকটি উপায়ে ডাটা রিসিভ করতে পারেন। এখানে `{name}` এবং `{age?}` হল রুট প্যারামিটার। `age?` প্রশ্নবোধক চিহ্ন থাকার কারণে ঐ প্যারামিটার ঐচ্ছিক (optional)। এখন, কিভাবে Laravel সেই ডাটা রিসিভ করতে পারে তা দেখানো হল:

### ১. ডিপেন্ডেন্সি ইনজেকশন দিয়ে রিসিভ করা

আপনি `DemoAction` মেথডে সরাসরি রুট প্যারামিটার হিসেবে `name` এবং `age` প্যারামিটার রিসিভ করতে পারেন:

```php
public function DemoAction($name, $age = null)
{
    return "Hello, " . $name . ". Your age is " . ($age ? $age : "not provided") . ".";
}
```

এখানে `$age = null` ব্যবহার করা হয়েছে কারণ এটি ঐচ্ছিক প্যারামিটার।

### ২. রিকোয়েস্ট অবজেক্ট দিয়ে রিসিভ করা

`Request` অবজেক্ট ব্যবহার করে আপনি সমস্ত রুট প্যারামিটার রিসিভ করতে পারেন:

```php
use Illuminate\Http\Request;

public function DemoAction(Request $request)
{
    $name = $request->route('name');
    $age = $request->route('age', 'not provided');

    return "Hello, " . $name . ". Your age is " . $age . ".";
}
```

এখানে `route()` মেথড ব্যবহার করে রুট প্যারামিটারগুলো অ্যাক্সেস করা হয়েছে।

### ৩. URL সেগমেন্ট ব্যবহার করে রিসিভ করা

Laravel এর `Request` ক্লাসের `segment()` মেথড ব্যবহার করে আপনি URL এর নির্দিষ্ট অংশ (segment) থেকে ডাটা নিতে পারেন:

```php
use Illuminate\Http\Request;

public function DemoAction(Request $request)
{
    $name = $request->segment(2);
    $age = $request->segment(3, 'not provided');

    return "Hello, " . $name . ". Your age is " . $age . ".";
}
```

এখানে `segment(2)` এবং `segment(3)` দিয়ে URL এর সেগমেন্ট থেকে ডাটা নেয়া হয়েছে।

### ৪. Route Modelling (Route Binding) দিয়ে রিসিভ করা

আপনি যদি কোন নির্দিষ্ট মডেলের সাথে প্যারামিটার বাইন্ড করেন, Laravel সেই মডেলের ইনস্ট্যান্স রিসিভ করবে:

```php
// Example of Model Binding (assuming User model)
Route::get('/user/{user}', [DemoController::class, 'DemoAction']);

// In the Controller
public function DemoAction(User $user)
{
    return "Hello, " . $user->name . ". Your age is " . $user->age . ".";
}
```

Laravel স্বয়ংক্রিয়ভাবে `{user}` প্যারামিটার থেকে `User` মডেল ইনস্ট্যান্স রিসিভ করবে।

### উপসংহার:

## Laravel এ আপনি ডাটা রিসিভ করতে পারেন সরাসরি প্যারামিটার পাস করে, `Request` অবজেক্ট ব্যবহার করে, সেগমেন্ট ব্যবহার করে, অথবা মডেল বাইন্ডিং এর মাধ্যমে।

`$name = $request->name;`
`$age = $request->age; এবাবে কি ভুল হবে।`
হ্যাঁ, এভাবে `$name = $request->name;` এবং `$age = $request->age;` লেখা হলে ভুল হবে যদি আপনি রুট প্যারামিটার থেকে ডাটা রিসিভ করতে চান। কারণ `$request->name` এবং `$request->age` সরাসরি ফর্ম ডেটা বা query string এর জন্য ব্যবহৃত হয়, রুট প্যারামিটার থেকে নয়।

রুট প্যারামিটার থেকে ডাটা রিসিভ করতে হলে আপনাকে `route()` মেথড ব্যবহার করতে হবে। সঠিকভাবে রিসিভ করার উপায় হবে:

```php
$name = $request->route('name');
$age = $request->route('age');
```

এভাবে, আপনি URL প্যারামিটার `{name}` এবং `{age}` সঠিকভাবে রিসিভ করতে পারবেন।

যদি `$request->name` এবং `$request->age` ব্যবহার করেন, তবে তা কাজ করবে শুধুমাত্র যখন ডেটা `POST` বা `GET` রিকোয়েস্টের মাধ্যমে ফর্ম বা query string হিসেবে পাঠানো হয়, যেমন:

-   **GET রিকোয়েস্ট:**

    ```
    /hello?name=John&age=25
    ```

-   **POST রিকোয়েস্ট:**
    ফর্ম ডেটা হিসেবে `name` এবং `age` পাঠালে।

## এজন্য যদি আপনার রুট প্যারামিটার থেকে ডাটা নিতে হয়, তাহলে `route()` মেথড সঠিক সমাধান।

আপনার কোডটি যদি সঠিকভাবে কাজ করে, তাহলে আপনি হয়তো `GET` রিকোয়েস্ট বা ফর্ম ডেটা পাঠিয়ে `$request->name` এবং `$request->age` রিসিভ করছেন। Laravel এ `$request->name` এবং `$request->age` কাজ করবে যদি ডেটা রিকোয়েস্ট বডি (form data বা query string) এর মাধ্যমে পাঠানো হয়।

তবে, আপনার রাউট `/hello/{name}/{age?}` অনুযায়ী, আপনি URL প্যারামিটার থেকে ডাটা রিসিভ করছেন না, বরং ফর্ম ডেটা বা query string থেকে রিসিভ করছেন। আপনি যদি URL প্যারামিটার থেকে সরাসরি ডাটা রিসিভ করতে চান, তাহলে `$request->route('name')` এবং `$request->route('age')` ব্যবহার করতে হবে।

যেমন:

### বর্তমান কোড কাজ করবে যদি:

আপনি URL এর মাধ্যমে এইভাবে `GET` রিকোয়েস্ট করেন:

```
/hello?name=John&age=25
```

এতে Laravel `$request->name` এবং `$request->age` এর মাধ্যমে query string থেকে ডাটা রিসিভ করবে। এটি তখন পুরোপুরি সঠিক হবে।

### URL প্যারামিটার থেকে ডাটা রিসিভ করার সঠিক পদ্ধতি:

যদি আপনি `/hello/{name}/{age?}` এর মাধ্যমে ডাটা পাঠাচ্ছেন, যেমন:

```
/hello/John/25
```

তাহলে আপনাকে `$request->route('name')` এবং `$request->route('age')` ব্যবহার করতে হবে, এইভাবে:

```php
function DemoAction(Request $request): string {
    $name = $request->route('name'); // রুট প্যারামিটার 'name' রিসিভ
    $age = $request->route('age');   // রুট প্যারামিটার 'age' রিসিভ
    return "My name is {$name} and my age is {$age}";
}
```

### উপসংহার:

-   **`$request->name` এবং `$request->age`**: ফর্ম ডেটা বা query string এর জন্য কাজ করবে।
-   **`$request->route('name')` এবং `$request->route('age')`**: রুট প্যারামিটার থেকে ডেটা রিসিভ করার সঠিক পদ্ধতি।

আপনার কোডের ভিত্তিতে, আপনি যদি query string ব্যবহার করে থাকেন, তা সঠিকভাবে কাজ করবে। কিন্তু URL প্যারামিটার থেকে ডাটা নিতে হলে, রাউটের `route()` মেথড ব্যবহার করা উচিত।

---

কুয়েরি সিট্রিং থেকে ডেটা রিসিভ।
লারাভেলে ইউআরএল (URL) থেকে কুয়েরি স্ট্রিং (query string) এর ডাটা রিসিভ করার বেশ কয়েকটি উপায় রয়েছে। আপনি বিভিন্ন পরিস্থিতিতে বিভিন্ন উপায় ব্যবহার করতে পারেন। নিচে কয়েকটি সাধারণ পদ্ধতি তুলে ধরা হলো:

### ১. `request()` হেল্পার ব্যবহার করে:

লারাভেলের বিল্ট-ইন `request()` হেল্পার ব্যবহার করে ইউআরএল কুয়েরি থেকে ডাটা রিসিভ করা যায়। এটি সবচেয়ে সহজ এবং প্রচলিত উপায়।

```php
// Get a single query parameter
$name = request('name'); // ?name=John

// Default value if not present
$name = request('name', 'Default Name');

// Get all query parameters
$allQueryParams = request()->all();
```

### ২. `Request` ফ্যাসাড ব্যবহার করে:

`Illuminate\Http\Request` ক্লাসের সাহায্যে আপনি কুয়েরি স্ট্রিং থেকে ডাটা রিসিভ করতে পারেন।

```php
use Illuminate\Http\Request;

public function index(Request $request)
{
    // Get a single query parameter
    $name = $request->query('name'); // ?name=John

    // Default value if not present
    $name = $request->query('name', 'Default Name');

    // Get all query parameters
    $allQueryParams = $request->query();
}
```

### ৩. `Input` ফ্যাসাড ব্যবহার করে:

পুরোনো ভার্সনে `Input` ফ্যাসাড ব্যবহার করা হতো, যদিও এটি পরবর্তীতে `request()` এর সাথে একীভূত হয়েছে।

```php
use Illuminate\Support\Facades\Input;

public function index()
{
    // Get a single query parameter
    $name = Input::get('name');

    // Default value if not present
    $name = Input::get('name', 'Default Name');
}
```

### ৪. ডাইরেক্ট ইউআরএল প্যারামিটারস (Route Parameters):

যদি ইউআরএল এ রাউট প্যারামিটার থাকে, তাহলে আপনি রাউটের মাধ্যমে সেই ডাটা রিসিভ করতে পারেন।

```php
Route::get('/user/{id}', function ($id) {
    return 'User '.$id;
});
```

### ৫. কুয়েরি স্ট্রিং দিয়ে ভ্যালিডেশন করা:

আপনি কুয়েরি স্ট্রিং এর ইনপুট ভ্যালিডেট করতে পারেন:

```php
public function index(Request $request)
{
    $validatedData = $request->validate([
        'name' => 'required|string|max:255',
    ]);
}
```

লারাভেলে ইউআরএল কুয়েরি স্ট্রিং থেকে ডাটা রিসিভ করার অনেক পদ্ধতি রয়েছে। নিচে আরও কিছু ভিন্ন পদ্ধতি ও কনসেপ্ট শেয়ার করা হলো:

### ৬. `has()` মেথড ব্যবহার করে চেক করা:

আপনি চেক করতে পারেন নির্দিষ্ট একটি কুয়েরি প্যারামিটার ইউআরএলে আছে কি না।

```php
public function index(Request $request)
{
    if ($request->has('name')) {
        $name = $request->query('name');
    }
}
```

### ৭. `filled()` মেথড ব্যবহার করে চেক করা:

যদি কোনো কুয়েরি প্যারামিটার "ফিল্ড" থাকে (অর্থাৎ, সেটি ইউআরএলে উপস্থিত এবং খালি নয়), তখন এই পদ্ধতি ব্যবহার করা হয়।

```php
public function index(Request $request)
{
    if ($request->filled('name')) {
        $name = $request->query('name');
    }
}
```

### ৮. ডিফল্ট কুয়েরি প্যারামিটার ডিফাইন করা:

লারাভেলের রিকোয়েস্ট অবজেক্টে কুয়েরি প্যারামিটারের জন্য ডিফল্ট ভ্যালু সরবরাহ করা যায়। যদি ইউজারের ইনপুটে প্যারামিটার উপস্থিত না থাকে তবে ডিফল্ট ভ্যালু ফিরিয়ে দিবে।

```php
$name = request()->query('name', 'Guest');
```

### ৯. কুয়েরি প্যারামিটার দিয়ে রুট গাইড করা:

লারাভেল রাউট ডেফিনিশনে `where` ক্লজ ব্যবহার করে নির্দিষ্ট প্যাটার্নের কুয়েরি প্যারামিটার ডিফাইন করা যায়।

```php
Route::get('/profile/{name}', function ($name) {
    return 'Profile: '.$name;
})->where('name', '[A-Za-z]+');
```

### ১০. ম্যানুয়ালি ইউআরএল থেকে প্যারামিটার এক্সট্রাক্ট করা:

আপনি চাইলে ম্যানুয়ালি `$_GET` সুপারগ্লোবাল ব্যবহার করতে পারেন। এটি PHP এর ডিফল্ট পদ্ধতি এবং লারাভেলের বাইরের পদ্ধতি।

```php
$name = $_GET['name'] ?? 'Guest';
```

### ১১. সেশনের মাধ্যমে ইউআরএল থেকে ডাটা রিসিভ করা:

যদি ইউআরএল থেকে প্রাপ্ত ডাটাকে পরে পুনরায় ব্যবহার করতে হয়, তবে তা সেশনে সংরক্ষণ করা যেতে পারে।

```php
public function index(Request $request)
{
    session(['name' => $request->query('name')]);
}
```

### ১২. কাস্টম কনস্ট্রেইন ব্যবহার করে:

আপনি যদি চান, কাস্টম লজিক বা কন্ডিশন অ্যাপ্লাই করতে পারেন কুয়েরি প্যারামিটারের উপর।

```php
Route::get('/user/{id}', function ($id) {
    return 'User '.$id;
})->whereNumber('id');
```

### ১৩. রুট সার্ভিস প্রোভাইডারের মাধ্যমে রাউট ফিল্টারিং:

লারাভেল আপনাকে রুট সার্ভিস প্রোভাইডারের মাধ্যমে রাউটের কুয়েরি প্যারামিটার কাস্টমাইজ করার সুযোগ দেয়।

```php
Route::get('/user/{id}', function ($id) {
    return 'User '.$id;
})->middleware('customFilter');
```

### ১৪. `merge()` মেথড ব্যবহার করে ইনপুট ম্যানিপুলেট করা:

আপনি যদি ইনপুট ডাটার উপর কাস্টম পরিবর্তন করতে চান, তাহলে `merge()` মেথড ব্যবহার করতে পারেন।

```php
$request->merge(['name' => 'John Doe']);
```

### ১৫. `replace()` মেথড ব্যবহার করা:

পুরো কুয়েরি ডাটাকে একবারে রিপ্লেস করার জন্য `replace()` মেথড ব্যবহার করা যায়।

```php
$request->replace(['name' => 'Replaced Name']);
```

### ১৬. `json()` কুয়েরি প্যারামিটার দিয়ে JSON ফরম্যাটে রিসিভ করা:

কখনো কখনো কুয়েরি প্যারামিটার JSON আকারে আসে, সেটি প্রসেস করতে `json()` মেথড ব্যবহার করা যেতে পারে।

```php
$jsonData = $request->query('data');
$arrayData = json_decode($jsonData, true);
```

### ১৭. `route()` মেথড দিয়ে রাউট প্যারামিটার থেকে ডাটা পাওয়া:

`route()` মেথডের মাধ্যমে আপনি রাউট প্যারামিটারকে সরাসরি ব্যবহার করতে পারেন।

```php
$name = route('profile', ['name' => 'John']);
```

### ১৮. কাস্টম ইউআরএল জেনারেটর দিয়ে:

লারাভেলের কাস্টম URL জেনারেটর ব্যবহার করে URL তৈরি ও পরিচালনা করা সম্ভব।

```php
$url = url()->current() . '?name=John';
```

এভাবে, লারাভেলে কুয়েরি স্ট্রিং থেকে ডাটা রিসিভ করার নানা উপায় আছে যা নির্ভর করে আপনার অ্যাপ্লিকেশনের কাঠামো এবং প্রয়োজনের উপর।

### সংক্ষেপে:

-   **request('param')** বা **$request->query('param')** ব্যবহার করে নির্দিষ্ট কুয়েরি স্ট্রিং রিসিভ করা যায়।
-   **$request->query()** বা **request()->all()** দিয়ে সব কুয়েরি স্ট্রিং এর ডাটা রিসিভ করা যায়।

আপনার প্রয়োজনে বা কনভেনশন অনুযায়ী যেকোনো একটি পদ্ধতি ব্যবহার করতে পারেন।

## বাস্তব উদাহরণ

যখন আমরা বাস্তবে কাজ করি, তখন ইউজারকে অবশ্যই কোনভাবে জানাতে হবে কিভাবে তারা ডাটা পাঠাবে বা রিকোয়েস্ট করবে। সাধারণত এটি UI (User Interface) বা API ডকুমেন্টেশনের মাধ্যমে ইউজারদেরকে জানানো হয়। কিন্তু এখানে মূল প্রশ্ন হল, কিভাবে আমরা ডাইনামিক URL এবং Query String তৈরি করতে পারি যাতে ইউজার স্বয়ংক্রিয়ভাবে রিকোয়েস্ট করতে পারে।

Laravel এ এই কাজগুলো করার জন্য আমরা সাধারণত ফর্ম (যদি ফ্রন্ট-এন্ড থাকে) বা লিংক তৈরি করতে পারি। নিচে দুটি বড় উদাহরণ দিয়ে দেখানো হলো:

---

### উদাহরণ ১: ডাইনামিক URL এর মাধ্যমে ডাটা পাঠানো

ধরা যাক আপনি একটি প্রোফাইল পেজ তৈরি করতে চান যেখানে প্রতিটি ইউজারের `id`, `name`, এবং `age` পাঠানো হবে এবং এই ডাটাগুলো ডাইনামিক্যালি URL এর মধ্যে থাকবে। Laravel এ সাধারণত এভাবে রুট ডিফাইন করা হয়:

```php
// Route
Route::get('/profile/{id}/{name}/{age}', [ProfileController::class, 'show']);
```

#### কন্ট্রোলার:

এই রুটে আমরা `ProfileController` এ `show` মেথড ব্যবহার করে ডাটা রিসিভ করব:

```php
// ProfileController
public function show($id, $name, $age)
{
    return "User ID: $id, Name: $name, Age: $age";
}
```

#### ডাইনামিক URL তৈরির জন্য Blade টেমপ্লেট (UI):

যদি এটি একটি ফ্রন্ট-এন্ড অ্যাপ্লিকেশন হয় যেখানে Blade টেমপ্লেট ব্যবহার করা হচ্ছে, তাহলে আপনি ডাইনামিক URL তৈরি করতে পারেন নিচের মতো:

```blade
<a href="{{ url('/profile/' . $user->id . '/' . $user->name . '/' . $user->age) }}">View Profile</a>
```

এটি স্বয়ংক্রিয়ভাবে নিচের মতো URL তৈরি করবে:

```
/profile/101/John/25
```

যেখানে:

-   `101` হলো ইউজারের আইডি,
-   `John` হলো ইউজারের নাম,
-   `25` হলো ইউজারের বয়স।

#### URL জেনারেটর ব্যবহার:

Laravel এ `route()` মেথড দিয়ে আরও ভালোভাবে URL জেনারেট করতে পারেন, যেখানে আপনি যদি রুটের নাম দিয়ে থাকেন, তাহলে সহজেই প্যারামিটার পাস করতে পারেন:

```php
// Route
Route::get('/profile/{id}/{name}/{age}', [ProfileController::class, 'show'])->name('profile.show');

// Blade Template
<a href="{{ route('profile.show', ['id' => $user->id, 'name' => $user->name, 'age' => $user->age]) }}">View Profile</a>
```

এটি একইভাবে ডাইনামিক URL তৈরি করবে, তবে এই পদ্ধতিতে Laravel এর Route জেনারেটরের সুবিধা ব্যবহার করা যায়।

---

### উদাহরণ ২: Query String এর মাধ্যমে ডাটা পাঠানো

Laravel এ Query String এর মাধ্যমে ডাটা পাঠাতে আপনি URL এর সাথে key-value জোড়া যুক্ত করতে পারেন। যেমন `/profile?id=101&name=John&age=25`।

#### রুট ডিফাইন করা:

এক্ষেত্রে রুটে কোনো প্যারামিটার নির্দিষ্ট না করেও আপনি Query String ব্যবহার করতে পারেন:

```php
// Route
Route::get('/profile', [ProfileController::class, 'show']);
```

#### কন্ট্রোলারে Query String ডাটা রিসিভ করা:

এখন `ProfileController` এর `show` মেথডে আমরা `Request` অবজেক্ট ব্যবহার করে Query String ডাটা রিসিভ করব:

```php
use Illuminate\Http\Request;

public function show(Request $request)
{
    $id = $request->query('id');
    $name = $request->query('name');
    $age = $request->query('age');

    return "User ID: $id, Name: $name, Age: $age";
}
```

#### Query String তৈরি করার জন্য Blade টেমপ্লেট:

Blade টেমপ্লেট ব্যবহার করে আপনি সহজেই Query String যুক্ত URL তৈরি করতে পারেন:

```blade
<a href="{{ url('/profile') . '?id=' . $user->id . '&name=' . $user->name . '&age=' . $user->age }}">View Profile</a>
```

এটি স্বয়ংক্রিয়ভাবে নিচের মতো URL তৈরি করবে:

```
/profile?id=101&name=John&age=25
```

#### Query String এর জন্য Route জেনারেটর ব্যবহার:

Laravel এ `route()` মেথড ব্যবহার করে Query String জেনারেট করতে পারেন:

```php
<a href="{{ route('profile.show', ['id' => $user->id, 'name' => $user->name, 'age' => $user->age]) }}">View Profile</a>
```

যেখানে রুটটি হবে:

```php
Route::get('/profile', [ProfileController::class, 'show'])->name('profile.show');
```

এটি Query String সমৃদ্ধ একটি URL তৈরি করবে:

```
/profile?id=101&name=John&age=25
```

---

### উদাহরণ ৩: Form এর মাধ্যমে ডাইনামিক ডাটা পাঠানো

যদি ব্যবহারকারীকে একটি ফর্ম ফিল-আপ করার জন্য বলার প্রয়োজন হয়, আপনি HTML ফর্ম ব্যবহার করে ডাটা পেতে পারেন এবং তা URL প্যারামিটার হিসেবে বা Query String হিসেবে পাস করতে পারেন।

#### Blade টেমপ্লেটে ফর্ম:

```blade
<form action="{{ url('/profile') }}" method="GET">
    <input type="text" name="id" placeholder="Enter ID">
    <input type="text" name="name" placeholder="Enter Name">
    <input type="text" name="age" placeholder="Enter Age">
    <button type="submit">Submit</button>
</form>
```

এটি স্বয়ংক্রিয়ভাবে `GET` রিকোয়েস্ট পাঠাবে যেখানে Query String ব্যবহার করা হবে:

```
/profile?id=101&name=John&age=25
```

কন্ট্রোলারে এটি রিসিভ করার জন্য আগের মতোই `Request` অবজেক্ট ব্যবহার করা হবে।

---

### উপসংহার:

1. ডাইনামিক URL এর ক্ষেত্রে `Route::get('/profile/{id}/{name}/{age}')` টাইপের URL তৈরি করতে আমরা Blade টেমপ্লেটের মধ্যে ডাইনামিক রুট ব্যবহার করতে পারি।
2. Query String এর ক্ষেত্রে `/profile?id=101&name=John&age=25` এর মতো URL তৈরি করার জন্য আমরা সরাসরি Blade এ Query String যুক্ত করতে পারি বা Route জেনারেটরের সুবিধা নিতে পারি।

## এভাবে Laravel এ ডাইনামিক URL এবং Query String ব্যবহার করে বিভিন্ন পদ্ধতিতে ডাটা পাঠানো এবং রিসিভ করা যায়।

নিশ্চয়ই, আমি দুটি বড় উদাহরণ সহ Blade টেমপ্লেট তৈরি করে দিচ্ছি যেখানে একটিতে ডাইনামিক URL প্যারামিটার ব্যবহার করা হবে এবং অন্যটিতে Query String ব্যবহার করা হবে।

#### ১. **Blade টেমপ্লেট: ডাইনামিক URL প্যারামিটার দিয়ে ডাটা পাঠানোর জন্য**

এখানে আমরা একটি ইউজারের তালিকা দেখাবো এবং প্রতিটি ইউজারের জন্য ডাইনামিক URL প্যারামিটার যুক্ত লিঙ্ক থাকবে। প্রতিটি ইউজারের `id`, `name`, এবং `age` প্যারামিটার URL এর অংশ হিসেবে পাঠানো হবে।

```blade
{{-- resources/views/user_list.blade.php --}}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List with Dynamic URL</title>
</head>
<body>
    <h1>User List</h1>

    <table border="1" cellpadding="10" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Profile Link</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($users as $user)
            <tr>
                <td>{{ $user->id }}</td>
                <td>{{ $user->name }}</td>
                <td>{{ $user->age }}</td>
                <td>
                    {{-- Dynamic URL for each user --}}
                    <a href="{{ url('/profile/' . $user->id . '/' . $user->name . '/' . $user->age) }}">
                        View Profile
                    </a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

</body>
</html>
```

#### কন্ট্রোলার কোড:

```php
// ProfileController.php
public function index()
{
    $users = [
        (object) ['id' => 101, 'name' => 'John Doe', 'age' => 25],
        (object) ['id' => 102, 'name' => 'Jane Smith', 'age' => 30],
        (object) ['id' => 103, 'name' => 'Peter Parker', 'age' => 22],
    ];

    return view('user_list', ['users' => $users]);
}
```

এই Blade টেমপ্লেটটি `GET /profile/{id}/{name}/{age}` ফরম্যাটে ডাইনামিক URL তৈরি করবে এবং ইউজারের প্রোফাইলের তথ্য দেখাবে। যেমন:

-   `/profile/101/John%20Doe/25`
-   `/profile/102/Jane%20Smith/30`

---

#### ২. **Blade টেমপ্লেট: Query String ব্যবহার করে ডাটা পাঠানোর জন্য**

এখানে আমরা একটি ফর্ম ব্যবহার করব যেখানে ইউজার `id`, `name`, এবং `age` ইনপুট দিয়ে Query String এর মাধ্যমে ডাটা পাঠাবে।

```blade
{{-- resources/views/search_user.blade.php --}}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search User with Query String</title>
</head>
<body>
    <h1>Search User</h1>

    {{-- Form to send query string --}}
    <form action="{{ url('/profile') }}" method="GET">
        <label for="id">User ID:</label><br>
        <input type="text" id="id" name="id" placeholder="Enter User ID" required><br><br>

        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" placeholder="Enter User Name" required><br><br>

        <label for="age">Age:</label><br>
        <input type="text" id="age" name="age" placeholder="Enter User Age" required><br><br>

        <button type="submit">Search User</button>
    </form>

    {{-- Display the searched user details --}}
    @if(isset($id) && isset($name) && isset($age))
    <h2>Search Result</h2>
    <p><strong>User ID:</strong> {{ $id }}</p>
    <p><strong>Name:</strong> {{ $name }}</p>
    <p><strong>Age:</strong> {{ $age }}</p>
    @endif

</body>
</html>
```

#### কন্ট্রোলার কোড:

```php
// ProfileController.php
use Illuminate\Http\Request;

public function show(Request $request)
{
    $id = $request->query('id');
    $name = $request->query('name');
    $age = $request->query('age');

    return view('search_user', compact('id', 'name', 'age'));
}
```

এটি একটি ফর্ম ব্যবহার করে `/profile` এ `GET` রিকোয়েস্ট পাঠাবে। Query String এর মাধ্যমে ইউজারের তথ্য পাঠানো হবে যেমন:

-   `/profile?id=101&name=John%20Doe&age=25`

Query String রিকোয়েস্টটি কন্ট্রোলার প্রোসেস করবে এবং ফর্মের নিচে সার্চের রেজাল্ট দেখাবে।

---

### উপসংহার:

1. **ডাইনামিক URL প্যারামিটার**: প্রথম উদাহরণে আমরা একটি ইউজারের তালিকা দেখিয়েছি যেখানে প্রতিটি ইউজারের জন্য একটি ডাইনামিক URL তৈরি করা হয়েছে। এতে `GET /profile/{id}/{name}/{age}` ফরম্যাটে URL প্যারামিটার পাঠানো হয়েছে।

2. **Query String**: দ্বিতীয় উদাহরণে একটি ফর্ম ব্যবহার করে ইউজার `id`, `name`, এবং `age` ইনপুট দিয়ে Query String (`/profile?id=101&name=John&age=25`) হিসেবে ডাটা পাঠিয়েছে এবং সেই ডাটার ভিত্তিতে সার্চের রেজাল্ট দেখানো হয়েছে।

এই দুটি উদাহরণ বাস্তব ক্ষেত্রে Laravel এ URL এবং Query String ডাটা পাঠানোর সুন্দর উপায়।
