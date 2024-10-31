<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller {
    function DemoAction1() {
        return "this is first request";
    }

    //Route Parameters সরাসরি ফাংশনে ইনজেকশন করে রিসিভ করা
    function DemoAction2($param1, $param2) {
        return "$param1 and $param2";
    }

    //Request Object ব্যবহার করে প্যারামিটার রিসিভ করা
    /* // First start
    function DemoAction3(Request $request) {

    $param1 = $request->route('param1');
    $param2 = $request->route('param2');
    return "Param 1: $param1, Param 2: $param2";
    }
    // First End
     */

/* ‍//second start
function DemoAction3(Request $request) {

return [
'name' => $request->route('name'),
'city' => $request->route('city'),
'code' => $request->route('code'),
];
} //second end
 */
    /*
    // Third Start
    আপনার রাউটে `{name}`, `{city}`, এবং `{code}` নামে প্যারামিটারগুলো ডিফাইন করা আছে। Laravel এই প্যারামিটারগুলোর নামের উপর ভিত্তি করে তাদের মান `$request->route()` থেকে সংগ্রহ করে। তাই, এখানে `name`, `city`, এবং `code` নামগুলো ব্যবহার করতেই হবে।

    ### কেন নাম পরিবর্তন করলে কাজ করবে না?

    Laravel রাউটে যেই নামগুলো আপনি প্যারামিটার হিসেবে দিয়েছেন (যেমন `{name}`, `{city}`, `{code}`), সেগুলোই `$request->route('param_name')`-এ প্যারামিটার হিসেবে ব্যবহার করতে হবে। যদি আপনি এই নামগুলো পরিবর্তন করে অন্য কিছু লিখে দেন, তাহলে `$request->route()` ঠিক প্যারামিটারগুলো খুঁজে পাবে না এবং `null` রিটার্ন করবে।

    ### উদাহরণ:

    যদি রাউটটি এভাবে ডিফাইন করেন:

    ```php
    Route::get('/urlpractice2/{name}/{city}/{code}', [DemoController::class, 'DemoAction3']);
    ```

    তাহলে `DemoAction3` ফাংশনে `$request->route('name')`, `$request->route('city')`, এবং `$request->route('code')` ব্যবহার করতে হবে। আপনি চাইলে এগুলোকে ভিন্ন ভেরিয়েবল নামেও সংরক্ষণ করতে পারেন, তবে `$request->route()`-এর মধ্যে অবশ্যই `name`, `city`, এবং `code`-ই লিখতে হবে।

    ```php
    function DemoAction3(Request $request) {
    $n = $request->route('name');   // 'name' এর জন্য ভিন্ন ভেরিয়েবল
    $c = $request->route('city');   // 'city' এর জন্য ভিন্ন ভেরিয়েবল
    $cd = $request->route('code');  // 'code' এর জন্য ভিন্ন ভেরিয়েবল

    return [
    'name' => $n,
    'city' => $c,
    'code' => $cd,
    ];
    }
    ```

    এতে করে আপনি `$request->route()` থেকে সঠিক ভ্যালু পেয়ে তা অন্য ভেরিয়েবলে সংরক্ষণ করতে পারবেন, তবে `$request->route()`-এর মধ্যে অবশ্যই রাউটে ডিফাইন করা প্যারামিটার নামগুলোই দিতে হবে।
    // Third End
     */

    function DemoAction3(Request $request) {

        return [
            $request->name,
            $request->city,
            $request->code,
        ];
    }

    /*
    Laravel যখন রাউট প্যারামিটারগুলোকে ইনজেক্ট করে, তখন $request->name, $request->city, এবং $request->code এর মাধ্যমে সরাসরি অ্যাক্সেস করা সম্ভব। এটি বিশেষভাবে সুবিধাজনক এবং কোডও সংক্ষিপ্ত হয়। তবে $request->route('param_name') পদ্ধতিটি ঐতিহ্যগতভাবে কাজ করে এবং নির্দিষ্ট ক্ষেত্রে দরকার হতে পারে, যেমন যখন নামগুলোর কনফ্লিক্ট হতে পারে।
     */

    //return "Param 1: $param1, Param 2: $param2";

    function DemoAction4() {
        return "this is first request";
    }

    function DemoAction5() {
        return "this is first request";
    }

    function DemoAction6() {
        return "this is first request";
    }

    function DemoAction7() {
        return "this is first request";
    }

    function DemoAction8() {
        return "this is first request";
    }

    function DemoAction9() {
        return "this is first request";
    }

}
