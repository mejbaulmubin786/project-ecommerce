<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersTableSeeder extends Seeder {
    public function run() {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('users')->insert([
                'email' => 'user' . $i . '@example.com',
                'otp' => rand(100000, 999999),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
