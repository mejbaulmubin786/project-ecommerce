<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductCartsTableSeeder extends Seeder {
    public function run() {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('product_carts')->insert([
                'email' => 'user' . $i . '@example.com',
                'product_id' => $i,
                'color' => 'Color ' . $i,
                'size' => 'Size ' . $i,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
