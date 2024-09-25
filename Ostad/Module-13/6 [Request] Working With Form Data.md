### মাল্টিপার্ট ফর্ম ডাটা নিয়ে বিস্তারিত আলোচনা এবং ফাইল আপলোডের প্রক্রিয়া

Laravel-এ মাল্টিপার্ট ফর্ম ডাটা ব্যবহৃত হয় প্রধানত ফাইল আপলোডের ক্ষেত্রে। মাল্টিপার্ট ফর্ম ডাটা হল HTTP রিকোয়েস্টের একটি কনটেন্ট টাইপ, যা একাধিক অংশে বিভক্ত থাকে, যেমন টেক্সট এবং ফাইল ডাটা। এটি বিশেষভাবে ব্যবহৃত হয় যখন একটি ফর্মের মাধ্যমে ফাইলসহ অন্যান্য ইনপুট ডাটা ব্যাকএন্ডে পাঠানো হয়।

আমরা আগে বডিতে `input()` ব্যবহার করে টেক্সট ডাটা গ্রহণ করেছিলাম। এবার দেখবো কীভাবে মাল্টিপার্ট ফর্ম ডাটা ব্যবহার করে ফাইলসহ অন্যান্য টেক্সট ইনপুট কন্ট্রোলারে প্রক্রিয়া করা হয়।

---

### উদাহরণ ১: সাধারণ ফর্ম ডাটা (Text Values)

প্রথমে আমরা দেখবো কীভাবে টেক্সট ইনপুটের মাধ্যমে মাল্টিপার্ট ফর্ম ডাটা পাঠানো হয় এবং Laravel কন্ট্রোলারে সেটি গ্রহণ করা যায়।

#### Step 1: Route Configuration

```php
// web.php
Route::post('/hello', [DemoController::class, 'DemoAction']);
```

#### Step 2: Controller Configuration

```php
// DemoController.php
<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

class DemoController extends Controller {
    public function DemoAction(Request $request): array {
        // ফর্ম ডাটা থেকে টেক্সট ইনপুট গ্রহণ করা
        $fname = $request->input('fname');
        $lname = $request->input('lname');

        // টেক্সট ইনপুট রিটার্ন করা
        return [
            'First Name' => $fname,
            'Last Name' => $lname
        ];
    }
}
```

#### Step 3: Postman ব্যবহার করে টেক্সট ডাটা পাঠানো

Postman এ:

-   **Method**: POST
-   **Body**:
    -   `form-data` নির্বাচন করুন।
    -   Key হিসেবে `fname` এবং `lname` দিন এবং Value হিসেবে তাদের টেক্সট দিন।

এভাবে আমরা সাধারণ ফর্ম ডাটা পাঠাতে পারি এবং Laravel এর `input()` মেথড ব্যবহার করে কন্ট্রোলারে তা গ্রহণ করতে পারি।

---

### উদাহরণ ২: ফাইল আপলোড (File Upload)

এবার আমরা দেখবো কীভাবে মাল্টিপার্ট ফর্ম ডাটা ব্যবহার করে ফাইল আপলোড করা হয়। ফাইল আপলোড করার সময়, Laravel-এ ফাইল ডাটা গ্রহণ করতে `file()` মেথড ব্যবহার করতে হয়।

#### Step 1: Route Configuration

```php
// web.php
Route::post('/upload', [DemoController::class, 'uploadFile']);
```

#### Step 2: Controller Configuration

```php
// DemoController.php
<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

class DemoController extends Controller {
    public function uploadFile(Request $request): array {
        // ফর্ম ডাটা থেকে ফাইল সংগ্রহ করা
        $photoFile = $request->file('photo');

        // ফাইল সম্পর্কিত বিভিন্ন ডিটেইলস সংগ্রহ করা
        $fileSize = $photoFile->getSize();  // ফাইলের সাইজ
        $fileType = $photoFile->getMimeType();  // ফাইলের টাইপ (mime type)
        $originalName = $photoFile->getClientOriginalName();  // মূল ফাইলের নাম
        $tempFilename = $photoFile->getFilename();  // সার্ভারে আপলোডের পরে টেম্প ফাইলের নাম
        $extension = $photoFile->extension();  // ফাইলের এক্সটেনশন

        // ডাটা রিটার্ন করা
        return [
            'File Size' => $fileSize,
            'File Type' => $fileType,
            'Original Name' => $originalName,
            'Temp Filename' => $tempFilename,
            'Extension' => $extension
        ];
    }
}
```

#### Step 3: Postman ব্যবহার করে ফাইল আপলোড করা

Postman এ:

-   **Method**: POST
-   **Body**:
    -   `form-data` নির্বাচন করুন।
    -   Key হিসেবে `photo` দিন, এবং Value হিসেবে আপনার আপলোড করতে ইচ্ছুক ফাইলটি সিলেক্ট করুন (Type: File)।

এই রিকোয়েস্টের মাধ্যমে আমরা কন্ট্রোলারে ফাইল পাঠাতে পারি, এবং Laravel `file()` মেথড ব্যবহার করে সেই ফাইলটি প্রক্রিয়াকরণ করতে পারে।

---

### গুরুত্বপূর্ণ ফাইল অপারেশন মেথডসমূহ:

Laravel এ ফাইল আপলোড করার পরে আমরা সাধারণত নিচের মেথডগুলো ব্যবহার করি:

1. **`$request->file('photo')`**: ফাইলটি গ্রহণ করার জন্য ব্যবহৃত হয়।
2. **`$photoFile->getSize()`**: ফাইলের সাইজ নির্ধারণ করে।
3. **`$photoFile->getMimeType()`**: ফাইলের টাইপ (MIME type) পেতে সাহায্য করে, যেমন `image/jpeg`, `application/pdf` ইত্যাদি।
4. **`$photoFile->getClientOriginalName()`**: ক্লায়েন্টের আপলোড করা মূল ফাইলের নাম পেতে সাহায্য করে।
5. **`$photoFile->extension()`**: ফাইলের এক্সটেনশন (যেমন `.jpg`, `.png`) পেতে সাহায্য করে।
6. **`$photoFile->move($destinationPath, $newFileName)`**: ফাইলটি নির্দিষ্ট ডিরেক্টরিতে সংরক্ষণ করতে সাহায্য করে।

---

### ফাইল আপলোডের আরো কিছু গুরুত্বপূর্ণ টিপস:

-   **ফাইল ভ্যালিডেশন**: Laravel এ ফাইল আপলোড করার সময় ফাইলের সাইজ, টাইপ ইত্যাদি যাচাই করতে পারেন। উদাহরণস্বরূপ, আপনি চেক করতে পারেন যে ফাইলটি ইমেজ কিনা এবং তার সাইজ নির্দিষ্ট সীমার মধ্যে আছে কিনা।

```php
$request->validate([
    'photo' => 'required|mimes:jpg,jpeg,png|max:2048',  // 2MB এর বেশি হতে পারবে না এবং jpg/jpeg/png হতে হবে
]);
```

-   **ফাইল সংরক্ষণ করা**: ফাইল আপলোডের পরে সার্ভারে সংরক্ষণ করতে পারেন, যেমন:

```php
$photoFile->move(public_path('uploads'), $photoFile->getClientOriginalName());
```

---

### সংক্ষেপে:

-   মাল্টিপার্ট ফর্ম ডাটা ব্যবহৃত হয় ফাইলসহ অন্যান্য ইনপুট ডাটা পাঠানোর জন্য।
-   Laravel এ `$request->file()` মেথড ব্যবহার করে ফাইল ডাটা গ্রহণ করা হয়।
-   Postman এর `form-data` সিলেকশন ব্যবহার করে ফাইল এবং অন্যান্য টেক্সট ইনপুট পাঠানো যায়।
-   ফাইল সম্পর্কিত বিভিন্ন ডিটেইলস (সাইজ, টাইপ, নাম) সহজেই পাওয়া যায়।
-   ফাইল ভ্যালিডেশন এবং সংরক্ষণ করতে Laravel এর বিল্ট-ইন ফিচারগুলো ব্যবহার করা যেতে পারে।

এভাবে Laravel এর মাল্টিপার্ট ফর্ম ডাটা ফিচারটি ব্যবহার করে আপনি ফাইল আপলোড এবং অন্যান্য ডাটা প্রসেসিং করতে পারবেন।
