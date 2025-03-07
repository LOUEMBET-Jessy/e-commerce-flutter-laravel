// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:bijouterie2/models/donnees.dart';
import 'package:bijouterie2/services_api/api_service.dart';
import 'package:bijouterie2/pages/details.dart';
import 'package:bijouterie2/provider/favoris_provider.dart';
import 'package:bijouterie2/provider/panier_provider.dart';
import 'package:bijouterie2/widgets/produits_card.dart';
import 'package:provider/provider.dart';


class Gallerie extends StatefulWidget {
  const Gallerie({super.key});

  @override
  State<Gallerie> createState() => _GallerieState();
}

class _GallerieState extends State<Gallerie> {
  int isSelected = 0;
  late Future<List<Produits>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "Gallerie de produits",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategorieProduits(index: 0, name: "All Produits"),
              _buildCategorieProduits(index: 1, name: "Hommes"),
              _buildCategorieProduits(index: 2, name: "Femmes"),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder<List<Produits>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erreur: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Aucun produit trouvé'));
                } else {
                  return isSelected == 0
                      ? _buildAllProduits(snapshot.data!)
                      : isSelected == 1
                          ? _buildHommesProduits(snapshot.data!)
                          : _buildFemmesProduits(snapshot.data!);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorieProduits({required int index, required String name}) => GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.red : Colors.red.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      );

  Widget _buildAllProduits(List<Produits> products) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final allProduits = products[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsProduit(produits: allProduits),
              ),
            ),
            child: ProduitsCard(produits: allProduits),
          );
        },
      );

  Widget _buildHommesProduits(List<Produits> products) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: products.where((p) => p.categorie == "hommes").length,
        itemBuilder: (context, index) {
          final hommesProduits = products.where((p) => p.categorie == "hommes").toList()[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsProduit(produits: hommesProduits),
              ),
            ),
            child: ProduitsCard(produits: hommesProduits),
          );
        },
      );

  Widget _buildFemmesProduits(List<Produits> products) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: products.where((p) => p.categorie == "femmes").length,
        itemBuilder: (context, index) {
          final femmesProduits = products.where((p) => p.categorie == "femmes").toList()[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsProduit(produits: femmesProduits),
              ),
            ),
            child: ProduitsCard(produits: femmesProduits),
          );
        },
      );
}