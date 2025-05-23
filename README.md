# 🍽️ EasyMeal – Weekly Menu Planner App

![EasyMeal Logo](https://via.placeholder.com/200x80.png?text=EasyMeal+Logo) <!-- Remplace par ton image réelle -->

> **Une application mobile intuitive pour planifier, visualiser, commenter et imprimer vos repas hebdomadaires.**

---

## 📱 Aperçu de l'application

| Accueil | Semaine | Détail repas | Export PDF |
|--------|---------|--------------|-------------|
| ![Home](https://via.placeholder.com/150x300.png?text=Home) | ![Week](https://via.placeholder.com/150x300.png?text=Week) | ![Meal](https://via.placeholder.com/150x300.png?text=Meal) | ![PDF](https://via.placeholder.com/150x300.png?text=PDF) |

---

## 🧠 Fonctionnalités principales

- ✅ **Ajouter / modifier / supprimer** deux repas par jour : *déjeuner* et *dîner*
- 📂 **Classer les repas** par catégorie : *Entrée*, *Plat*, *Dessert*
- 📝 **Nom, description et image** pour chaque repas
- 📆 **Afficher le menu par jour ou semaine** via un calendrier interactif
- 🖨️ **Exporter le menu** en PDF ou image pour l’impression
- ⭐ **Noter et commenter** les repas (ex: « tout le monde a aimé sauf Ahmed »)
- 🔁 **Historique** des repas pour éviter les doublons
- 🎲 **Mode aléatoire** : propose automatiquement des repas quand on manque d’inspiration

---

## 🛠️ Technologies utilisées

| Langage | Framework | Base de données | Outils divers |
|--------|-----------|-----------------|----------------|
| 📱 Flutter | 🧱 Hive | 🗄️ SQLite / Hive | 🖌️ Figma |
| ☁️ Dart | 🔥 Firebase (optionnel) | 🧠 Algorithmes de suggestion | 🧪 Postman |

> Tu peux compléter cette section avec les versions exactes ou autres outils que vous utilisez.

---

## 👨‍👩‍👧‍👦 Équipe de développement

- 🧑‍💻 Nom 1 – [@GitHub1](#)
- 👩‍💻 Nom 2 – [@GitHub2](#)
- 👨‍💻 Nom 3 – [@GitHub3](#)

> 🎯 N’hésitez pas à ajouter les rôles (ex : Backend, UI/UX, intégration, etc.)

---

## 🧪 Comment tester le projet

```bash
git clone https://github.com/nom-utilisateur/easymeal.git
cd easymeal
flutter pub get
flutter run

lib/
├── components/ # Composants réutilisables (widgets, cartes, boutons, etc.)
├── firebase_authentication/ # Gestion de l’authentification via Firebase
├── helpers/ # Fonctions utilitaires et extensions
├── local_storage_management/ # Gestion du stockage local (Hive, préférences, etc.)
├── models/ # Modèles de données (Repas, Catégories, etc.)
├── screens/ # Interfaces utilisateur (Accueil, Semaine, Détail repas, etc.)
├── states_management/ # Gestion des états de l'application (ex: Provider, Bloc, etc.)
├── firebase_options.dart # Fichier généré pour la configuration Firebase
└── main.dart # Point d'entrée principal de l'application