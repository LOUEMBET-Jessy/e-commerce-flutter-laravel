<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Panier;

class PanierController extends Controller
{
    // Ajouter un produit au panier
    public function add(Request $request)
    {
        $request->validate([
            'produit_id' => 'required|exists:produits,id',
            'quantite' => 'required|integer|min:1',
        ]);

        $panier = Panier::where('produit_id', $request->produit_id)->first();

        if ($panier) {
            $panier->quantite += $request->quantite;
            $panier->save();
        } else {
            Panier::create([
                'produit_id' => $request->produit_id,
                'quantite' => $request->quantite,
            ]);
        }

        return response()->json(['message' => 'Produit ajouté au panier']);
    }

    // Récupérer les éléments du panier
    public function index()
    {
        $panier = Panier::with('produit')->get();
        return response()->json($panier);
    }

    // Supprimer un élément du panier
    public function remove($id)
    {
        $panier = Panier::find($id);

        if ($panier) {
            $panier->delete();
            return response()->json(['message' => 'Produit retiré du panier']);
        }

        return response()->json(['message' => 'Produit non trouvé'], 404);
    }
}
