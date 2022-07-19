<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMainCategoriesTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('main_categories', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 127);

            $table->string('text_color', 36)->nullable();
            $table->string('image_color', 36)->nullable();
            $table->boolean('offer')->nullable()->default(1); // added

            $table->string('background_color', 36)->nullable();
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
        Schema::drop('main_categories');
    }
}
