<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRefundsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('refunds', function (Blueprint $table) {
            $table->id();
            $table->string('customer_name', 50);
            $table->string('phone', 50);
            $table->string('email', 50);
            $table->string('address', 50);
            $table->string('invoice_no', 150);
            $table->string('product_name');
            $table->string('product_img');
            $table->string('product_qty');
            $table->string('product_code');
            $table->text('description');
            $table->string('reasons')->default(1)->comment('1=>Ordered Wrong Product, 2=>Received Wrong Product, 3=>Product is damaged & defective, 4=>Others');
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
        Schema::dropIfExists('refunds');
    }
}
