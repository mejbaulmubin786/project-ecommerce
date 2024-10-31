<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductController extends Controller {

    // Laravel Response

    function Demo1() {

        // return "Demo1"; // String
        // return 1; // Int
        // return null; // Null
        //  return false; // Boolean True=1 False=empty
        //return ['a','b','c']; // Array
        // return ['batch'=>4,'course'=>'Laravel']; // Assoc

        /* return [
        ['batch'=>4,'course'=>'Laravel'],
        ['batch'=>4,'course'=>'Laravel']
        ]; // Mul Assoc
         */

        // return redirect("/demo2"); // Redirect

        // return response()->file("img.png"); // BLOB

        // return response()->download("img.png");

    }

    function Demo2() {
        return "I am demo 02";
    }

    // Laravel Request
    function OSTAD1(Request $request) {
        $name = $request->name;
        $city = $request->city;
        $code = $request->code;
        return [$name, $city, $code];
    }

    function OSTAD2(Request $request) {
        return $request->input('lname');
    }

    function OSTAD3(Request $request) {
        return $request->header();
    }

    function OSTAD4(Request $request) {
        return $request->query('id3');
    }

}
