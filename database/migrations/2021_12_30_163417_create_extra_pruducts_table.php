<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateExtraPruductsTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('extra_pruducts', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 127);
            $table->text('description')->nullable();
            $table->double('price', 8, 2)->nullable()->default(0);
            $table->integer('product_id')->unsigned();
            $table->integer('extra_group_id')->unsigned();
            $table->timestamps();
            $table->foreign('product_id')->references('id')->on('pruducts')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('extra_group_id')->references('id')->on('extra_group_prouducts')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('extra_pruducts');
    }
}
