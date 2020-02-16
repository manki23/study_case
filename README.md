# INSTRUCTION

## Objectif

L'objectif est de créer une application qui propose un formulaire d'inscription à une newsletter.

## Remarque préliminaire

Ne pas se concentrer sur le style des pages. Uniquement sur la logique.

## Etapes à suivre

1. Créer un modèle Contact avec les attributs suivants :
- Name
- Phone
- Email
- Interest

2. Créer trois routes :
- Index : pour voir la liste des inscrits
- New : pour s'inscrire sur la newsletter
- Create : pour créer le contact

3. Créer le controller correspondant avec les actions nécessaires

4. Mettre en place les vues
- Index : afficher sous forme de liste l'ensemble des gens inscrits
- New : afficher le formulaire pour pouvoir s'inscrire
    - Utiliser le form_with tag: https://guides.rubyonrails.org/form_helpers.html (rajouter l'option local: true au tag form_with pour rester en HTML et non en AJAX)
    - Mettre en place les bons champs pour chaque attribut du contact et mettre un champ select pour l'attribut interest avec les options suivantes ["science fiction", "comedie", "drame"]

5. Rajouter la bibliothèque javascript SlimSelect (http://slimselectjs.com) sur le select pour permettre une meilleure saisie

6. Mettre en place un autocomplete sur le champ select. Donc à chaque fois que je tape une lettre dans le champ select, un call AJAX s'opère et renvoie dans la liste des options du select les choix possibles, comme lorsqu'on tape sur la barre de recherche google

7. Ajouter au moins une dizaine de contacts avec des intérêts différents.

Faire les optionnels **dans l'ordre** :

8. Maintenant, nous souhaitons visualiser un camembert de le nombre de personnes par centre d'intérêt (par exemple : 10 personnes intéressées par la science fiction, 5 par la comédie et 7 par le drame)
- Pour cela, intégrer la librairie plotly.js (documentation : https://plot.ly/javascript/)
- Ajouter une nouvelle vue dans lequel tu inséreras la visualisation du camembert.

9. Optionnel 1 : Mettre en place des validations sur le modèle Contact

10. Optionnel 2 : Mettre en place une action delete et update

11. Optionnel 3 : Mettre en forme les pages
