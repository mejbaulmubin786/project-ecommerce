<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('product_reviews', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->string('comment', 1000);
            $table->string('email', 50);
            $table->float('rating');

            $table->foreign('product_id')->references('id')->on('products')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->foreign('email')->references('email')->on('users')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down() {
        Schema::dropIfExists('product_reviews');
    }
};
