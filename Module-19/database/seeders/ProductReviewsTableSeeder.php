<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductReviewsTableSeeder extends Seeder {
    public function run() {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('product_reviews')->insert([
                'description' => 'Review description ' . $i,
                'email' => 'user' . $i . '@example.com',
                'product_id' => $i,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
