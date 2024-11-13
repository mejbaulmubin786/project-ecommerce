<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductWishesTableSeeder extends Seeder {
    public function run() {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('product_wishes')->insert([
                'email' => 'user' . $i . '@example.com',
                'product_id' => $i,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
