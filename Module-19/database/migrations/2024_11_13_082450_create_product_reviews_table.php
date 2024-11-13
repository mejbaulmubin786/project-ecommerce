<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('product_reviews', function (Blueprint $table) {
            $table->id();
            $table->string('description', 1000);
            $table->string('email', 50);
            $table->foreign('email')->references('email')->on('profiles')
                ->restrictOnDelete()
                ->restrictOnUpdate();
            $table->unsignedBigInteger('product_id');
            $table->foreign('product_id')->references('id')->on('products')
                ->restrictOnDelete()
                ->restrictOnUpdate();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down() {
        Schema::dropIfExists('product_reviews');
    }
};
