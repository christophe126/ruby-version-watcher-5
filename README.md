Nous souhaitons savoir quand une version de Ruby est disponible ou en fin de support.

Afin de répondre à ce besoin, votre tâche consistera à la récupération des données
sur le site https://www.ruby-lang.org/fr/news/ via une tâche automatisée lancée
tous les jours à 23h.

Les données à récupérer sont le **titre** et la **date** de l'actualité. Les actualités qui ne concernent
pas la disponibilité d'une nouvelle version, ou la fin du support ne nous intéressent pas.

Les données récupérées doivent être enregistrées en base de données pour une consultation ultérieure via
un tableau de bord que vous réaliserez de zéro ou en vous aidant de la commande `bin/rails generate scaffold`
de Rails. Vous êtes libre sur le choix du framework CSS pour la réalisation de cet écran.

Dans une optique d'automatisation, nous souhaiterions également un export CSV de ces informations
avec les colonnes suivantes : **version ruby**, **date**, **nouvelle version (o/n)**, **fin support (o/n)**.

Vous pouvez vous aider des gems suivantes :
- [whenever](https://github.com/javan/whenever) pour la gestion des tâches automatisées
- [mechanize](https://github.com/sparklemotion/mechanize) pour le scrapping

Nous pourrions dans un second temps améliorer l'application en réalisant une API pour que nos outils viennent
directement demander les informations à cette application, ou être alerté par e-mail dès qu'une version
est disponible ou en fin de support.
