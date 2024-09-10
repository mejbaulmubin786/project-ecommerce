### Laravel Routes: `api.php` এবং `web.php` এর ব্যাখ্যা

Laravel ফ্রেমওয়ার্কটি MVC (Model-View-Controller) আর্কিটেকচারের উপর ভিত্তি করে তৈরি হয়েছে এবং এতে রুটিং সিস্টেম অত্যন্ত গুরুত্বপূর্ণ ভূমিকা পালন করে। Laravel এ, `routes` ফোল্ডারে বিভিন্ন রুট সংক্রান্ত ফাইল থাকে, যেমন: `web.php`, `api.php`, `console.php`, এবং `channels.php`। তবে, সাধারণত `web.php` এবং `api.php` ফাইল দুটি সবচেয়ে বেশি ব্যবহৃত হয়।

#### ১. `web.php`: Web Routes

`web.php` ফাইলটি Laravel এর web application এর জন্য ব্যবহৃত রুটগুলো ধারণ করে। এই ফাইলের রুটগুলো সাধারণত ব্রাউজার থেকে অ্যাক্সেস করা হয়, এবং এই রুটগুলো `web` middleware group এর মধ্যে রয়েছে। এর মধ্যে সাধারণত সেশন ব্যবস্থাপনা, CSRF (Cross-Site Request Forgery) প্রটেকশন, এবং কুকিজ পরিচালিত হয়।

##### `web.php`-এর বৈশিষ্ট্য:

-   **Session Management:** সেশন এবং কুকি সাপোর্ট রয়েছে। সাধারণত ইউজার লগইন, ফর্ম সাবমিশন এবং অন্যান্য সেশনের উপর ভিত্তি করে হওয়া কাজগুলির জন্য ব্যবহৃত হয়।
-   **CSRF Protection:** ফর্ম সাবমিশন এবং অন্যান্য POST/PUT/DELETE অনুরোধের জন্য CSRF প্রোটেকশন সক্রিয় থাকে।
-   **View Responses:** সাধারণত এই রুটগুলো ভিউ ফাইল রেন্ডার করে এবং HTML পেজগুলো প্রদর্শন করে।

##### উদাহরণ:

```php
// routes/web.php

Route::get('/', function () {
    return view('welcome');
});

Route::get('/about', function () {
    return view('about');
});

Route::post('/contact', [ContactController::class, 'submit']);
```

এই রুটগুলো ব্রাউজার থেকে অ্যাক্সেস করা হয়, এবং সাধারণত HTTP GET এবং POST রিকোয়েস্টের মাধ্যমে ইউজার ইন্টারঅ্যাকশন ঘটে।

#### ২. `api.php`: API Routes

`api.php` ফাইলটি API (Application Programming Interface) রুটগুলো ধারণ করে। এই ফাইলের রুটগুলো `api` middleware group এর মধ্যে থাকে এবং API-based অ্যাপ্লিকেশনের জন্য ব্যবহৃত হয়, যেখানে সেশন বা কুকি পরিচালনার দরকার হয় না। API রুটগুলো সাধারণত JSON ফরম্যাটে ডাটা পাঠায় এবং গ্রহণ করে।

##### `api.php`-এর বৈশিষ্ট্য:

-   **Stateless:** API রুটগুলোতে সেশন বা কুকি ব্যবস্থাপনা নেই। প্রতিটি রিকোয়েস্ট সম্পূর্ণ স্বাধীন এবং আগের রিকোয়েস্টের উপর নির্ভরশীল নয়।
-   **Token-based Authentication:** API রুটগুলোতে সাধারণত টোকেন-ভিত্তিক অথেন্টিকেশন ব্যবহৃত হয়, যেমন Laravel Passport, JWT (JSON Web Tokens) ইত্যাদি।
-   **JSON Responses:** এই রুটগুলোতে সাধারণত JSON ডাটা রেসপন্স হিসাবে পাঠানো হয়, যেমন RESTful API-এর জন্য ব্যবহৃত হয়।

##### উদাহরণ:

```php
// routes/api.php

Route::get('/users', [UserController::class, 'index']);
Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:api')->get('/profile', [UserController::class, 'profile']);
```

এই রুটগুলো সাধারণত API ক্লায়েন্ট বা মোবাইল অ্যাপ্লিকেশন থেকে অ্যাক্সেস করা হয় এবং JSON ডাটা প্রেরণ ও গ্রহণ করা হয়।

#### Middleware Groups:

Laravel এর route ফাইলগুলো বিভিন্ন middleware group ব্যবহার করে। যেমন:

-   `web.php` ফাইলে `web` middleware থাকে, যেখানে সেশন, CSRF প্রোটেকশন ইত্যাদি ব্যবহৃত হয়।
-   `api.php` ফাইলে `api` middleware থাকে, যেখানে সাধারণত stateless বা সেশনবিহীন রিকোয়েস্ট ব্যবহৃত হয়।

#### কখন কোন ফাইল ব্যবহার করবেন?

-   **`web.php`:** যদি আপনার অ্যাপ্লিকেশনটি ব্রাউজারে চলবে এবং UI-centric, যেমন ব্লগ, ই-কমার্স সাইট, বা যেকোনো ওয়েব অ্যাপ্লিকেশন, যেখানে সেশন, কুকি এবং ভিউ ব্যবহার হবে, তখন আপনি `web.php` ফাইলে রুট ডিফাইন করবেন।
-   **`api.php`:** যদি আপনি কোনো API ডেভেলপ করছেন, যা JSON বা অন্য কোন ডাটা ফরম্যাট পাঠাবে এবং ব্রাউজার ছাড়াও অন্য ক্লায়েন্ট (যেমন মোবাইল অ্যাপ, অন্য সার্ভার) থেকে অ্যাক্সেস করা হবে, তখন `api.php` ফাইল ব্যবহার করবেন।

### সারসংক্ষেপ:

-   **`web.php`:** ওয়েব ভিত্তিক অ্যাপ্লিকেশন রুটের জন্য, যেখানে সেশন এবং কুকি ব্যবস্থাপনা দরকার।
-   **`api.php`:** API রুটের জন্য, যা সাধারণত stateless এবং JSON রেসপন্স হিসেবে কাজ করে।

Laravel এর রুট ব্যবস্থাপনা খুবই সহজ এবং শক্তিশালী, যা আপনাকে বিভিন্ন প্রকার রিকোয়েস্ট হ্যান্ডেল করতে সাহায্য করে।

`Kernel.php` ফাইলটি Laravel এর অন্যতম গুরুত্বপূর্ণ ফাইল, যা অ্যাপ্লিকেশনের মাইডলওয়্যার ব্যবস্থাপনা এবং রাউটিংয়ের ক্ষেত্রে গুরুত্বপূর্ণ ভূমিকা পালন করে। এটি Laravel এর রিকোয়েস্ট লাইফসাইকেল এবং মাইডলওয়্যারকে পরিচালনা করে। `api.php` এবং `web.php` ফাইলের মধ্যে কীভাবে মাইডলওয়্যার ব্যবহার হবে, তা `Kernel.php` ফাইলের মাধ্যমে নির্ধারিত হয়।

#### `Kernel.php` ফাইলের ভূমিকা

`app/Http/Kernel.php` ফাইলটি Laravel অ্যাপ্লিকেশনের জন্য মাইডলওয়্যার নিয়ন্ত্রণ এবং গোষ্ঠীবদ্ধ করার কেন্দ্রস্থল। Laravel এ মূলত দুটি ধরণের `Kernel` ফাইল থাকে:

-   **HTTP Kernel (`app/Http/Kernel.php`):** এটি HTTP রিকোয়েস্ট হ্যান্ডেল করে।
-   **Console Kernel (`app/Console/Kernel.php`):** এটি CLI (Command Line Interface) কমান্ড হ্যান্ডেল করে।

এখানে আমরা শুধুমাত্র **HTTP Kernel** নিয়ে আলোচনা করব, কারণ এটি সরাসরি রাউট এবং মাইডলওয়্যার ব্যবস্থাপনার সাথে সম্পর্কিত।

### `Kernel.php` এবং Middleware এর সাথে Route ফাইলের সম্পর্ক

#### ১. Global Middleware

`Kernel.php` ফাইলে `protected $middleware` প্রপার্টিতে অ্যাপ্লিকেশনের সমস্ত HTTP রিকোয়েস্টের ওপর প্রয়োগ হওয়া **Global Middleware** নির্ধারিত থাকে। এগুলো অ্যাপ্লিকেশনের প্রতিটি রিকোয়েস্টের উপর স্বয়ংক্রিয়ভাবে চালিত হয়, চাহিদার ভিত্তিতে আলাদাভাবে রাউট ফাইলে ডিফাইন করতে হয় না।

##### উদাহরণ:

```php
protected $middleware = [
    \App\Http\Middleware\TrustProxies::class,
    \Illuminate\Http\Middleware\HandleCors::class,
    \App\Http\Middleware\PreventRequestsDuringMaintenance::class,
    \Illuminate\Foundation\Http\Middleware\ValidatePostSize::class,
    \App\Http\Middleware\TrimStrings::class,
    \Illuminate\Foundation\Http\Middleware\ConvertEmptyStringsToNull::class,
];
```

উপরের Middleware গুলো অ্যাপ্লিকেশনের প্রতিটি রাউটের জন্য স্বয়ংক্রিয়ভাবে অ্যাপ্লাই হবে।

#### ২. Middleware Groups (web এবং api)

`Kernel.php` ফাইলের আরেকটি গুরুত্বপূর্ণ অংশ হলো **Middleware Groups**, যা নির্দিষ্ট রাউটগুলোর জন্য বিভিন্ন মাইডলওয়্যার সেট করে। Laravel এ প্রধান দুটি middleware গ্রুপ আছে:

-   **`web` middleware group:** এটি `web.php` ফাইলের রাউটগুলোর জন্য ব্যবহৃত হয়।
-   **`api` middleware group:** এটি `api.php` ফাইলের রাউটগুলোর জন্য ব্যবহৃত হয়।

##### `web` middleware group:

```php
protected $middlewareGroups = [
    'web' => [
        \App\Http\Middleware\EncryptCookies::class,
        \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
        \Illuminate\Session\Middleware\StartSession::class,
        \Illuminate\View\Middleware\ShareErrorsFromSession::class,
        \App\Http\Middleware\VerifyCsrfToken::class,
        \Illuminate\Routing\Middleware\SubstituteBindings::class,
    ],
];
```

-   **Session Management:** `StartSession` মাইডলওয়্যার সেশন পরিচালনা করে।
-   **CSRF Protection:** `VerifyCsrfToken` মাইডলওয়্যার CSRF প্রোটেকশন নিশ্চিত করে।
-   **Bindings:** `SubstituteBindings` রাউট প্যারামিটারকে মডেল বাউন্ডিংয়ের সাথে সংযুক্ত করে।

এই Middleware গুলো `web.php` ফাইলে ডিফাইন করা রাউটগুলোর জন্য প্রযোজ্য হয়, যা ব্রাউজার থেকে আসা রিকোয়েস্টের সাথে প্রাসঙ্গিক।

##### `api` middleware group:

```php
'api' => [
    \Illuminate\Routing\Middleware\ThrottleRequests::class . ':api',
    \Illuminate\Routing\Middleware\SubstituteBindings::class,
],
```

-   **Stateless:** এখানে কোনো সেশন ম্যানেজমেন্ট নেই, যেহেতু API রিকোয়েস্ট stateless হয়।
-   **Rate Limiting:** `ThrottleRequests` মাইডলওয়্যারটি API রিকোয়েস্টের হার সীমিত করে।

এগুলো `api.php` ফাইলে ডিফাইন করা রাউটগুলোর জন্য প্রযোজ্য হয়, যেখানে JSON রেসপন্স এবং টোকেন-ভিত্তিক অথেন্টিকেশন ব্যবহৃত হয়।

#### ৩. Route Middleware

`Kernel.php` ফাইলে আরও একটি গুরুত্বপূর্ণ অংশ হলো **Route Middleware**, যা আপনি নির্দিষ্ট রাউটের সাথে মাইডলওয়্যার প্রয়োগ করতে ব্যবহার করতে পারেন। এগুলো একেকটি নির্দিষ্ট রাউট বা রাউট গ্রুপের জন্য ব্যবহৃত হয়, তবে এগুলো global নয়।

##### Route Middleware এর উদাহরণ:

```php
protected $routeMiddleware = [
    'auth' => \App\Http\Middleware\Authenticate::class,
    'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
    'bindings' => \Illuminate\Routing\Middleware\SubstituteBindings::class,
    'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,
    'verified' => \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class,
];
```

-   **`auth`:** এই middleware নিশ্চিত করে যে ইউজার অথেন্টিকেটেড কিনা।
-   **`throttle`:** এটি রিকোয়েস্টের সংখ্যা সীমিত করতে ব্যবহৃত হয়।

আপনি যখন একটি নির্দিষ্ট রাউটের সাথে middleware ব্যবহার করতে চান, তখন `routeMiddleware` এর মাধ্যমে এটি ডিফাইন করা হয় এবং রাউটে এটি অ্যাসাইন করা হয়।

##### উদাহরণ:

```php
Route::get('/profile', [UserController::class, 'profile'])->middleware('auth');
```

#### ৪. Custom Middleware

`Kernel.php` ফাইলে আপনি কাস্টম middleware রেজিস্টার করতে পারেন। Middleware তৈরির পর তা `$routeMiddleware` অ্যারে-তে যুক্ত করতে হয়, এবং পরে আপনি এটি রাউটের সাথে ব্যবহার করতে পারবেন।

##### Custom Middleware যুক্ত করার উদাহরণ:

```php
protected $routeMiddleware = [
    'checkAge' => \App\Http\Middleware\CheckAge::class,
];
```

এখন আপনি `checkAge` middleware কোনো রাউটের সাথে ব্যবহার করতে পারবেন:

```php
Route::get('/restricted', [RestrictedController::class, 'index'])->middleware('checkAge');
```

### সারসংক্ষেপ:

-   **`Kernel.php`** ফাইলটি Laravel এর রাউট এবং middleware গুলোর নিয়ন্ত্রণ কেন্দ্রীয় ভাবে পরিচালনা করে।
-   **Global Middleware** অ্যাপ্লিকেশনের সব রাউটে স্বয়ংক্রিয়ভাবে প্রযোজ্য হয়।
-   **Middleware Groups** নির্দিষ্ট রাউট গ্রুপে (যেমন `web.php` এবং `api.php`) middleware সেট করে।
-   **Route Middleware** নির্দিষ্ট রাউট বা রাউট গ্রুপের জন্য কাস্টম middleware সংযুক্ত করা যায়।

Laravel এর `Kernel.php` ফাইলটি `web.php` এবং `api.php` ফাইলের রাউটগুলোর জন্য প্রয়োজনীয় middleware এবং রিকোয়েস্ট হ্যান্ডলিংয়ের নিয়ম ঠিক করে, যা অ্যাপ্লিকেশনকে আরও সুরক্ষিত এবং কার্যকরী করে তুলতে সাহায্য করে।

---

```php
Route::get('/hello', function () {
    return "Hellow Laravel";
});

http://127.0.0.1:8000/hello


Route::get('/hello', function () {
    return "Hellow Laravel from API";
});

http://127.0.0.1:8000/api/hello

```
