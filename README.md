# CityHunters: jeu de piste sous forme d’application web mobile

Ce projet a été développé dans le cadre du projet de fin de cours au Wagon, avec une équipe de 4 membres sur une période de 2 semaines. L’objectif était de créer une application web mobile proposant un jeu de piste à Paris, intégrant des énigmes statiques et mobiles basées sur la géolocalisation.

Lien du projet :  [www.cityhunters.site](https://www.cityhunters.site/)<br>
Voir des images du projet [ici](https://troopl.com/anneperrinefournier/cityhunters).

## Fonctionnalités principales

- **Jeu de piste interactif :** Les utilisateurs peuvent participer à un jeu de piste virtuel à Paris en résolvant des énigmes statiques et mobiles.
- **Géolocalisation :** Les énigmes mobiles sont liées à la géolocalisation, offrant une expérience immersive aux participants.
- **Technologies variées :** Le projet utilise un ensemble diversifié de technologies, notamment Ruby on Rails, JavaScript, SQL, CSS, HTML, Ajax, WebSocket et des API tierces telles que Mapbox et Cloudinary.

## Technologies utilisées

- **Ruby on Rails :** Utilisé pour le backend et la gestion des données.
- **JavaScript :** Employé pour le développement frontend et l'interaction dynamique.
- **SQL :** Base de données relationnelle pour le stockage des données.
- **CSS et HTML :** Assurent la mise en page et le style de l'interface utilisateur.
- **Ajax et WebSocket :** Utilisés pour des mises à jour en temps réel et des interactions asynchrones.
- **API Mapbox :** Intégrée pour la gestion de la cartographie et de la géolocalisation.
- **API Cloudinary :** Employée pour le stockage et la gestion d'images.

## Comment exécuter le projet localement

1. Clonez ce dépôt sur votre machine locale.
2. Assurez-vous d’avoir Ruby on Rails installé.
3. Installez les dépendances avec la commande `bundle install`.
4. Configurez les clés d'API nécessaires pour Mapbox et Cloudinary.
5. Exécutez les migrations de base de données avec `rails db:migrate`.
6. Lancez l'application avec `rails server`.
7. Accédez à l'application dans votre navigateur à l'adresse `http://localhost:3000`.

## Contributeurs

- **Anne-Perrine Fournier – porteuse du projet** : Création et configuration de l'application, déploiement et configuration du nom de domaine, gestion des conflits de merge, API Mapbox (position des storylines, des lieux et des utilisateurs, stylisation de la carte), localisation (Ajax) et suivi des utilisateurs (Websocket), validation de la position. Figma, css et html de la home, du choix des scénarii, du lobby, du jeu et de la carte. Création des données de la base de données. Écriture des scénarii Code Rouge et Opéra en pagaille. Travail d'édition du contenu.
- **Alexis de Temmerman** : Websocket du lobby, websocket de la dynamique du jeu des énigmes (local et déplacement), validation de la position, gestion des conflits de merge.
- **Pierre-François Thomas** : Configuration de l'application, navigation drawer (JS), localisation des utilisateurs (Ajax), html et css de la page home et de la page de statistiques.
- **Henri Guillot** : Modèles, API Cloudinary, fenêtre modal de réponse, websocket de fin de partie.
- **Romain Sanson – référent**

## Remerciements

Nous tenons à remercier l’équipe du Wagon pour son soutien et ses enseignements tout au long de ce projet passionnant.
