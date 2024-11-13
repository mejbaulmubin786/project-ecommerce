<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategoriesTableSeeder extends Seeder {
    public function run() {
        for ($i = 1; $i <= 20; $i++) {
            DB::table('categories')->insert([
                'categoryName' => 'Category ' . $i,
                'categoryImg' => 'https://example.com/category' . $i . '.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
