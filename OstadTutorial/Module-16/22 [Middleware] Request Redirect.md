এর আগে আমরা জেনেছি Middleware ব্যবহার করে কি করে একটি রিকোয়েস্টকে সামনের দিকে নিয়ে যেতে পারি অথবা স্টপ কর দিতে পারি। কিন্তু এবার আমরা শিকবো Middleware থেকে ও আমরা কি করে রিডাইরেক্ট করতে পারি। কন্ট্রোলার থেকে যা যা করা যায় Middleware তা তা করা যায়।

#### **Route Configuration (web.php)**

```php
<?php

use App\Http\Controllers\DemoController;
use App\Http\Middleware\CheckRequestDetails;
use Illuminate\Support\Facades\Route;

Route::post('/hello1/{key}', [DemoController::class, 'DemoAction1'])->middleware([CheckRequestDetails::class]);

Route::post('/hello2', [DemoController::class, 'DemoAction2']);
```
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

        $key = $request->key;

  

        if ($key == "123") {

            return $next($request);

        } else {

            return redirect('hello2');

        }

    }

}
```

```php
<?php

  

namespace App\Http\Controllers;

  

class DemoController extends Controller {

  

    function DemoAction1() {

  

        return "Hello1";

  

    }

  

    function DemoAction2() {

  

        return "/Hello2";

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