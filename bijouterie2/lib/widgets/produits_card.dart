import 'package:flutter/material.dart';
import 'package:bijouterie2/models/donnees.dart';
import 'package:bijouterie2/provider/favoris_provider.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

class ProduitsCard extends StatefulWidget {
  final Produits produits;
  const ProduitsCard({Key? key, required this.produits}) : super(key: key);

  @override
  State<ProduitsCard> createState() => _ProduitsCardState();
}

class _ProduitsCardState extends State<ProduitsCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  provider.toggleFavoris(widget.produits);
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.network(
              widget.produits.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.produits.titre,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\$ ${widget.produits.prix}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}