Here is the code representation of the 10 tables from your ER diagram, based on the image you provided and the previous details of your database structure:

### 1. Users Table
```php
$table->id();
$table->string('email', 50)->unique();
$table->string('otp', 10);
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

### 2. Profiles Table
```php
$table->id();
$table->string('firstName', 50);
$table->string('lastName', 50);
$table->string('mobile', 50);
$table->string('city', 50);
$table->string('shippingAddress', 1000);
$table->string('email', 50)->unique();
$table->foreign('email')->references('email')->on('users')
      ->restrictOnDelete()
      ->cascadeOnUpdate();
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

### 3. Categories Table
```php
$table->id();
$table->string('categoryName', 50);
$table->string('categoryImg', 300);
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

### 4. Brands Table
```php
$table->id();
$table->string('brandName', 50);
$table->string('brandImg', 300);
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

### 5. Products Table
```php
$table->id();
$table->string('title', 150);
$table->string('short_des', 255);
$table->decimal('price', 8, 2);
$table->tinyInteger('discount')->nullable();
$table->decimal('discount_price', 8, 2)->nullable();
$table->string('image', 300);
$table->tinyInteger('stock')->default(1);
$table->double('star')->nullable();
$table->enum('remark', ['featured', 'bestseller', 'new'])->nullable();
$table->bigInteger('category_id')->unsigned();
$table->bigInteger('brand_id')->unsigned();
$table->foreign('category_id')->references('id')->on('categories');
$table->foreign('brand_id')->references('id')->on('brands');
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

### 6. Product Details Table
```php
$table->id();
$table->string('img1', 300);
$table->string('img2', 300);
$table->string('img3', 300);
$table->longText('description');
$table->string('color', 50);
$table->bigInteger('product_id')->unsigned();
$table->foreign('product_id')->references('id')->on('products')->cascadeOnDelete();
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

### 7. Product Carts Table
```php
$table->id();
$table->string('email', 50);
$table->bigInteger('product_id')->unsigned();
$table->string('color', 50);
$table->string('size', 50);
$table->foreign('product_id')->references('id')->on('products')->cascadeOnDelete();
$table->foreign('email')->references('email')->on('users')->cascadeOnDelete();
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

### 8. Product Wishes Table
```php
$table->id();
$table->string('email', 50);
$table->bigInteger('product_id')->unsigned();
$table->foreign('product_id')->references('id')->on('products')->cascadeOnDelete();
$table->foreign('email')->references('email')->on('users')->cascadeOnDelete();
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

### 9. Product Reviews Table
```php
$table->id();
$table->text('description');
$table->string('email', 50);
$table->bigInteger('product_id')->unsigned();
$table->foreign('email')->references('email')->on('users')->cascadeOnDelete();
$table->foreign('product_id')->references('id')->on('products')->cascadeOnDelete();
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

### 10. Product Sliders Table
```php
$table->id();
$table->string('title', 150);
$table->string('short_des', 255);
$table->string('image', 300);
$table->bigInteger('product_id')->unsigned();
$table->foreign('product_id')->references('id')->on('products')->cascadeOnDelete();
$table->timestamp('created_at')->useCurrent();
$table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
```

These tables are created in Laravel migration format based on the diagram provided. Each relationship is defined, including `foreign key` constraints and cascade rules (on delete or update). Let me know if any adjustments are needed!
