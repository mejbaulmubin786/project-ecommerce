Laravel-এ কুয়েরি স্ট্রিং রিসিভ করার অনেকগুলো পদ্ধতি আছে, এবং প্রতিটি পদ্ধতি ভিন্ন পরিস্থিতিতে কার্যকর হতে পারে। নিচে সবগুলো পদ্ধতি একসাথে তালিকাভুক্ত করা হলো এবং প্রতিটি পদ্ধতির সুবিধা-অসুবিধা সহ কখন কোনটি ব্যবহার করা উচিত তা ব্যাখ্যা করা হলো:

---

### ১. **Request Object এর `query()` এবং `input()` মেথড ব্যবহার করে**

**ব্যবহার:** সাধারণভাবে কুয়েরি স্ট্রিং রিসিভ করতে সবচেয়ে সহজ পদ্ধতি।

**উদাহরণ:**

```php
use Illuminate\Http\Request;

Route::get('/search', function (Request $request) {
    $keyword = $request->query('keyword');
    return "Search Keyword: $keyword";
});
```

**সুবিধা:**

-   সহজ এবং ক্লিন।
-   শুধুমাত্র নির্দিষ্ট কুয়েরি প্যারামিটার নিতে উপযুক্ত।

**অসুবিধা:**

-   কমপ্লেক্স ডেটা হ্যান্ডলিং এর জন্য যথেষ্ট নয়।

---

### ২. **Request Object এর `all()` মেথড ব্যবহার করে**

**ব্যবহার:** যখন একাধিক কুয়েরি স্ট্রিং প্যারামিটার একসাথে রিসিভ করতে হবে।

**উদাহরণ:**

```php
use Illuminate\Http\Request;

Route::get('/search', function (Request $request) {
    $params = $request->all();
    return $params; // সব কুয়েরি প্যারামিটার রিসিভ হবে
});
```

**সুবিধা:**

-   একাধিক কুয়েরি প্যারামিটার একসাথে রিসিভ করা যায়।
-   পুরো রিকোয়েস্টের সব ডেটা পাওয়া যায়।

**অসুবিধা:**

-   কখনও কখনও অতিরিক্ত ডেটা প্রয়োজনের বাইরে চলে আসতে পারে।

---

### ৩. **Request Object এর `has()` মেথড ব্যবহার করে**

**ব্যবহার:** যদি কুয়েরি স্ট্রিং এর কোনো নির্দিষ্ট প্যারামিটার আছে কিনা তা যাচাই করতে হয়।

**উদাহরণ:**

```php
use Illuminate\Http\Request;

Route::get('/search', function (Request $request) {
    if ($request->has('keyword')) {
        return "Keyword exists in query!";
    } else {
        return "No keyword in query.";
    }
});
```

**সুবিধা:**

-   প্যারামিটার উপস্থিতি যাচাই করার জন্য কার্যকর।
-   সহজ এবং ক্লিন কোড।

**অসুবিধা:**

-   শুধুমাত্র প্যারামিটার উপস্থিতি যাচাই করার জন্য সীমাবদ্ধ।

---

### ৪. **Request Object এর `filled()` মেথড ব্যবহার করে**

**ব্যবহার:** যখন যাচাই করতে হবে যে কোনো কুয়েরি স্ট্রিং প্যারামিটার ভ্যালু সহ পাঠানো হয়েছে কিনা।

**উদাহরণ:**

```php
use Illuminate\Http\Request;

Route::get('/search', function (Request $request) {
    if ($request->filled('keyword')) {
        return "Keyword has value.";
    } else {
        return "Keyword is empty or not present.";
    }
});
```

**সুবিধা:**

-   সহজে যাচাই করা যায় যে প্যারামিটার ফাঁকা না।

**অসুবিধা:**

-   শুধুমাত্র ভ্যালু চেক করার জন্য ব্যবহৃত হয়।

---

### ৫. **Request Object এর `query()` মেথডের ডিফল্ট ভ্যালু সেট করা**

**ব্যবহার:** যখন একটি কুয়েরি প্যারামিটার না থাকলে ডিফল্ট ভ্যালু সেট করতে হবে।

**উদাহরণ:**

```php
use Illuminate\Http\Request;

Route::get('/search', function (Request $request) {
    $keyword = $request->query('keyword', 'defaultKeyword');
    return "Keyword: $keyword";
});
```

**সুবিধা:**

-   ডিফল্ট ভ্যালু দিয়ে ডেটা হ্যান্ডলিং সহজ।
-   প্যারামিটার না থাকলে ফ্যালব্যাক ডেটা পাওয়া যায়।

**অসুবিধা:**

-   শুধুমাত্র ডিফল্ট ভ্যালু ব্যবহারের ক্ষেত্রে সীমাবদ্ধ।

---

### ৬. **Request Facade ব্যবহার করে**

**ব্যবহার:** Laravel Facades ব্যবহার করে কুয়েরি স্ট্রিং রিসিভ করতে হয়। এটি ব্যবহার করতে `Request` ক্লাস ডিরেক্টলি অ্যাক্সেস করা হয়।

**উদাহরণ:**

```php
use Illuminate\Support\Facades\Request;

Route::get('/search', function () {
    $keyword = Request::query('keyword');
    return "Keyword: $keyword";
});
```

**সুবিধা:**

-   সরাসরি Facade দিয়ে অ্যাক্সেস করা যায়।
-   কোড অনেক ছোট হয়ে যায়।

**অসুবিধা:**

-   Facade নির্ভর করে, যা কখনও readability কমাতে পারে।

---

### ৭. **Route::current()->parameter() মেথড ব্যবহার করে**

**ব্যবহার:** যদি রাউটের কুয়েরি স্ট্রিং এর প্যারামিটার রিসিভ করতে হয়।

**উদাহরণ:**

```php
use Illuminate\Support\Facades\Route;

Route::get('/search', function () {
    $keyword = Route::current()->parameter('keyword');
    return "Keyword: $keyword";
});
```

**সুবিধা:**

-   রাউট কুয়েরি প্যারামিটার সরাসরি রিসিভ করা যায়।

**অসুবিধা:**

-   সরাসরি ইনজেকশন এর মতো সহজ নয়।

---

### ৮. **URL::full() এবং URL::previous() মেথড ব্যবহার করে**

**ব্যবহার:** যখন পূর্ণ URL অথবা পূর্ববর্তী পেজের URL সহ কুয়েরি স্ট্রিং দরকার হয়।

**উদাহরণ:**

```php
use Illuminate\Support\Facades\URL;

Route::get('/search', function () {
    $fullUrl = URL::full();
    $previousUrl = URL::previous();
    return "Full URL: $fullUrl, Previous URL: $previousUrl";
});
```

**সুবিধা:**

-   পুরো URL সহ কুয়েরি স্ট্রিং রিসিভ করা যায়।
-   পূর্ববর্তী পেজের URL অ্যাক্সেস করার সুবিধা।

**অসুবিধা:**

-   শুধুমাত্র URL সংক্রান্ত কাজের জন্য সীমাবদ্ধ।

---

### **সারাংশ:**

| পদ্ধতি                       | সুবিধা                      | অসুবিধা                   | কখন ব্যবহার করবেন                          |
| ---------------------------- | --------------------------- | ------------------------- | ------------------------------------------ |
| **Request::query()/input()** | সরাসরি প্যারামিটার রিসিভ    | কমপ্লেক্স কাজের জন্য নয়  | সাধারণ কুয়েরি প্যারামিটার রিসিভ            |
| **Request::all()**           | একাধিক প্যারামিটার রিসিভ    | সব ডেটা চলে আসে           | একাধিক প্যারামিটার হ্যান্ডল করার সময়      |
| **Request::has()**           | উপস্থিতি যাচাই সহজ          | শুধু প্রেজেন্স চেক        | প্যারামিটার আছে কিনা দেখতে                 |
| **Request::filled()**        | ফাঁকা চেক সহজ               | শুধু ফাঁকা চেক            | ভ্যালু চেক করতে                            |
| **Request::query(ডিফল্ট)**   | ডিফল্ট ভ্যালু সহজ           | সীমিত                     | প্যারামিটার না থাকলে ডিফল্ট ভ্যালু ব্যবহার |
| **Request Facade**           | কোড ছোট হয়                 | readability কমে যেতে পারে | Facade পছন্দ হলে                           |
| **Route::current()**         | রাউট থেকে সরাসরি অ্যাক্সেস  | ইনজেকশনের মতো সহজ নয়     | রাউট কুয়েরি রিসিভ                          |
| **URL::full()/previous()**   | পুরো URL এবং পূর্ববর্তী URL | সীমাবদ্ধ                  | URL সম্পর্কিত কাজের জন্য                   |

এভাবে আপনি Laravel-এর কুয়েরি স্ট্রিং রিসিভ করার পদ্ধতি বেছে নিতে পারেন।

Laravel-এ কুয়েরি স্ট্রিং হ্যান্ডেল করার জন্য বিভিন্ন পদ্ধতি রয়েছে, যা আপনাকে URL এর শেষে থাকা কুয়েরি প্যারামিটারগুলি (`?key=value`) রিসিভ এবং ব্যবহার করতে দেয়। নিচে Laravel-এ কুয়েরি স্ট্রিং হ্যান্ডেল করার পদ্ধতি এবং প্রতিটি পদ্ধতির সুবিধা, অসুবিধা, এবং উদাহরণ দেওয়া হলো:

### ১. **Request Object দিয়ে Query String রিসিভ করা**

**ব্যবহার:** কুয়েরি স্ট্রিং প্যারামিটারগুলো `Request` ক্লাসের মাধ্যমে সহজেই রিসিভ করা যায়।

**উদাহরণ:**

```php
use Illuminate\Http\Request;

Route::get('/search', function (Request $request) {
    $query = $request->query('q'); // 'q' কুয়েরি প্যারামিটার রিসিভ
    return "You searched for: $query";
});
```

**URL উদাহরণ:**  
`https://www.example.com/search?q=laravel`

**সুবিধা:**

-   সহজ এবং ক্লিন।
-   কুয়েরি প্যারামিটার না থাকলে ডিফল্ট ভ্যালু সেট করা যায়।

**অসুবিধা:**

-   শুধুমাত্র কুয়েরি স্ট্রিং প্যারামিটার ব্যবহারের জন্য।

---

### ২. **`request()->query()` ফাংশন ব্যবহার করে**

**ব্যবহার:** কুয়েরি স্ট্রিং সরাসরি `request()` হেল্পার ফাংশন ব্যবহার করে রিসিভ করা যায়।

**উদাহরণ:**

```php
Route::get('/search', function () {
    $query = request()->query('q'); // 'q' প্যারামিটারটি রিসিভ
    return "You searched for: $query";
});
```

**সুবিধা:**

-   Laravel এর `request()` ফাংশন ব্যবহার করে ছোট কোডে রিসিভ করা যায়।

**অসুবিধা:**

-   বড় রিকোয়েস্ট হ্যান্ডেল করার ক্ষেত্রে পুরো `Request` ক্লাসের তুলনায় কম ফ্লেক্সিবল।

---

### ৩. **Query String থেকে সব প্যারামিটার একসাথে রিসিভ করা**

**ব্যবহার:** একাধিক কুয়েরি প্যারামিটার একসাথে রিসিভ করতে চাইলে `all()` মেথড ব্যবহার করা যায়।

**উদাহরণ:**

```php
Route::get('/search', function (Request $request) {
    $queryParams = $request->query(); // সব কুয়েরি প্যারামিটার রিসিভ
    return $queryParams; // কুয়েরি প্যারামিটারগুলোকে JSON আকারে দেখাবে
});
```

**URL উদাহরণ:**  
`https://www.example.com/search?q=laravel&category=php`

**সুবিধা:**

-   সব কুয়েরি প্যারামিটার একসাথে অ্যারে হিসেবে পাওয়া যায়।

**অসুবিধা:**

-   নির্দিষ্ট প্যারামিটার এক্সেস করতে হলে ম্যানুয়ালি খুঁজতে হবে।

---

### ৪. **Query String থেকে ডিফল্ট ভ্যালু সেট করা**

**ব্যবহার:** কোনো কুয়েরি প্যারামিটার অনুপস্থিত থাকলে ডিফল্ট ভ্যালু দিয়ে সেট করা যায়।

**উদাহরণ:**

```php
Route::get('/search', function (Request $request) {
    $query = $request->query('q', 'default value'); // যদি 'q' না থাকে, তাহলে 'default value'
    return "You searched for: $query";
});
```

**সুবিধা:**

-   কুয়েরি প্যারামিটার না থাকলে ডিফল্ট ভ্যালু রিটার্ন করে।

**অসুবিধা:**

-   ডিফল্ট ভ্যালু সব সময় ব্যবহার উপযুক্ত নাও হতে পারে।

---

### ৫. **Query String প্যারামিটার যাচাই করা (has method)**

**ব্যবহার:** যদি কোনো নির্দিষ্ট কুয়েরি প্যারামিটার আছে কিনা তা যাচাই করতে চান, তাহলে `has()` মেথড ব্যবহার করা যায়।

**উদাহরণ:**

```php
Route::get('/search', function (Request $request) {
    if ($request->has('q')) {
        return "You searched for: " . $request->query('q');
    } else {
        return "No search query provided.";
    }
});
```

**সুবিধা:**

-   ডাটা থাকলে কুয়েরি প্যারামিটার প্রোসেস করা যায়।

**অসুবিধা:**

-   `has()` শুধু চেক করে ডাটা আছে কিনা, ডেটার মান বা টাইপ যাচাই করে না।

---

### ৬. **Middleware এর মাধ্যমে Query String হ্যান্ডেল করা**

**ব্যবহার:** কুয়েরি প্যারামিটারগুলো যাচাই বা পরিবর্তন করার জন্য Middleware ব্যবহার করা যেতে পারে।

**উদাহরণ:**

```php
public function handle($request, Closure $next)
{
    if (!$request->has('q')) {
        return redirect('/search'); // যদি 'q' প্যারামিটার না থাকে
    }

    return $next($request);
}
```

**সুবিধা:**

-   কুয়েরি প্যারামিটার যাচাই ও যাচাই-বাছাই করা যায়।

**অসুবিধা:**

-   ছোট কাজের জন্য ওভারকিল হতে পারে।

---

### **সারাংশ**

| পদ্ধতি                 | সুবিধা                             | অসুবিধা                                  | কখন ব্যবহার করবেন                    |
| ---------------------- | ---------------------------------- | ---------------------------------------- | ------------------------------------ |
| **Request Object**     | ক্লিন এবং সহজ                      | শুধুমাত্র কুয়েরি স্ট্রিং ব্যবহারের জন্য | যখন HTTP রিকোয়েস্টে আরও ডাটা লাগে   |
| **request()->query()** | সরাসরি অ্যাক্সেস                   | কম ফ্লেক্সিবল                            | ছোট কাজের জন্য উপযুক্ত               |
| **all() Method**       | সব প্যারামিটার একসাথে              | নির্দিষ্ট প্যারামিটার খুঁজতে হবে         | একাধিক প্যারামিটার হ্যান্ডেল করতে    |
| **ডিফল্ট ভ্যালু**      | প্যারামিটার না থাকলে ডিফল্ট ভ্যালু | সব সময় প্রয়োজন হয় না                  | অনুপস্থিত প্যারামিটার হ্যান্ডেল করতে |
| **has() Method**       | প্যারামিটার আছে কিনা যাচাই         | মান যাচাই করা যায় না                    | প্যারামিটার উপস্থিতি যাচাই করতে      |
| **Middleware**         | যাচাই এবং প্রি-প্রসেস              | ওভারকিল হতে পারে                         | ভ্যালিডেশন বা শর্ত আরোপ করতে         |

Laravel-এর এই বিভিন্ন পদ্ধতি ব্যবহার করে আপনি সহজেই কুয়েরি স্ট্রিং প্যারামিটার হ্যান্ডেল করতে পারেন।

এখানে Laravel-এ কুয়েরি স্ট্রিং ব্যবহারের জন্য কিছু উদাহরণ দেওয়া হলো:

### ১. **Request Object দিয়ে কুয়েরি স্ট্রিং হ্যান্ডেল করা**

**রাউট এবং কন্ট্রোলার কোড:**

```php
use Illuminate\Http\Request;

Route::get('/search', function (Request $request) {
    // 'q' প্যারামিটারটি রিসিভ করা
    $query = $request->query('q');

    // যদি প্যারামিটার থাকে, তাহলে এটি দেখানো হবে
    if ($query) {
        return "You searched for: $query";
    } else {
        return "No search query provided.";
    }
});
```

**URL উদাহরণ:**  
`https://www.example.com/search?q=laravel`

**আউটপুট:**  
`You searched for: laravel`

---

### ২. **request()->query() ফাংশন দিয়ে কুয়েরি স্ট্রিং হ্যান্ডেল করা**

**রাউট এবং কন্ট্রোলার কোড:**

```php
Route::get('/search', function () {
    // 'q' প্যারামিটার রিসিভ
    $query = request()->query('q');

    // প্যারামিটার থাকা বা না থাকার ভিত্তিতে আউটপুট
    if ($query) {
        return "You searched for: $query";
    } else {
        return "No search query provided.";
    }
});
```

**URL উদাহরণ:**  
`https://www.example.com/search?q=laravel`

**আউটপুট:**  
`You searched for: laravel`

---

### ৩. **ডিফল্ট ভ্যালু সহ কুয়েরি স্ট্রিং হ্যান্ডেল করা**

**রাউট এবং কন্ট্রোলার কোড:**

```php
use Illuminate\Http\Request;

Route::get('/search', function (Request $request) {
    // যদি 'q' প্যারামিটার না থাকে, তাহলে ডিফল্ট ভ্যালু 'default value' সেট করা হবে
    $query = $request->query('q', 'default value');

    return "You searched for: $query";
});
```

**URL উদাহরণ:**  
১. `https://www.example.com/search?q=laravel`

-   **আউটপুট:** `You searched for: laravel`

২. `https://www.example.com/search`

-   **আউটপুট:** `You searched for: default value`

---

### ৪. **সব কুয়েরি প্যারামিটার একসাথে রিসিভ করা**

**রাউট এবং কন্ট্রোলার কোড:**

```php
use Illuminate\Http\Request;

Route::get('/search', function (Request $request) {
    // সব কুয়েরি প্যারামিটার রিসিভ করা
    $queryParams = $request->query();

    // JSON আকারে আউটপুট
    return response()->json($queryParams);
});
```

**URL উদাহরণ:**  
`https://www.example.com/search?q=laravel&category=php`

**আউটপুট:**

```json
{
    "q": "laravel",
    "category": "php"
}
```

---

### ৫. **has() মেথড দিয়ে কুয়েরি স্ট্রিং যাচাই করা**

**রাউট এবং কন্ট্রোলার কোড:**

```php
use Illuminate\Http\Request;

Route::get('/search', function (Request $request) {
    // চেক করা হচ্ছে 'q' প্যারামিটার আছে কিনা
    if ($request->has('q')) {
        return "You searched for: " . $request->query('q');
    } else {
        return "No search query provided.";
    }
});
```

**URL উদাহরণ:**  
১. `https://www.example.com/search?q=laravel`

-   **আউটপুট:** `You searched for: laravel`

২. `https://www.example.com/search`

-   **আউটপুট:** `No search query provided.`

---

এই উদাহরণগুলোতে Laravel-এর বিভিন্ন পদ্ধতি ব্যবহার করে কুয়েরি স্ট্রিং কীভাবে হ্যান্ডেল করতে হয়, তা দেখানো হয়েছে।
