// ignore_for_file: unused_import

import 'package:bijouterie2/pages/panier_page.dart';
import 'package:flutter/material.dart';
import 'package:bijouterie2/models/donnees.dart';
import 'package:bijouterie2/services_api/api_service.dart';
import 'package:provider/provider.dart';
import 'package:bijouterie2/provider/panier_provider.dart';

class DetailsProduit extends StatelessWidget {
  final Produits produits;
  const DetailsProduit({super.key, required this.produits});

  @override
  Widget build(BuildContext context) {
    final provider = PanierProvider.of(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.shade100,
                ),
                child: Image.network(produits.image, fit: BoxFit.cover),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Text(
                  produits.titre.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Prix: ${produits.prix}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Les ${produits.titre} offrent une expérience audio inégalée."
                  " Avec une qualité sonore cristalline et une réduction de bruit active, "
                  "vous pouvez vous immerger dans votre musique sans distractions. "
                  "Leur design ergonomique assure un confort optimal, même après de longues heures d’utilisation."
                  " De plus, ils sont résistants à l’eau et à la sueur, "
                  "ce qui les rend parfaits pour une utilisation lors d’activités sportives.",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Text(
                'Prix: ${produits.prix}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  provider.toggleProduit(produits);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PanierPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Ajouter au panier"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}