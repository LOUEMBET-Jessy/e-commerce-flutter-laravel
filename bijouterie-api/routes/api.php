<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ProduitController;
use App\Http\Controllers\Api\FavoriController;
use App\Http\Controllers\Api\PanierController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::get("/", function(){
    return("Bienvenue sur mon test API");
});

Route::apiResource('produits', ProduitController::class);

// Routes pour les favoris
Route::post('/favoris/toggle', [FavoriController::class, 'toggle']);
Route::get('/favoris', [FavoriController::class, 'index']);

// Routes pour le panier
Route::post('/panier/add', [PanierController::class, 'add']);
Route::get('/panier', [PanierController::class, 'index']);
Route::delete('/panier/remove/{id}', [PanierController::class, 'remove']);

