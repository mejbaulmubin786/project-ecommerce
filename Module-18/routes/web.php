<?php

use App\Http\Controllers\DemoController;
use Illuminate\Support\Facades\Route;

Route::post('/', [DemoController::class, 'DemoAction']);
