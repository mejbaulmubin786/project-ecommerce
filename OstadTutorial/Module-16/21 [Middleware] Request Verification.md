### কোড বিশ্লেষণ: মিডলওয়্যার দিয়ে রিকোয়েস্ট যাচাই করা

আমরা এই উদাহরণে একটি মিডলওয়্যার তৈরি করেছি, যা একটি নির্দিষ্ট হেডারের ভিত্তিতে রিকোয়েস্ট যাচাই করে। যদি রিকোয়েস্টটি নির্দিষ্ট শর্ত পূরণ করে, তাহলে এটি কন্ট্রোলারে যাওয়ার অনুমতি দেয়, নাহলে "Unauthorized" রেসপন্স পাঠায়।

#### **Route Configuration (web.php)**

```php
<?php

use App\Http\Controllers\DemoController;
use App\Http\Middleware\CheckRequestDetails;
use Illuminate\Support\Facades\Route;

Route::post('/hello', [DemoController::class, 'DemoAction'])->middleware([CheckRequestDetails::class]);
```

1. **Route Definition**: 
    - এখানে `/DemoAction` নামে একটি রুট তৈরি করা হয়েছে, যা POST রিকোয়েস্ট গ্রহণ করবে।
    - এই রুটটি `DemoController`-এর `DemoAction` মেথডকে কল করবে।
   
2. **Middleware ব্যবহার**:
    - এই রুটে একটি মিডলওয়্যার `CheckRequestDetails` প্রয়োগ করা হয়েছে। 
    - মিডলওয়্যার প্রথমে রিকোয়েস্টকে যাচাই করবে এবং যদি শর্তগুলো পূরণ হয়, তাহলে রিকোয়েস্ট `DemoController`-এ যাবে। 

---
অন্যান্য
#### **Middleware Definition (CheckRequestDetails.php)**

```php
<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRequestDetails {

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function handle(Request $request, Closure $next): Response {
        // রিকোয়েস্টের 'key' হেডার থেকে ডেটা বের করা
        $key = $request->header('key');

        // যদি হেডারের 'key' মান "123" হয়
        if ($key == "123") {
            // রিকোয়েস্টকে কন্ট্রোলারে পাঠাও
            return $next($request);
        } else {
            // যদি শর্ত পূরণ না হয়, Unauthorized রেসপন্স রিটার্ন কর
            return response()->json("unauthorized", 401);
        }
    }
}
```

```php
<?php

namespace App\Http\Controllers;

class DemoController extends Controller {

    function DemoAction() {

        //$name = $request->route('countryname');

        return "name";

    }

}
```

### ধাপে ধাপে ব্যাখ্যা:

1. **Namespace**:
   - `App\Http\Middleware`-এর অধীনে আমরা মিডলওয়্যারটি ডিফাইন করছি।

2. **Dependencies**:
   - `Request`: রিকোয়েস্টের সকল তথ্য ধারণ করে।
   - `Closure $next`: মিডলওয়্যারের পরবর্তী ধাপ নির্দেশ করে, অর্থাৎ রিকোয়েস্টটি কন্ট্রোলারে যাবে কিনা তা নিশ্চিত করে।

3. **handle() মেথড**:
   - `handle()` মেথডটি ইনকামিং রিকোয়েস্ট গ্রহণ করে এবং সেই রিকোয়েস্টকে যাচাই করে।
   - এখানে, `Request` থেকে হেডার থেকে `'key'` বের করা হচ্ছে। 
   
4. **যাচাই করা**:
   - যদি হেডারের `'key'` এর মান `"123"` হয়, তাহলে রিকোয়েস্ট কন্ট্রোলারে পাঠানো হয় (`return $next($request)`), অন্যথায় একটি `401 Unauthorized` রেসপন্স পাঠানো হয়।


---------------
# extra
### উদাহরণসমূহ:

#### উদাহরণ ১: হেডার যাচাই করে অথেনটিকেশন
আমরা এই কোড ব্যবহার করে চেক করতে পারি যে, রিকোয়েস্টটি একটি বৈধ API key দিয়ে এসেছে কিনা।

```php
public function handle(Request $request, Closure $next): Response {
    // হেডার থেকে 'api_key' বের করা
    $apiKey = $request->header('api_key');

    // যদি 'api_key' সঠিক হয়
    if ($apiKey == "valid_api_key") {
        // রিকোয়েস্ট কন্ট্রোলারে পাঠানো হবে
        return $next($request);
    } else {
        // যদি সঠিক না হয়, Unauthorized রেসপন্স পাঠানো হবে
        return response()->json("Unauthorized", 401);
    }
}
```

#### উদাহরণ ২: রিকোয়েস্ট ভ্যালিডেশন মিডলওয়্যার
এটি মিডলওয়্যার ব্যবহার করে যাচাই করতে পারি যে রিকোয়েস্টের বডিতে একটি নির্দিষ্ট ফিল্ড আছে কিনা।

```php
public function handle(Request $request, Closure $next): Response {
    // যদি রিকোয়েস্ট বডিতে 'name' ফিল্ড থাকে
    if ($request->has('name')) {
        // রিকোয়েস্ট কন্ট্রোলারে পাঠানো হবে
        return $next($request);
    } else {
        // যদি না থাকে, ব্যাড রিকোয়েস্ট (400) রেসপন্স পাঠানো হবে
        return response()->json("Bad Request: 'name' field is required", 400);
    }
}
```

#### উদাহরণ ৩: রেট লিমিটিং মিডলওয়্যার
ধরি, আমরা চাই একটি নির্দিষ্ট আইপি থেকে প্রতি মিনিটে সর্বোচ্চ ১০টি রিকোয়েস্ট গ্রহণ করা হবে।

```php
public function handle(Request $request, Closure $next): Response {
    $ip = $request->ip();
    $requestCount = cache()->get($ip, 0);
    
    // যদি রিকোয়েস্টের সংখ্যা ১০ এর বেশি হয়
    if ($requestCount > 10) {
        return response()->json("Too Many Requests", 429);
    }

    // রিকোয়েস্ট কাউন্ট ১ বাড়িয়ে সেভ করা হবে
    cache()->put($ip, $requestCount + 1, 60);

    // রিকোয়েস্ট কন্ট্রোলারে পাঠানো হবে
    return $next($request);
}
```

### সারসংক্ষেপ

এই উদাহরণগুলো মিডলওয়্যার কীভাবে কাজ করে তা বোঝায়। মূলত, মিডলওয়্যার রিকোয়েস্ট এবং রেসপন্সের মাঝে অবস্থান করে এবং বিভিন্ন কার্যক্রম যেমন যাচাই, অথেনটিকেশন, ভ্যালিডেশন ইত্যাদি সম্পন্ন করতে সাহায্য করে।