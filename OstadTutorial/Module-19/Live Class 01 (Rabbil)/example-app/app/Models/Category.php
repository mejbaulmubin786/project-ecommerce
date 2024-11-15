<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    // User
    function user()
    {
       return $this->belongsTo(User::class);
    }



    // Product
    function product()
    {
       return $this->hasMany(Product::class);
    }



}
