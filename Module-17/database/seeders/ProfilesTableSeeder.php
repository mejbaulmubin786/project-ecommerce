<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProfilesTableSeeder extends Seeder {
    public function run() {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('profiles')->insert([
                'firstName' => 'FirstName ' . $i,
                'lastName' => 'LastName ' . $i,
                'mobile' => '012345678' . $i,
                'city' => 'City ' . $i,
                'shippingAddress' => 'Address ' . $i,
                'email' => 'user' . $i . '@example.com',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
