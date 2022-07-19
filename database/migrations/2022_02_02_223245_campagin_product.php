<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CampaginProduct extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('camp_product', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('product_id')->unsigned();
            $table->integer('camp_id')->unsigned();
            $table->integer('quantity')->unsigned()->nullable()->default(0);
            $table->integer('initquantity')->unsigned()->nullable()->default(0);
            $table->timestamps();
            $table->foreign('camp_id')->references('id')->on('campagins')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('product_id')->references('id')->on('pruducts')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
        Schema::drop('camp_product');
    }
}
