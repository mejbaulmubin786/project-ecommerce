<?php

namespace App\Http\Controllers;
use Exception;
use App\Models\Category;
use App\Models\Invoice;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DemoController extends Controller
{
    //
    function demo1()
    {

      // DB::table('products')==Product
       return Category::with(['user','product'])->get();
    }


    function demo2( Request $request)
    {

        DB::beginTransaction(); // Database Session Create
        try {

            $data=$request->input();
            foreach ($data as $item){
                User::create(
                    [
                        'firstName'=>$item['firstName'],
                        'lastName'=>$item['lastName'],
                        'email'=>$item['email'],
                        'mobile'=>$item['mobile'],
                        'password'=>$item['password'],
                    ]
                );
            }

            DB::commit(); // Session Will Confirm All of Your Actions
            return "OK";

        }catch (Exception $e){
            DB::rollBack(); // Session Will Roll Back Your All of Actions
            return "NOT OK";
        }





    }

    function demo3( Request $request)
    {
        $id=$request->id;
        $body=$request->input();

         return User::where('id',$id)->update($body);
       // return $body;


    }


    function demo4(Request $request)
    {
        $id=$request->id;
        return User::where('id',$id)->delete();

    }



}
