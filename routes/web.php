<?php

use App\Http\Controllers\DemoController;
use App\Http\Controllers\FormController;
use Illuminate\Support\Facades\Route;

// ফর্ম দেখানোর Route (GET)

Route::get('/', function () {
    return view('welcome');
});

Route::get('/con', [DemoController::class, 'DemoAction']);

Route::get('/form', [FormController::class, 'showForm'])->name('form.show');

// ফর্ম সাবমিটের Route (POST)
Route::post('/form', [FormController::class, 'handleSubmit'])->name('form.submit');
