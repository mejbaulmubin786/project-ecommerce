<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{

    // categories
    function category()
    {
        return $this->hasMany(Category::class);
    }

    // customer
    function customer()
    {
        return $this->hasMany(Customer::class);
    }

    // product
    function product()
    {
        return $this->hasMany(Product::class);
    }

    // invoices
    function invoice()
    {
        return $this->hasMany(Invoice::class);
    }


    // invoice_product
    function invoice_product()
    {
        return $this->hasMany(InvoiceProduct::class);
    }


    protected $fillable=['firstName','lastName','email','mobile','password','otp'];
    protected $attributes=['otp'=>'0'];


}
