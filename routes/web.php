<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
 */

Route::get('/', function () {
    return view('welcome');
});

// routes/web.php
Route::get('/home', function () {
    return view('home'); // 'home' হলো view ফাইলের নাম ('.blade.php' বাদ দিয়ে)
});

// routes/web.php
Route::get('/welcome', function () {
    return '<h1>স্বাগতম Laravel প্রজেক্টে!</h1>';
});

// routes/web.php
Route::get('/info', function () {
    return view('about'); // এখানে 'about' হলো view ফাইলের নাম ('.blade.php' বাদ দিয়ে)
});

Route::view('forpost', '/post');

Route::view('registration', '/form');
