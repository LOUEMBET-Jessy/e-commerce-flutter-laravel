
Information sur l'utilisation du projet

*Images de démonstration
Le dossier `images demo` contient des captures d'écran ou des GIFs qui montrent un aperçu de l'application en fonctionnement. Ces images vous permettent de comprendre rapidement les fonctionnalités de l'application.

---

*Étapes de test

1. Décompression des dossiers :
   - Décompressez le dossier `bijouterie-api` et placez-le dans le répertoire de votre serveur Apache et PHP (par exemple, dans `C:\laragon\www\` pour Laragon, ou dans `htdocs` pour XAMPP ou WAMP).

2. Ouvrir le terminal :
   - Ouvrez un terminal (ou invite de commande) et naviguez jusqu'au dossier du projet :
     
     cd C:\laragon\www\bijouterie-api
     

3. Migrer et remplir la base de données:
   - Exécutez la commande suivante pour migrer les tables et remplir la base de données avec des données de test :
     
     php artisan migrate:refresh --seed
     `
   - Explication : L'option `--seed` permet d'exécuter les seeders, qui remplissent la table `produits` avec des articles par défaut.

4. Lancer le serveur PHP :
   - Démarrez le serveur PHP en exécutant la commande suivante :
     
     php artisan serve
     
   - Cela lancera le serveur sur `http://127.0.0.1:8000`. Vous pouvez accéder à l'API via cette URL.

---

*Étapes pour exécuter l'application Flutter

1. Cloner ou décompresser le projet Flutter :
   - Si vous avez un projet Flutter séparé, clonez-le ou décompressez-le dans un dossier approprié.

2. Ouvrir le projet dans un IDE :
   - Ouvrez le projet Flutter dans un IDE comme Android Studio ou Visual Studio Code.

3. Configurer l'URL de l'API:
   - Assurez-vous que l'URL de l'API dans le fichier `api_service.dart` pointe vers l'URL du serveur PHP (par exemple, `http://127.0.0.1:8000/api`).

4. *Installer les dépendances:
   - Exécutez la commande suivante pour installer les dépendances du projet :
     
     flutter pub get
     

5. *Lancer l'application :
   - Exécutez l'application Flutter avec la commande suivante :
     
     flutter run
    
   - Cela lancera l'application sur un émulateur ou un appareil connecté.

---

*Fonctionnalités de l'application

- Accueil : Affiche une vue d'ensemble des produits disponibles.
- Gallerie : Permet de parcourir les produits par catégorie.
- Favoris : Permet d'ajouter ou de retirer des produits de la liste des favoris.
- Panier : Permet d'ajouter des produits au panier, de modifier les quantités et de passer une commande.

---

*Auteurs
- LOUEMBET Jessy Mac: Développeur 
- INPTIC, Gabon