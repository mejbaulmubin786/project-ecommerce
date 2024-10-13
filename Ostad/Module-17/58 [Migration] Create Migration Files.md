এবার আমাদের ERD ডায়াগ্রাম অনুসারে ডাটাবেইজটি তৈরি করবো। এখন আমাদের যতো গুলো টেবিল আছে ঠিক ততো গুলো মাইগ্রেশন ফাইল তৈরি করে নিতে হবে। আমাদের এই প্রোজেক্ট এর জন্য 10 টি টেবিল আছে।

```bash
php artisan make:migration create_users
php artisan make:migration create_profiles
php artisan make:migration create_categories
php artisan make:migration create_brands
php artisan make:migration create_products
php artisan make:migration create_product_details
php artisan make:migration create_product_sliders
php artisan make:migration create_product_reviews
php artisan make:migration create_product_wishes
php artisan make:migration create_product_carts
```
