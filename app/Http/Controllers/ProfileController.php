<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

class ProfileController extends Controller {
    public function index() {
        $users = [
            (object) ['id' => 101, 'name' => 'John Doe', 'age' => 25],
            (object) ['id' => 102, 'name' => 'Jane Smith', 'age' => 30],
            (object) ['id' => 103, 'name' => 'Peter Parker', 'age' => 22],
        ];

        return view('user_list', ['users' => $users]);
    }

    public function show(Request $request, $id = null, $name = null, $age = null) {
        // If query string is used, the values will be taken from Request
        $id = $id ?? $request->query('id');
        $name = $name ?? $request->query('name');
        $age = $age ?? $request->query('age');

        // If the request is using query string (search form)
        if ($request->isMethod('get') && $request->has(['id', 'name', 'age'])) {
            return view('search_user', compact('id', 'name', 'age'));
        }

        // If the request is using dynamic URL
        return "User ID: $id, Name: $name, Age: $age";
    }
}
