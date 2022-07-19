<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductPharmStorageTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pro_pham_stor', function (Blueprint $table) {
            $table->integer('product_id')->unsigned();
            $table->integer('pharm_id')->unsigned();
            $table->integer('quantity')->unsigned()->nullable()->default(0);
            $table->integer('initquantity')->unsigned()->nullable()->default(0);
            $table->timestamps();
            $table->foreign('pharm_id')->references('id')->on('pharmcies')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::drop('pro_pham_stor');

    }
}
