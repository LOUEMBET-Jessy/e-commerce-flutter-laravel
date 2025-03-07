<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produit extends Model
{
    use HasFactory;

    protected $fillable = ["titre", "prix", "image", "categorie"];

    // Définir la relation avec le modèle Favori
    public function favoris()
    {
        return $this->hasMany(Favori::class);
    }

    // Définir la relation avec le modèle Favori
    public function panier()
    {
        return $this->hasMany(Panier::class);
    }
}
