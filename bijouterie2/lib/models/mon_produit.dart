// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'donnees.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  Future<List<Produits>> fetchProductsByCategory(String categorie) async {
    final response = await http.get(Uri.parse('$baseUrl/produits/$categorie'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Produits.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products by category');
    }
  }
}