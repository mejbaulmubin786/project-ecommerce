<?php

use App\Http\Controllers\DemoController;
use App\Http\Controllers\FormController;
use App\Http\Controllers\PracticeParameterController;
use App\Http\Controllers\PramController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

// ফর্ম দেখানোর Route (GET)

Route::get('/', function () {
    return view('welcome');
});

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
