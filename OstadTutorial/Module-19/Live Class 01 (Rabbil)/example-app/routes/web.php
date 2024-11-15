<?php

use App\Http\Controllers\DemoController;
use Illuminate\Support\Facades\Route;

Route::get("/demo1",[DemoController::class,'demo1']);

Route::post("/demo2",[DemoController::class,'demo2']);

Route::post("/demo3/{id}",[DemoController::class,'demo3']);

Route::post("/demo4/{id}",[DemoController::class,'demo4']);
