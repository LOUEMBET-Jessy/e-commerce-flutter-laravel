import 'package:flutter/material.dart';
import 'package:bijouterie2/models/donnees.dart';
import 'package:bijouterie2/services_api/api_service.dart';

class RechercherPage extends StatefulWidget {
  const RechercherPage({super.key});

  @override
  State<RechercherPage> createState() => _RechercherPageState();
}

class _RechercherPageState extends State<RechercherPage> {
  late Future<List<Produits>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Produits>>(
      future: futureProducts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Aucun produit trouvé'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Produits product = snapshot.data![index];
              return ListTile(
                title: Text(product.titre),
                subtitle: Text('${product.prix} FCFA'),
                leading: Image.network(product.image),
              );
            },
          );
        }
      },
    );
  }
}