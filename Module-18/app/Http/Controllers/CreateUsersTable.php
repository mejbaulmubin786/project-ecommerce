<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('users', function (Blueprint $table) {
            // Primary key
            $table->id();

            // User information
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password');
            $table->string('phone_number')->nullable();

            // Timestamps (created_at, updated_at)
            $table->timestamps();

            // Soft delete (deleted_at)
            $table->softDeletes();

            // Advanced columns
            $table->timestamp('email_verified_at')->nullable();
            $table->rememberToken();

            // Adding indexes for optimization
            $table->index('email');
            $table->index('phone_number');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('users');
    }
}
