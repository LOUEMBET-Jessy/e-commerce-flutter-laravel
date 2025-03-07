import 'package:flutter/material.dart';
import 'package:bijouterie2/models/donnees.dart';
import 'package:bijouterie2/services_api/api_service.dart';
import 'package:provider/provider.dart';
import 'package:bijouterie2/provider/panier_provider.dart';
import 'package:bijouterie2/provider/favoris_provider.dart';

class ListeProduits extends StatefulWidget {
  const ListeProduits({Key? key}) : super(key: key);

  @override
  State<ListeProduits> createState() => _ListeProduitsState();
}

class _ListeProduitsState extends State<ListeProduits> {
  late Future<List<Produits>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService().fetchProducts();
  }

  Future<void> _showMyDialog(Produits product) async {
    final panierProvider = Provider.of<PanierProvider>(context, listen: false);
    final favorisProvider = Provider.of<FavoriteProvider>(context, listen: false);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Détails de l\'article'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.network(product.image),
                Text('Nom de l\'article: ${product.titre}'),
                Text('Prix de l\'article: ${product.prix} FCFA'),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                panierProvider.toggleProduit(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.titre} ajouté au panier')),
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
            IconButton(
              onPressed: () {
                favorisProvider.toggleFavoris(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(favorisProvider.isExist(product)
                        ? '${product.titre} retiré des favoris'
                        : '${product.titre} ajouté aux favoris'),
                  ),
                );
              },
              icon: Icon(
                favorisProvider.isExist(product)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.red,
              ),
            ),
            TextButton(
              child: const Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return buildArticle(snapshot.data![index]);
            },
          );
        }
      },
    );
  }


  Widget buildArticle(Produits product) {
    return GestureDetector(
      onTap: () {
        _showMyDialog(product);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Image.network(
                product.image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              width: 150,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text(" | ", style: TextStyle(fontSize: 30)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.titre,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Lobster',
                          ),
                        ),
                        Text(
                          '${product.prix} FCFA',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(List<Widget> articles) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: articles,
    );
  }
}