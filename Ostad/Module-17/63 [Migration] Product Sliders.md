এবার আমরা আলোচনা করবো Product Sliders নিয়ে প্রোডাক্ট ডিটেইলস যেমন এটি ও ঠিক তেমন। একটি প্রোডাক্ট এর বিপরিতে একটাই স্লাইডাস থাকবে।

```php
$table->id();
$table->string('title', 200);
$table->string('short_des', 500);
$table->string('image', 200);
$table->unsignedBigInteger('product_id')->unique();
$table->foreign('product_id')->references('id')->on('products')  

    ->restrictOnDelete()
    ->restrictOnUpdate();
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```
