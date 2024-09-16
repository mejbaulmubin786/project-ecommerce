<?php

use App\Http\Controllers\DemoController;
use App\Http\Controllers\GreetingController;
use App\Http\Controllers\JsonController;
use App\Http\Controllers\ParaController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/hello', [DemoController::class, 'DemoAction']);

Route::get('/hello/{name}/{age}', [ParaController::class, 'ParaAction']);

Route::get('/about', [JsonController::class, 'JsonAction']);

Route::get('/greet', [GreetingController::class, 'showGreeting']);
Route::post('/submit', [FormController::class, 'handleForm']);
