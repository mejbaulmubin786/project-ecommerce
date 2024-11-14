নিশ্চিতভাবেই! এবার আমরা দেখবো কীভাবে Eloquent ORM ব্যবহার করে ডাটাবেজে ডেটা আপডেট করা যায়, এবং এটি কেমন করে কাজ করে।

### Eloquent ORM দিয়ে ডেটা আপডেট করা

Eloquent ORM এ ডেটা আপডেট করা খুবই সহজ। ডেটা আপডেট করার সময় `fillable` প্রপার্টির সাহায্যে আমরা নির্দিষ্ট করি কোন ফিল্ডগুলো আপডেট করতে অনুমতি দিচ্ছি।

আপনার দেওয়া উদাহরণটি ধরে একটি বিস্তারিত ব্যাখ্যা নিচে দেওয়া হলো।

#### Model (Brand.php)

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model {
    use HasFactory;

    // $fillable প্রপার্টি ব্যবহার করে বলছি কোন কলামগুলো আপডেটযোগ্য
    protected $fillable = ['brandName', 'brandImg'];
}
```

`$fillable` প্রপার্টি ব্যবহার করে নির্দিষ্ট করেছি যে শুধুমাত্র `brandName` এবং `brandImg` ফিল্ডগুলোতেই ডেটা আপডেট বা ইনসার্ট করা যাবে।

### Controller এ Update Action তৈরি

এরপর, `DemoController` কন্ট্রোলারে `DemoAction` নামের একটি মেথড তৈরি করবো যা ডেটা আপডেট করার কাজ করবে।

#### Controller (DemoController.php)

```php
<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use Illuminate\Http\Request;

class DemoController extends Controller {
    public function DemoAction(Request $request, $id) {
        // কোন ডেটাটি আপডেট করছি তা নির্দিষ্ট করার জন্য where ক্লজ ব্যবহার করা হচ্ছে
        $updateStatus = Brand::where('id', $id)->update($request->input());

        // আপডেট সফল হলে true ফেরত দেবে, ব্যর্থ হলে false
        return response()->json([
            'success' => $updateStatus ? true : false,
            'message' => $updateStatus ? 'Brand updated successfully!' : 'Failed to update brand.'
        ]);
    }
}
```

এখানে আমরা `where` ক্লজ ব্যবহার করে `id` এর ভিত্তিতে ডেটা আপডেট করছি এবং `$request->input()` এর মাধ্যমে ইনপুট থেকে ডেটা সংগ্রহ করছি। এই পদ্ধতিতে শুধুমাত্র ঐ ফিল্ডগুলোই আপডেট হবে, যা `$fillable` প্রপার্টিতে উল্লেখ করা হয়েছে।

#### Route তৈরি করা

আমরা এখন `/update-brand/{id}` নামে একটি রাউট তৈরি করবো, যাতে `id` এর মাধ্যমে নির্দিষ্ট ডেটা আপডেট করা যায়।

#### Route (`api.php` বা `web.php`)

```php
Route::post('/update-brand/{id}', [DemoController::class, 'DemoAction']);
```

এখানে `/update-brand/{id}` রাউটটি তৈরি করা হয়েছে যা `DemoAction` মেথডকে কল করবে এবং URL এ `{id}` প্যারামিটারটি পাস করবে।

### Postman দিয়ে ডেটা আপডেট টেস্ট করা

Postman ব্যবহার করে `/update-brand/{id}` রাউটটি হিট করে JSON ফরম্যাটে ডেটা পাঠিয়ে আমরা টেস্ট করতে পারি।

#### উদাহরণস্বরূপ JSON ডেটা

```json
{
  "brandName": "Updated Brand Name",
  "brandImg": "updated-image.jpg"
}
```

### সমস্যা এবং সম্ভাব্য সমাধান

Laravel প্রজেক্টে রাউট কাজ না করলে নিচের স্টেপগুলো ফলো করতে পারেন:

#### ১. CSRF টোকেন সমস্যা

**web.php** এর রাউটগুলোতে CSRF টোকেন যাচাই হয়, তাই Postman দিয়ে টেস্ট করতে চাইলে CSRF যাচাই বাদ দিতে হবে:

```php
Route::post('/update-brand/{id}', [DemoController::class, 'DemoAction'])->withoutMiddleware([\App\Http\Middleware\VerifyCsrfToken::class]);
```

#### ২. রাউট ক্যাশ পরিষ্কার করা

```bash
php artisan route:clear
```

#### ৩. ঠিক URL ব্যবহার নিশ্চিত করা

- **api.php**: `/api/update-brand/{id}`
- **web.php**: `/update-brand/{id}`

## এই ধাপগুলো অনুসরণ করে ডেটা আপডেট কাজটি সফলভাবে সম্পন্ন করা সম্ভব।

আমরা ডেটা ইনসার্ট করা শেষে েএবার শিখবো কি করে ডাটা আপডেইট করা যায়। আপডেইট করার ক্ষেত্রে একেবারে সিমিলার । আমরা Eloquent ORM এ আমরা যে অপারেশন গুলো ঘটাচ্ছি এই যে ক্রিয়েট করা আপডেইট করা রিচ করা এগরিগেইশন এর যে মেথড গুলো আছে এগুলো সিমিলার টু কুয়েরি বিল্ডার পার্থক্য হচ্ছে আমারা সেখানে এই মথেড গুলো ব্যবহার করেছি একটি টেবিল এর মাধ্যমে সরাসরি টেবিল এর নাম লিখেছি সেখানে কিন্তু মডেলের মাধ্যমে যখন আমরা করছি তখন টেবিলের নাম আমরা লিখছি না কারণ মডেলটাই টেবিল টাকে রিপ্রেজেন্ট করছে এখানে আমরা যে অপারেশনস গুলো করছি তা সরাসরি টেবিলে গিয়ে হিট করচে না এগুলো মডেল হয়ে টেবিলে যাচ্ছে।

```PHP
class Brand extends Model {
        protected $fillable = ['brandName', 'brandImg'];
}
```

ইনসাট করি বা আপডেইট করি যা করি না কেন যেতেহু ডেটা চেঞ্জ হচ্ছে তাই ফিলেবল বলে দিতে হবে।

```PHP
public function DemoAction(Request $request) {
        return Brand::where('id', $request->id)
        ->update($request->input());
}
```

এখানে আমরা কোন ডেটাটি আপডেইট করছি সেটি অবশ্যই বলে দিতে হবে। আপডেইট করার পরে এর ইনফরমেশন ও আমাদের বলে দিতে হচ্ছে। এখানে where এর ব্যবহার টা কুয়েরি বিল্ডার এর মতো সেইম টু সেইম একই ভাবে হয়ার ক্লজ গুলো ব্যবহার করা যায়। । `return Brand::where('id', $request->id)->update($request->input());` আমি যে ডাটা টা আপডেইট করতে চাচ্ছি তার where ক্লডে'id' নিয়ে নিলাম এটি নিবো কিভাবে নিবো $request->id ইউ আর এল প্যারামিটার এর মাধ্যমে নিবো। নিয়ে কি করবো ডাটাটা আপডেইট করবো। তা কোন ডেটা আপডেইট করবো আমি। যেই ডেটা আমি আপডেইট করবোসেই ডেটা টা আমি আমার যে রিকোয়েস্ট আছে $request->input() মানে রিকোয়েস্ট এর যে বডি আছে তা সেখানে রিসিভ করতে পারি। সর্বশেষ আপডেইট হয়েছে কিনা তা রিটান করে দিতে হবে এতে ফাইনারি ফলাফল পেয়ে যাবো।
`Route::post('/update-brand/{id}', [DemoController::class, 'DemoAction'])` এর জন্য রাউটে মানে ইউআর এল এ অরিরিক্ত একটি update-brand/{id} পাস করাতে হচ্ছে। এখন আমরা পোস্ট ম্যান দিয়ে টেস্ট করি।
