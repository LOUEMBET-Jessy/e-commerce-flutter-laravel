<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::create('produits', function (Blueprint $table) {
        $table->id();
        $table->string('titre');
        $table->decimal('prix', 8, 2);
        $table->string('image');
        $table->string('categorie')->nullable(); // Pour gérer les catégories (Hommes, Femmes, etc.)
        $table->timestamps();
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('produits');
    }
};
