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

Laravel-এর রাউট প্যারামিটার ব্যবহার করে আপনি যেকোনো ডাইনামিক ইউআরএল-কে সহজেই হ্যান্ডেল করতে পারবেন, যা আপনার অ্যাপ্লিকেশনের ইন্টারঅ্যাকশনকে আরও ফ্লেক্সিবল এবং ডাইনামিক করে তোলে।
