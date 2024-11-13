<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('product_carts', function (Blueprint $table) {
            $table->id();
            $table->string('email', 50);
            $table->unsignedBigInteger('product_id');
            $table->string('color', 200);
            $table->string('size', 200);

            $table->foreign('product_id')->references('id')->on('products')
                ->restrictOnDelete()
                ->restrictOnUpdate();

            $table->foreign('email')->references('email')->on('profiles')

                ->restrictOnDelete()
                ->restrictOnUpdate();

            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down() {
        Schema::dropIfExists('product_carts');
    }
};
