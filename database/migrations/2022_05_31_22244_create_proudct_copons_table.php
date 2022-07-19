<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateProudctCoponsTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('proudct_copons', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 127);
            $table->string('code', 127);
            $table->double('price', 8, 2)->default(0);
            $table->double('discount_price', 8, 2)->nullable()->default(0);
           // $table->string('discount_type', 50)->default('percent');
            $table->integer('discount_type')->unsigned();

            $table->text('description')->nullable();
            $table->text('rules')->nullable();
          //  $table->double('package_items_count', 9, 2)->nullable()->default(0); // added
          //  $table->double('weight', 9, 2)->nullable()->default(0);
          //  $table->string('unit', 127)->nullable(); // added
            $table->boolean('featured')->nullable()->default(0);
            $table->timestamp('ends_at')->nullable();

            $table->boolean('oneplusone')->nullable()->default(0);
            $table->boolean('showoldprice')->nullable()->default(0);
            $table->integer('brand_id')->unsigned();
            $table->boolean('showpercent')->nullable()->default(1); // added
            $table->boolean('showprice')->nullable()->default(1); // added

            $table->boolean('offer')->nullable()->default(1); // added
            $table->integer('restaurant_id')->unsigned();
            $table->integer('category_id')->unsigned();
            $table->timestamps();
       //   $table->foreign('brand_id')->references('id')->on('brands')->onDelete('cascade')->onUpdate('cascade');
      //       $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade')->onUpdate('cascade');
    //    $table->foreign('discount_type')->references('id')->on('discounttypes')->onDelete('cascade')->onUpdate('cascade');

        });
    }

    /**
     * Reverse the migrations.laravel_dasboardgolden/database/migrations/2022_05_31_22244_create_proudct_copons_table.php
     *laravel_dasboardgolden/database/migrations/2021_12_24_233930_create_brands_table.php
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('proudct_copons');
    }
}
