<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductSlidersTableSeeder extends Seeder {
    public function run() {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('product_sliders')->insert([
                'title' => 'Slider for Product ' . $i,
                'short_des' => 'Short description for slider ' . $i,
                'image' => 'https://example.com/slider' . $i . '.jpg',
                'product_id' => $i,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
