<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BrandsTableSeeder extends Seeder {
    public function run() {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('brands')->insert([
                'brandName' => 'Brand ' . $i,
                'brandImg' => 'https://example.com/brand' . $i . '.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
