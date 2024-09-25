### Laravel এ ফাইল আপলোড করা: `storeAs` এবং `move` মেথড ব্যবহার

Laravel এ ফাইল আপলোড করা খুবই সহজ এবং Laravel ফাইল আপলোড ও সংরক্ষণের জন্য দুটি প্রধান মেথড প্রদান করে: `storeAs` এবং `move`। এই মেথডগুলো বিভিন্ন স্টোরেজ লোকেশনে ফাইল সংরক্ষণ করতে ব্যবহৃত হয়।

#### 1. **ফাইল আপলোডের জন্য প্রস্তুতি**

ফাইল আপলোড করার আগে ফর্মের মাধ্যমে ফাইলটি কন্ট্রোলারে পৌঁছানো দরকার। আমরা আগে দেখেছি কীভাবে মাল্টিপার্ট ফর্ম ডাটা ব্যবহার করে ফাইল পাঠানো যায়। এখন দেখবো, Laravel-এ ফাইল সংরক্ষণের জন্য `storeAs` এবং `move` মেথড ব্যবহার করা যায়।

---

### উদাহরণ ১: `storeAs` মেথড ব্যবহার করে ফাইল আপলোড করা

`storeAs` মেথডটি **Laravel's Storage Facade** ব্যবহার করে ফাইলকে **storage/app** ডিরেক্টরির মধ্যে সংরক্ষণ করে। এটি সাধারণত ফাইল সিস্টেমের নির্দিষ্ট স্টোরেজ ড্রাইভ ব্যবহার করে যেমন লোকাল, S3, ইত্যাদি।

#### Step 1: Route Configuration

```php
// web.php
Route::post('/upload', [DemoController::class, 'uploadFile']);
```

#### Step 2: Controller Configuration (Using `storeAs`)

```php
// DemoController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    public function uploadFile(Request $request): string {
        // ফাইলটি রিকোয়েস্ট থেকে গ্রহণ করা
        $img = $request->file('image_file');

        // ফাইলটি স্টোরেজ ফোল্ডারে নির্দিষ্ট ফোল্ডারের মধ্যে সংরক্ষণ করা
        // uploads নামের ফোল্ডারের ভেতর ক্লায়েন্টের দেয়া ফাইলের নাম সহ ফাইল সংরক্ষণ
        $path = $img->storeAs('uploads', $img->getClientOriginalName());

        // ফাইলের স্টোরেজ পাথ রিটার্ন করা
        return "File stored at: " . $path;
    }
}
```

#### Step 3: Postman ব্যবহার করে ফাইল আপলোড করা

-   **Method**: POST
-   **Body**:
    -   `form-data` নির্বাচন করুন।
    -   Key হিসেবে `image_file` দিন, এবং Value হিসেবে ফাইল সিলেক্ট করুন (Type: File)।

এই রিকোয়েস্টের মাধ্যমে ফাইলটি `storage/app/uploads` ডিরেক্টরিতে সংরক্ষণ করা হবে।

---

### উদাহরণ ২: `move` মেথড ব্যবহার করে ফাইল আপলোড করা

`move` মেথডটি সরাসরি **public** ফোল্ডারে ফাইল আপলোড করতে ব্যবহৃত হয়। এটি সাধারণত **public_path()** ব্যবহার করে যেখানে ফাইলটি পাবলিকলি অ্যাক্সেস করা যেতে পারে।

#### Step 1: Controller Configuration (Using `move`)

```php
// DemoController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    public function uploadFile(Request $request): string {
        // ফাইলটি রিকোয়েস্ট থেকে গ্রহণ করা
        $img = $request->file('image_file');

        // ফাইলটি public/uploads ফোল্ডারে ক্লায়েন্টের দেয়া নাম সহ সংরক্ষণ
        $img->move(public_path('uploads'), $img->getClientOriginalName());

        // সফলভাবে আপলোড করা মেসেজ রিটার্ন করা
        return "File has been uploaded to the public/uploads directory.";
    }
}
```

#### Step 2: Postman ব্যবহার করে ফাইল আপলোড করা

-   **Method**: POST
-   **Body**:
    -   `form-data` নির্বাচন করুন।
    -   Key হিসেবে `image_file` দিন এবং Value হিসেবে ফাইল সিলেক্ট করুন (Type: File)।

এই রিকোয়েস্টের মাধ্যমে ফাইলটি `public/uploads` ফোল্ডারে সংরক্ষণ করা হবে, যা ব্রাউজার থেকে সরাসরি অ্যাক্সেস করা যায়।

---

### `storeAs` vs. `move` মেথডের পার্থক্য

| মেথড      | ব্যবহারের উদ্দেশ্য                                                | স্টোরেজ লোকেশন        |
| --------- | ----------------------------------------------------------------- | --------------------- |
| `storeAs` | Laravel এর স্টোরেজ সিস্টেম (storage/app) ব্যবহার করে ফাইল সংরক্ষণ | `storage/app/uploads` |
| `move`    | সরাসরি public ফোল্ডারে ফাইল আপলোড                                 | `public/uploads`      |

#### 1. **`storeAs` মেথড:**

-   Laravel এর স্টোরেজ ফ্যাসিলিটি ব্যবহার করে ফাইল সংরক্ষণ করে।
-   ফাইলটি ডিফল্টভাবে **storage/app** ফোল্ডারে আপলোড হয়।
-   `storeAs` এর সাথে স্টোরেজ ড্রাইভ ব্যবহার করা যায়, যেমন **local** বা **s3** ইত্যাদি।

#### 2. **`move` মেথড:**

-   সরাসরি **public** ডিরেক্টরির মধ্যে ফাইল আপলোড করতে ব্যবহৃত হয়।
-   `public/uploads` ফোল্ডারে ফাইল সরাসরি পাবলিকলি অ্যাক্সেস করা যায়।

---

### উদাহরণ ৩: কাস্টম ফোল্ডারে ফাইল আপলোড করা

Laravel এ আপনি কাস্টম ফোল্ডার তৈরি করে তাতে ফাইল আপলোড করতে পারেন। উদাহরণস্বরূপ, যদি আপনি `uploads/images` নামে একটি সাবফোল্ডারে ফাইল রাখতে চান, তাহলে:

```php
// DemoController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    public function uploadFile(Request $request): string {
        $img = $request->file('image_file');

        // স্টোরেজ ফোল্ডারের uploads/images এর মধ্যে ফাইল আপলোড করা
        $path = $img->storeAs('uploads/images', $img->getClientOriginalName());

        return "File stored at: " . $path;
    }
}
```

এই উদাহরণে, ফাইলটি `storage/app/uploads/images` ফোল্ডারে সংরক্ষণ করা হবে।

---

### ফাইল আপলোডের সময় ভ্যালিডেশন (Validation)

ফাইল আপলোড করার সময় কিছু নির্দিষ্ট নিয়ম মেনে চলা জরুরি, যেমন ফাইলের সাইজ, টাইপ ইত্যাদি যাচাই করা। Laravel এ সহজেই ভ্যালিডেশন করা যায়:

```php
$request->validate([
    'image_file' => 'required|mimes:jpg,jpeg,png|max:2048',  // ফাইল অবশ্যই jpg/jpeg/png হতে হবে এবং সাইজ ২MB এর বেশি হবে না
]);

$img = $request->file('image_file');
$img->move(public_path('uploads'), $img->getClientOriginalName());
```

---

### সংক্ষেপে:

-   **`storeAs`**: Laravel এর স্টোরেজ ফ্যাসিলিটির মাধ্যমে ফাইল স্টোর করে। ডিফল্টভাবে ফাইল `storage/app/uploads` এ জমা হয়।
-   **`move`**: সরাসরি public ফোল্ডারে ফাইল আপলোড করতে ব্যবহৃত হয়। এটি `public/uploads` এ ফাইল সংরক্ষণ করে।
-   আপনি কাস্টম সাবফোল্ডারেও ফাইল সংরক্ষণ করতে পারেন।
-   ফাইল আপলোডের আগে ফাইল ভ্যালিডেশন করা উচিত, যেমন ফাইল টাইপ ও সাইজ চেক করা।

এভাবে, Laravel এ আপনি সহজেই ফাইল আপলোড ও সংরক্ষণ করতে পারবেন।
