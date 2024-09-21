<?php

use App\Http\Controllers\DemoController;
use App\Http\Controllers\FormController;
use App\Http\Controllers\PramController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

// ফর্ম দেখানোর Route (GET)

Route::get('/', function () {
    return view('welcome');
});

Route::get('/con', [DemoController::class, 'DemoAction']);

Route::get('/about/{name}/{age}', [PramController::class, 'PramAction']);

Route::get('/form', [FormController::class, 'showForm'])->name('form.show');

// ফর্ম সাবমিটের Route (POST)
Route::post('/form', [FormController::class, 'handleSubmit'])->name('form.submit');

Route::post('/form', function () {
    return view('form');
});

Route::match(['get', 'post'], '/submit-form', [UserController::class, 'submit']);
