<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductsTableSeeder extends Seeder {
    public function run() {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('products')->insert([
                'title' => 'Product ' . $i,
                'short_des' => 'This is the description for product ' . $i,
                'price' => rand(100, 500),
                'discount' => rand(5, 20),
                'discount_price' => rand(80, 450),
                'image' => 'https://example.com/product' . $i . '.jpg',
                'stock' => true,
                'star' => rand(1, 5),
                'remark' => 'popular',
                'category_id' => rand(1, 10),
                'brand_id' => rand(1, 10),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
