<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Favori;

class FavoriController extends Controller
{

    // Ajouter ou retirer un produit des favoris
    public function toggle(Request $request)
    {
        $request->validate([
            'produit_id' => 'required|exists:produits,id',
        ]);

        $favori = Favori::where('produit_id', $request->produit_id)->first();

        if ($favori) {
            $favori->delete();
            return response()->json(['message' => 'Produit retiré des favoris']);
        } else {
            Favori::create([
                'produit_id' => $request->produit_id,
            ]);
            return response()->json(['message' => 'Produit ajouté aux favoris']);
        }
    }

    // Récupérer les favoris
    public function index()
    {
        $favoris = Favori::with('produit')->get();
        return response()->json($favoris);
    }

}
