<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder {
    public function run() {
        $this->call([
            UsersTableSeeder::class,
            BrandsTableSeeder::class,
            CategoriesTableSeeder::class,
            ProfilesTableSeeder::class,
            ProductsTableSeeder::class,
            ProductDetailsTableSeeder::class,
            ProductSlidersTableSeeder::class,
            ProductReviewsTableSeeder::class,
            ProductWishesTableSeeder::class,
            ProductCartsTableSeeder::class,
        ]);
    }
}
