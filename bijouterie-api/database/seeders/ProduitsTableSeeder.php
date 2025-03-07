<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Produit;

class ProduitsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        // Produits pour la catégorie "all"
        $produitsAll = [
            [
                'titre' => 'Bague argenté',
                'prix' => 32000,
                'image' => 'assets/images/bijou (3).jpeg',
                'categorie' => 'all',
            ],
            [
                'titre' => 'Boucle chainé',
                'prix' => 20000,
                'image' => 'assets/images/bijoux (6).jpeg',
                'categorie' => 'all',
            ],
            [
                'titre' => 'Colier en or massif',
                'prix' => 65000,
                'image' => 'assets/images/bijoux (2).jpeg',
                'categorie' => 'all',
            ],
            [
                'titre' => 'Colier de perles',
                'prix' => 10000,
                'image' => 'assets/images/bijoux (10).jpeg',
                'categorie' => 'all',
            ],
            [
                'titre' => 'Ensemble dorée',
                'prix' => 100000,
                'image' => 'assets/images/bijoux (8).jpeg',
                'categorie' => 'all',
            ],
            [
                'titre' => 'Ensemble bagues',
                'prix' => 50000,
                'image' => 'assets/images/bijoux (7).jpeg',
                'categorie' => 'all',
            ],
            [
                'titre' => 'Bracelet argenté',
                'prix' => 65000,
                'image' => 'assets/images/bijoux (9).jpeg',
                'categorie' => 'all',
            ],
            [
                'titre' => 'Bracelet hipie',
                'prix' => 20000,
                'image' => 'assets/images/bijoux (1).jpeg',
                'categorie' => 'all',
            ],
        ];

        // Produits pour la catégorie "femmes"
        $produitsFemmes = [
            [
                'titre' => 'Bague en or',
                'prix' => 32000,
                'image' => 'assets/images/Femmes/802ad4bf-80da-4634-a4dd-6a1b8c1182b1.jpeg',
                'categorie' => 'femmes',
            ],
            [
                'titre' => 'Bagues',
                'prix' => 20000,
                'image' => 'assets/images/Femmes/bagues.jpeg',
                'categorie' => 'femmes',
            ],
            [
                'titre' => 'Clochet de Luxe',
                'prix' => 65000,
                'image' => 'assets/images/Femmes/Closet Luxe.jpeg',
                'categorie' => 'femmes',
            ],
            [
                'titre' => 'Evil Eye Bracelets',
                'prix' => 10000,
                'image' => 'assets/images/Femmes/Evil Eye Bracelets.jpeg',
                'categorie' => 'femmes',
            ],
            [
                'titre' => 'Gold Bangles',
                'prix' => 100000,
                'image' => 'assets/images/Femmes/Gold Bangles Design.jpeg',
                'categorie' => 'femmes',
            ],
            [
                'titre' => 'Heart Charm Bracelet',
                'prix' => 50000,
                'image' => 'assets/images/Femmes/Heart Charm Bracelet.jpeg',
                'categorie' => 'femmes',
            ],
            [
                'titre' => 'Boucles en diamand',
                'prix' => 65000,
                'image' => 'assets/images/Femmes/Temperament Moon Pearl Cat Dangle EarringsTwo cats _ Gold.jpeg',
                'categorie' => 'femmes',
            ],
        ];

        // Produits pour la catégorie "hommes"
        $produitsHommes = [
            [
                'titre' => 'Montre connectée',
                'prix' => 40000,
                'image' => 'assets/images/Hommes/miband.jpg',
                'categorie' => 'hommes',
            ],
            [
                'titre' => 'Montre Titan',
                'prix' => 50000,
                'image' => 'assets/images/Hommes/watch.png',
                'categorie' => 'hommes',
            ],
            [
                'titre' => 'Ecouteur sans fil',
                'prix' => 65000,
                'image' => 'assets/images/Hommes/wireless.png',
                'categorie' => 'hommes',
            ],
        ];

        // Insérer les produits dans la base de données
        Produit::insert($produitsAll);
        Produit::insert($produitsFemmes);
        Produit::insert($produitsHommes);
    }
}
