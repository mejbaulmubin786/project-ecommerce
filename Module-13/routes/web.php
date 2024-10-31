<?php

use App\Http\Controllers\DemoController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

// Response
Route::get('/practice', [DemoController::class, 'DemoAction1']);

//Route Parameters সরাসরি ফাংশনে ইনজেকশন করে রিসিভ করা
Route::get('/urlpractice1/{name}/{city}/{code}', [DemoController::class, 'DemoAction2']);

//Request Object ব্যবহার করে প্যারামিটার রিসিভ করা
Route::get('/urlpractice2/{name}/{city}/{code}', [DemoController::class, 'DemoAction3']);
Route::get("/demo1", [ProductController::class, 'Demo1']);
Route::get("/demo2", [ProductController::class, 'Demo2']);

// Request

Route::get("/ostad1/{name}/{city}/{code}", [ProductController::class, 'OSTAD1']);
Route::post("/ostad2", [ProductController::class, 'OSTAD2']);
Route::post("/ostad3", [ProductController::class, 'OSTAD3']);
Route::post("/ostad4", [ProductController::class, 'OSTAD4']);
