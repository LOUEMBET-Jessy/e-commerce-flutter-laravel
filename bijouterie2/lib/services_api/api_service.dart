import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/donnees.dart';

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000/api";

  Future<List<Produits>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/produits'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Produits.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Produits>> fetchProductsByCategory(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/produits/$category'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Produits.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products by category');
    }
  }

  Future<void> toggleFavori(int produitId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/favoris/toggle'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'produit_id': produitId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to toggle favori');
    }
  }

  Future<void> addToCart(int produitId, int quantite) async {
    final response = await http.post(
      Uri.parse('$baseUrl/panier/add'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'produit_id': produitId,
        'quantite': quantite,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add to cart');
    }
  }

  Future<List<Produits>> fetchCart() async {
    final response = await http.get(Uri.parse('$baseUrl/panier'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Produits.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch cart');
    }
  }

  Future<List<Produits>> fetchFavoris() async {
    final response = await http.get(Uri.parse('$baseUrl/favoris'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Produits.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch favoris');
    }
  }

  //fetchCart() {}

  //fetchFavoris() {}
}