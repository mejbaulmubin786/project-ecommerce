<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductDetailsTableSeeder extends Seeder {
    public function run() {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('product_details')->insert([
                'img1' => 'https://example.com/product_detail' . $i . '_1.jpg',
                'img2' => 'https://example.com/product_detail' . $i . '_2.jpg',
                'img3' => 'https://example.com/product_detail' . $i . '_3.jpg',
                'img4' => 'https://example.com/product_detail' . $i . '_4.jpg',
                'des' => 'Detailed description for product ' . $i,
                'color' => 'Color ' . $i,
                'size' => 'Size ' . $i,
                'product_id' => $i,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
