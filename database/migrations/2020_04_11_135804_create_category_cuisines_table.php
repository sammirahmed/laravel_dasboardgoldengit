<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCategoryCuisinesTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('maincategories_cuisines', function (Blueprint $table) {
            $table->integer('maincategories_id')->unsigned();
            $table->integer('cuisines_id')->unsigned();
            $table->primary([ 'maincategories_id','cuisines_id']);
            $table->foreign('maincategories_id')->references('id')->on('main_categories')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('cuisines_id')->references('id')->on('cuisines')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('restaurant_fields');
    }
}
