<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\PracticeController;
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'page']);

Route::get('/country/{name}/{divition}', [PracticeController::class, 'practice']);
