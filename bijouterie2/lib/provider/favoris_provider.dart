import 'package:flutter/material.dart';
import 'package:bijouterie2/models/donnees.dart';
import 'package:bijouterie2/services_api/api_service.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class FavoriteProvider extends ChangeNotifier {
  List<Produits> _favoris = [];
  List<Produits> get favoris => _favoris;

  final ApiService apiService = ApiService();

  Future<void> fetchFavoris() async {
    final response = await http.get(Uri.parse('${apiService.baseUrl}/favoris'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _favoris = data.map((json) => Produits.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load favoris');
    }
  }

  Future<void> toggleFavoris(Produits produit) async {
    await apiService.toggleFavori(produit.id);
    if (_favoris.contains(produit)) {
      _favoris.remove(produit);
    } else {
      _favoris.add(produit);
    }
    notifyListeners();
  }

  bool isExist(Produits produit) {
    return _favoris.contains(produit);
  }

  // Ajoutez cette méthode
  void removeFromFavoris(Produits product) {
    _favoris.remove(product);
    notifyListeners();
  }

  // Méthode `of` mise à jour
  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}