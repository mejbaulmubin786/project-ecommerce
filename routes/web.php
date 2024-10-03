<?php

use App\Http\Controllers\DemoController;
use App\Http\Middleware\CheckRequestDetails;
use Illuminate\Support\Facades\Route;

// Route::get('/hello1/{key}', [DemoController::class, 'DemoAction1'])->middleware([CheckRequestDetails::class]);
// Route::get('/hello2/{key}', [DemoController::class, 'DemoAction2'])->middleware([CheckRequestDetails::class]);
// Route::get('/hello3/{key}', [DemoController::class, 'DemoAction3'])->middleware([CheckRequestDetails::class]);
// Route::get('/hello4/{key}', [DemoController::class, 'DemoAction4'])->middleware([CheckRequestDetails::class]);
// Route::get('/hello5/{key}', [DemoController::class, 'DemoAction5'])->middleware([CheckRequestDetails::class]);

Route::get('/hello', [DemoController::class, 'DemoAction'])->middleware([CheckRequestDetails::class]);

// ফর্ম দেখানোর Route (GET)

Route::get('/', function () {
    return view('welcome');
});
/*
Route::get('/con', [DemoController::class, 'DemoAction']);

Route::get('/about', [PramController::class, 'PramAction']);

Route::get('/form', [FormController::class, 'showForm'])->name('form.show');

// ফর্ম সাবমিটের Route (POST)
Route::post('/form', [FormController::class, 'handleSubmit'])->name('form.submit');

Route::post('/form', function () {
return view('form');
});

Route::match(['get', 'post'], '/submit-form', [UserController::class, 'submit']);

Route::get('/countrylist/{country}', [PracticeParameterController::class, 'practiceparamitar']);

Route::match(['get', 'post'], '/pra-form', [FormController::class, 'submit']);

Route::get('/hello', [DemoController::class, 'DemoAction']);

Route::post("/demo1", [ProductController::class, 'Demo1']);
Route::get("/demo2", [ProductController::class, 'Demo2']);
Route::get("/demo3", [ProductController::class, 'Demo3']);

Route::get('/test', [GreetingsController::class, 'sayHi']);

Route::post('/form-submit', function (Request $request) {

$email = $request->input('email');

if ($email) {

return response()->json([
"status" => "success",
"message" => "Form submitted successfully.",
"email" => $email,
]);

} else {

return response()->json([
"status" => "failed",
"message" => "Form submission failed.",
]);

}

});

Route::get('/client-ip', function (Request $request) {

$clientIp = $request->ip();

return $clientIp;

});

Route::get('/DemoAction/{num1}/{num2}', [DemoController::class, 'DemoAction']);

Route::get('/users', [ProfileController::class, 'index'])->name('user.list');
Route::get('/profile/{id}/{name}/{age}', [ProfileController::class, 'show'])->name('user.profile');
Route::get('/profile', [ProfileController::class, 'show'])->name('user.search');

Route::get('/StoringData/{email}', [DemoController::class, 'StoringData']);
Route::get('/RetrievingData', [DemoController::class, 'RetrievingData']);
Route::get('/DeletingData', [DemoController::class, 'DeletingData']);
Route::get('/FlashData', [DemoController::class, 'FlashData']);

Route::get('/post/{id?}/commet/{commetnid?}', function (string $id = null, string $comment = null) {
if ($id) {
return "<h1>Post ID: " . $id . "</h1><h2>Post ID: " . $comment . "</h2>";
} else {
return "No data found";
}
});

Route::get('/search', function () {
return "Mejbaul Mubin";
});

Route::get('/country/{countryname}', [DemoController::class, 'DemoAction']);

Route::get('/hellow/{name?}/{age?}', [DemoController::class, 'DemoActionOp']);

Route::get('/products/{category}/{id}', function ($category, $id) {
// প্রথম segment 'products'
$segmentOne = request()->segment(1); // 'products'
// দ্বিতীয় segment হল ক্যাটাগরি
$segmentTwo = request()->segment(2); // $category
// তৃতীয় segment হল পণ্য ID
$segmentThree = request()->segment(3); // $id

// এখানে লজিক যুক্ত করা হচ্ছে
if ($segmentOne === 'products') {
return "{$segmentOne} আপনি $segmentTwo ক্যাটাগরির পণ্যটি দেখতে চান, যার ID হল $segmentThree";
} else {
return "দুঃখিত, অনুগ্রহ করে সঠিক URL ব্যবহার করুন।";
}
});

Route::post('/bodypractice', [DemoController::class, 'BodyPractice']);
 */
