// ignore_for_file: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bijouterie2/pages/accueil_page.dart';
import 'package:bijouterie2/pages/favoris_page.dart';
import 'package:bijouterie2/pages/gallerie.dart';
import 'package:bijouterie2/pages/panier_page.dart';
import 'package:bijouterie2/provider/favoris_provider.dart';
import 'package:bijouterie2/provider/panier_provider.dart';
import 'package:bijouterie2/services_api/api_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => PanierProvider()),
      ],
      child: MaterialApp(
        title: "Moussavou shop",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.red,
          scaffoldBackgroundColor: Colors.grey.shade100,
        ),
        home: const HomPage(),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class HomPage extends StatefulWidget {
  const HomPage({Key? key}) : super(key: key);

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    final favoriteProvider = FavoriteProvider.of(context, listen: false);
    final panierProvider = PanierProvider.of(context, listen: false);
    favoriteProvider.fetchFavoris();
    panierProvider.fetchCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Moussavou shopping",
          style: TextStyle(
            fontSize: 42,
            fontFamily: 'Lobster',
          ),
        ),
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            label: "Accueil",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Articles",
            icon: Icon(Icons.grid_view_rounded),
          ),
          BottomNavigationBarItem(
            label: "Favoris",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Panier",
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
    );
  }
}

final List screens = [
  const PageAccueil(),
  const Gallerie(),
  const FavorisPage(),
  const PanierPage(),
];