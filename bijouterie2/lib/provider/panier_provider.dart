import 'package:flutter/material.dart';
import 'package:bijouterie2/models/donnees.dart';
import 'package:bijouterie2/services_api/api_service.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PanierProvider extends ChangeNotifier {
  List<Produits> _cart = [];
  List<Produits> get cart => _cart;

  // Méthode `of` mise à jour
  static PanierProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<PanierProvider>(context, listen: listen);
  }

  final ApiService apiService = ApiService();

  Future<void> fetchCart() async {
    final response = await http.get(Uri.parse('${apiService.baseUrl}/panier'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _cart = data.map((json) => Produits.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load cart');
    }
  }

  Future<void> toggleProduit(Produits produit) async {
    await apiService.addToCart(produit.id, 1);
    if (_cart.contains(produit)) {
      _cart.firstWhere((p) => p.id == produit.id).quantite++;
    } else {
      _cart.add(produit);
    }
    notifyListeners();
  }

  // Ajoutez ces méthodes
  void incrementQuantite(int index) {
    _cart[index].quantite++;
    notifyListeners();
  }

  void decrementQuantite(int index) {
    if (_cart[index].quantite > 1) {
      _cart[index].quantite--;
    } else {
      _cart.removeAt(index);
    }
    notifyListeners();
  }

  // Ajoutez cette méthode
  double getTotalPrice() {
    double total = 0.0;
    for (var product in _cart) {
      total += product.prix * product.quantite;
    }
    return total;
  }
}