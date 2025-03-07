// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:bijouterie2/pages/liste_produits_page.dart';

class PageAccueil extends StatelessWidget {
  const PageAccueil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/bijou (6).jpeg",
              width: 700,
              height: 500,
              fit: BoxFit.cover,

            ),
            const Text(
              "Shopping",
              style: TextStyle(
                  fontSize: 42 ,
                  fontFamily: 'Lobster'
              ),
            ),
            const Text(
                "En ligne"
            ),
           // ElevatedButton(
            //                 style: const ButtonStyle(
            //                     backgroundColor: MaterialStatePropertyAll(Colors.red)
            //                 ),
            //                 onPressed: () {
            //                   Navigator.push(
            //                       context,
            //                       PageRouteBuilder(
            //                           pageBuilder: (_, __, ___) => ListeProduits()
            //                       )
            //                   );
            //                 },
            //                 child: const Text(
            //                   "Valider",
            //                   style: TextStyle(
            //                       fontSize: 20,
            //                       color: Colors.white
            //                   ),
            //                 )
            //             )
            //ElevatedButton(onPressed: onPressed, child: Text("ok")),
          ],
        )
    );
  }
}

