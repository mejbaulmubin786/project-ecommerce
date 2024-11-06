<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

// It's good to include the base Controller

class DemoController extends Controller {
    function DemoAction(Request $request) {
        $result = DB::table('brands')->insert($request->input()); // আমরা যদি জেসন বডি দিয়ে ডাটা পোস্ট করি তবে আমরা অবশ্যই insert মেথড ব্যবহার করবো।

        return $result;
    }
}
