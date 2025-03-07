import 'package:flutter/material.dart';
import 'package:bijouterie2/models/donnees.dart';
import 'package:bijouterie2/services_api/api_service.dart';

class CardeProvider extends ChangeNotifier {
  late List<Produits> _Card = [];
  List<Produits> get cart => _Card;

  void toggleProduct(Produits produits) async {
    if (_Card.contains(produits)) {
      _Card.firstWhere((p) => p.id == produits.id).quantite++;
    } else {
      _Card.add(produits);
    }
    notifyListeners();
  }

  Future<void> fetchCart() async {
    final apiService = ApiService();
    _Card = await apiService.fetchCart();
    notifyListeners();
  }
}