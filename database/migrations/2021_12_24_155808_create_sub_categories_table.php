<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSubCategoriesTable extends Migration
{

    /**laravel_test/database/migrations/2021_12_24_155808_create_sub_categories_table.php
     * Run the migrations.
     *
     * @return void  main_categories
     */
    public function up()
    {
        Schema::create('sub_categories', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('main_categories_id');
            $table->string('name', 127);
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('sub_categories');
    }
}
