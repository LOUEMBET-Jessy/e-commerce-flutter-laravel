// ignore_for_file: unused_import

import 'package:flutter/material.dart';


class Produits {
  final int id; // Ajoutez un ID pour identifier chaque produit
  final String titre;
  final double prix;
  final String image;
  final String categorie;
  int quantite;

  Produits({
    required this.id,
    required this.titre,
    required this.prix,
    required this.image,
    required this.categorie,
    this.quantite = 1, // Quantité par défaut à 1
  });

  factory Produits.fromJson(Map<String, dynamic> json) {
    return Produits(
      id: json['id'],
      titre: json['titre'],
      prix: double.tryParse(json['prix'].toString()) ?? 0.0,
      image: json['image'],
      categorie: json['categorie'],
      quantite: json['quantite'] ?? 1,
    );
  }

  //get categorie => null;
}
