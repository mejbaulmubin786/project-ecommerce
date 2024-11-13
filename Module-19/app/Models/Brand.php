<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model {
    protected $fillable = ['brandName', 'brandImg']; // fillable এর মাঝে মুল ত আমরা বলে দিবো আমরা কোন কলাম গুলোকে আমরা একচুয়ালি ফিল করতে চাচ্ছি। এখানে আমাদের একট কলাম এর নাম হচ্চে 'brandName', 'brandImg' এই দুটি কলাম কে আমি ফিল করতে চাচ্ছি।
    use HasFactory;
}
