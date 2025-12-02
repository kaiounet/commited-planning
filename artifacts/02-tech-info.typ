= Plan de Montée en Compétence Technologique

#v(1em)
*Date :* #datetime.today().display("[day] [month repr:long] [year]") \
*Contexte :* Préparation à la phase de développement (Début prévu : J+30) \
*Objectif :* Acquérir les compétences techniques requises pour l'architecture Micro-services Polyglotte validée. \


#line(length: 100%)

== Socle Commun & Outils Transverses (Toute l'équipe)
Ces compétences sont obligatoires pour garantir la collaboration DevOps et la qualité documentaire.

*Ressources recommandées :*
- Git: Atlassian Tutorials, GitHub Docs, Pro Git (livre gratuit en ligne).
- Docker: Documentation Docker officielle, Udemy/Coursera courses, Docker Hands-on Labs.
- Typst: Typst Official Documentation, community examples sur GitHub.

#table(
  columns: (30%, 50%, 20%),
  inset: 10pt,
  align: (left, left, center),
  table.header(
    [*Technologie*], [*Modules & Détails d'Apprentissage*], [*Durée Estimée*]
  ),
  [*Git & GitHub (Flow)*],
  [
    - Stratégie de branches (GitFlow ou GitHub Flow).
    - Gestion des Pull Requests (Code Review).
    - Résolution de conflits avancée.
    - Utilisation des GitHub Actions (CI/CD basique).
    - Mini-projet : Configurer un workflow GitFlow sur un repo test avec 2-3 branches.
  ],
    [2 Jours],

  [*Docker & Conteneurisation*],
  [
    - Écriture de `Dockerfile`
    - `Docker Compose` pour orchestrer les 5 services en local.
    - Notions de réseaux Docker (Bridge) pour la comm. inter-services.
    - Mini-projet : Créer un `docker-compose.yml` pour lancer 2-3 services localement et tester la communication.
  ],
    [4 Jours],

  [*Typst (Documentation)*],
  [
    - Syntaxe de base et mise en page.
    - Création de Templates pour les rapports.
    - Gestion des bibliographies et références croisées.
    - Mini-projet : Créer un template de rapport pour la documentation du projet.
  ],
    [1 Jour],
  
  // [*Conception & Modélisation*],
  // [
  //   - Diagrammes UML (Classes, Séquences pour les API).
  //   - Design des APIs REST (Standard OpenAPI/Swagger).
  //   - Maquettage UI (Figma) pour validation des flux.
  // ],
  // [Continu (Mois 1)]
)

== Formations Spécifiques par Rôle (Micro-services)

=== Membre 1 : Frontend & UX (Service Frontend)
Responsable de l'interface utilisateur et des tableaux de bord interactifs.

*Approche pédagogique :* Apprendre par la construction. Démarrer avec un composant simple (ex: liste d'étudiants), puis progresser vers un dashboard avec état global et graphiques. Parallèle avec Figma pour les maquettes.

*Ressources :*
- React: Official React Docs (version 18+), scrimba.com, udemy.
- Tailwind: Tailwind CSS Docs + Tailwind UI components.
- Figma: Figma Learning (YouTube), design systems basics.

#table(
  columns: (30%, 50%, 20%),
  inset: 10pt,
  align: (left, left, center),
  table.header(
    [*Technologie*], [*Modules Spécifiques*], [*Durée Estimée*]
  ),
  [*React.js (Ecosystème)*],
  [
    - React Hooks (`useState`, `useEffect`, `useContext`).
    - Gestion d'état global (Zustand ou Redux Toolkit).
    - *Routing* : React Router v6 (Protection des routes).
    - Gestion des erreurs et loading states.
    - Mini-projet : Composant "Gestion d'Étudiants" avec liste, création, suppression (état local puis global).
  ],
  [8 Jours],

  [*UI & Dataviz*],
  [
    - *Tailwind CSS* : Configuration, Grid system, Responsive design.
    - *Recharts* ou *Chart.js* : Pour les graphiques du Dashboard (Phase 2).
    - *Axios* : Intercepteurs pour gérer les tokens JWT.
    - Mini-projet : Dashboard basique avec 2-3 graphiques et appels API mockés.
  ],
  [3 Jours],

  [*Figma*],
  [
    - Maquettage des écrans principaux, prototypes interactifs.
    - Collaboration et handoff aux développeurs (export, design tokens).
    - Wireframes et prototypes des 5 écrans clés (Login, Classes, Assignments, Dashboard, Student Profile).
    - Mini-projet : Prototype interactif d'au moins 3 écrans avec transitions.
  ],
  [3 Jours],
)

=== Membre 2 : Backend Core (Service Gestion)
Responsable de la logique administrative (CRUD Étudiants, Classes) et de la persistance principale.

*Approche pédagogique :* Construire un CRUD robuste (Symfony) + connaissance profonde de la BD (Oracle, cursors, vues). Exécuter localement avec Docker Compose. Intégration avec le Frontend en Sprint 1.

*Ressources :*
- Symfony: Documentation Symfony 6/7, SymfonyCasts (screencasts pratiques).
- Doctrine ORM: Doctrine Documentation officielle, exemples avancés.
- Oracle: Oracle Learning Paths (gratuit), SQL Tuning Advisor dans SQL Developer.

#table(
  columns: (30%, 50%, 20%),
  inset: 10pt,
  align: (left, left, center),
  table.header(
    [*Technologie*], [*Modules Spécifiques*], [*Durée Estimée*]
  ),
  [*Symfony 7 (PHP)*],
  [
    - Structure MVC et Injection de Dépendances.
    - Composant *Serializer* (Transformation Entity $->$ JSON).
    - Validation des données (Asserts).
    - Sécurité (Guard Authenticator pour JWT).
    - Gestion d'erreurs et logging.
    - Mini-projet : API CRUD complet pour Étudiants et Classes avec validation et JWT.
  ],
  [8 Jours],

  [*Base de Données*],
  [
    - *Doctrine ORM* : Mapping avancé, Relations, Migrations.
    - *Oracle Database* : Connexion via OCI8/PDO_OCI, spécificités SQL Oracle.
    - Concepts SQL utiles pour le front : Cursors, Vues (views) et Fonctions/Procédures stockées pour faciliter l'extraction et la transformation des données vers le front-end.
    - Requêtes préparées, transactions et optimisation de base (indexation, plan d'exécution).
    - Gestion des users, permissions et auditing.
    - Mini-projet : Schéma BD complet avec cursors pour export de données, vues pour agrégation, et fonctions pour cas métier complexes.
  ],
  [6 Jours],
)

=== Membre 3 : Orchestrator (Service Moteur)
Le cœur critique. Doit manipuler Git programmatiquement et gérer les conteneurs étudiants.

*Approche pédagogique :* Maîtriser Spring Boot en tant qu'orchestrateur central. Deux défis majeurs : (1) Cloner et analyser des repos Git via JGit, (2) Lancer des conteneurs étudiants via Docker API. Commencer par chacun isolément, puis intégrer.

*Ressources :*
- Spring Boot: Spring.io (guides et documentation), Baeldung tutorials, Spring Academy (cours officiel gratuit).
- JGit: Eclipse JGit documentation, exemples GitHub.
- Docker Java API: docker-java library (GitHub: docker-java/docker-java — actively maintained), official Docker SDK documentation.

#table(
  columns: (30%, 50%, 20%),
  inset: 10pt,
  align: (left, left, center),
  table.header(
    [*Technologie*], [*Modules Spécifiques*], [*Durée Estimée*]
  ),
  [*Spring Boot 3 (Java)*],
  [
    - Spring Web (REST Controllers).
    - Gestion asynchrone (`@Async` pour les tâches longues).
    - *Spring Security* (Validation des tokens Gateway).
    - Gestion des exceptions et monitoring basique.
    - Mini-projet : API REST pour orchestrer 2-3 tâches simples (créer un conteneur, récupérer un fichier).
  ],
  [8 Jours],

  [*Automatisation & I/O*],
  [
    - *Eclipse JGit* : Librairie Java pour cloner/analyser des repos Git (Phase 3).
    - *Docker Java API* : Pour lancer des conteneurs "Sandbox" depuis le code Java.
    - Gestion des fichiers (NIO.2) pour scanner le code étudiant.
    - Gestion des timeouts et ressources (mémoire, CPU des conteneurs).
    - Mini-projet : Script Java qui clone un repo de test, l'analyse (compte fichiers, lignes de code), et génère un rapport simple.
  ],
  [6 Jours],
)

=== Membre 4 : Analytics & Intelligence (Services .NET & Python)
Responsable du traitement de données haute performance et de l'IA.

*Approche pédagogique :* Deux piliers : (1) .NET pour l'agrégation performante et LINQ, (2) Python pour Data Science et IA. Commencer par pandas/numpy, puis scikit-learn. Construire un mini-modèle prédictif dès la Semaine 3.

*Ressources :*
- ASP.NET Core: Microsoft Learn, Docs, PluralSight courses.
- LINQ: LINQ to Objects tutorials, Albahari's LINQ reference.
- Python: Official Docs, DataCamp ou Kaggle Courses, Kaggle Datasets.
- Scikit-learn: Scikit-learn User Guide, Hands-on ML with Scikit-learn (livre gratuit partiellement).

#table(
  columns: (30%, 50%, 20%),
  inset: 10pt,
  align: (left, left, center),
  table.header(
    [*Technologie*], [*Modules Spécifiques*], [*Durée Estimée*]
  ),
  [*ASP.NET Core (C\#)*],
  [
    - Web API Architecture.
    - *LINQ* : Requêtes complexes sur collections et DB.
    - Entity Framework Core (Optimisation des requêtes lecture seule).
    - Pagination et caching pour les gros volumes de données.
    - Mini-projet : API .NET qui agrège les données d'étudiants (via appels aux autres services) et expose des métriques simples (nombre de soumissions par classe, etc.).
  ],
  [6 Jours],

  [*Python & Data Science*],
  [
    - *FastAPI* : Création d'endpoints rapides pour l'inférence.
    - *Pandas* : Nettoyage et structuration des données CSV/JSON.
    - *Scikit-learn* : Régression/Classification pour le modèle prédictif (Phase 5).
    - *LangChain* (Optionnel) : Si utilisation d'analyse de code via LLM.
    - Visualisation de données (Matplotlib, Seaborn) pour validations.
    - Mini-projet (Semaine 2-3) : Charger un dataset CSV fictif (résultats étudiants), le nettoyer avec pandas, entraîner un modèle simple (ex: prédire si l'étudiant réussira) avec scikit-learn, exposer un endpoint FastAPI pour l'inférence.
  ],
  [10 Jours],
)

Note courte : actuellement en étude active — Python : `pandas`, `numpy`, `scikit-learn` (prise en main et exercices pratiques).

== Plan d'Apprentissage Détaillé (4 Semaines) — Équilibre Conception + Technique

*Principes :* Ce mois prépare le *terrain pour le développement Phase 1*. L'accent est mis sur les *fondamentaux + contrats API + schémas BD*, pas sur une application fonctionnelle complète. La vraie production démarre en Mois 2.

=== *Semaine 1 : Socle Commun & Mise en Pratique*

*Objectif :* Maîtriser Git, Docker et les outils transversaux. Chaque équipe configure son environnement de base.

*Travail parallèle :*
- *Tous (jours 1-2) :* Git/GitHub Workflow (branches, PRs, merges, CI/CD basique avec Actions).
  - Mini-projet : Chacun crée une branche feature, pushes une PR avec description, code review en binôme.
  - Temps investi : *2 jours*.

- *Tous (jours 3-4) :* Docker & Compose fondamentaux (Dockerfile, images, réseaux, volumes).
  - Mini-projet : Créer 3 services simples (app web dummy + DB + cache) dans un `docker-compose.yml` et les faire communiquer.
  - Temps investi : *2 jours*.

- *Tous (jour 5) :* Typst basics pour la documentation.
  - Temps investi : *1 jour*.

- *En parallèle (Conception) :* Débuter les diagrammes UML (cas d'usage, séquences pour Phase 1).

*Livrables fin Semaine 1 :*
- Repos de chaque service initialisés avec structure de base + workflows GitHub.
- Docker Compose local fonctionnel pour tous les 5 services (dummy).
- Premiers diagrammes UML validés.


=== *Semaine 2 : Socle Technique + Schéma de Données*

*Objectif :* Apprendre les fondamentaux du langage assigné. Commencer à concevoir le schéma BD et les contrats d'API (OpenAPI).

*Travail par rôle (apprentissage) :*

- *Frontend (Membre 1) :* React Hooks + basic routing (2-3 jours) + intro Figma (1 jour).
  - Mini-projet : Composant stateless simple (ex: liste avec props, pas d'état global encore).
  - Ressources : React official docs, 1 scrimba course.
  - Temps : *4 jours*.

- *Backend Core (Membre 2) :* Symfony structure + Doctrine basics (3 jours) + schéma BD Oracle (2 jours).
  - Mini-projet : Scaffold une entité Symfony simple (ex: `Student`), créer les migrations.
  - Ressources : Symfony docs, SymfonyCasts.
  - Temps : *5 jours*.

- *Orchestrator (Membre 3) :* Spring Boot REST basics (2-3 jours) + intro Git API (1 jour).
  - Mini-projet : Simple REST endpoint (ex: `GET /health`, `POST /echo`).
  - Ressources : Spring.io guides, Baeldung.
  - Temps : *4 jours*.

- *Analytics (Membre 4) :* FastAPI + pandas basics (2-3 jours) + numpy (1 jour).
  - Mini-projet : FastAPI endpoint qui lit un CSV fictif et retourne des stats (moyenne, count).
  - Ressources : FastAPI docs, Real Python.
  - Temps : *4 jours*.

*Travail parallèle (Conception) :*
- *Backend Core + Orchestrator :* Concevoir le schéma BD Oracle (Phase 1 minimal : Users, Classes, Students, Assignments, Submissions).
- *Tous :* Définir les contrats d'API (OpenAPI specs) pour Phase 1 :
  - Frontend ← → Backend Core (authentification, CRUD classes/étudiants).
  - Frontend ← → Analytics (GET /stats).
  - Orchestrator ← → (pas de consommation externe Phase 1, juste tâches asynchrones en interne).

*Livrables fin Semaine 2 :*
- Chaque service expose une "hello world" API endpoint.
- Schéma BD Phase 1 (tables, relations) documenté en SQL + diagrammes ER.
- OpenAPI specs (YAML) pour Backend Core + Analytics endpoints.
- Wireframes des 3-4 écrans clés sur Figma (Login, Dashboard, Classes).

---

=== *Semaine 3 : Intégration API & Approfondissement*

*Objectif :* Comprendre comment les services vont parler. Approfondir les libs clés. Finaliser la conception.

*Travail par rôle :*

- *Frontend (Membre 1) :* Axios setup + mock API calls (1 jour) + Tailwind + Recharts intro (1-2 jours).
  - Mini-projet : Créer un écran de "liste d'étudiants" qui appelle un endpoint mocké (JSON local ou Postman mock server).
  - Temps : *3 jours*.

- *Backend Core (Membre 2) :* Doctrine relations avancées + Serializer pour JSON (1-2 jours) + JWT auth basics (1 jour) + cursors/vues Oracle (1-2 jours).
  - Mini-projet : Endpoints `GET /students`, `POST /students`, `GET /students/{id}` avec vraie BD Oracle (schema Phase 1).
  - Temps : *5 jours*.

- *Orchestrator (Membre 3) :* Spring async + Docker API basics (2 jours) + intro JGit cloning (1 jour).
  - Mini-projet : Endpoint `POST /jobs` qui lance une tâche asynchrone fictive (simule repos Git, retourne un ID).
  - Temps : *3 jours*.

- *Analytics (Membre 4) :* Scikit-learn intro (2 jours) + FastAPI POST endpoint (1 jour) + LINQ basics pour .NET (1 jour).
  - Mini-projet : Entraîner un modèle de classification simple sur un dataset fictif (ex: prédire succès/échec étudiant). Exposer endpoint `/predict` en FastAPI.
  - Temps : *4 jours*.

*Travail parallèle (Conception) :*
- *Tous :* Finaliser OpenAPI specs et tester les contrats avec Postman/Insomnia (mock calls).
- *Backend Core :* Optimiser schéma BD (indexation, vues pour agrégations).
- *Orchestrator :* Concevoir l'architecture interne (files de jobs, événements).

*Livrables fin Semaine 3 :*
- Frontend : Écran fonctionnel (même avec données mockées) qui appelle l'API Backend.
- Backend Core : CRUD endpoints réels sur Oracle.
- Orchestrator : Async job endpoint opérationnel.
- Analytics : Modèle entraîné + endpoint `/predict` live.
- *Important :* Tous les services documentés via OpenAPI/Swagger.
- Conception : Schémas BD finalisés, diagrammes UML complets, architecture décidée.

---

=== *Semaine 4 : Mini-PoC + Validation*

*Objectif :* Prouver que 2 services majeurs peuvent se parler. Valider l'architecture. Préparer le démarrage officiel du développement Phase 1.

*PoC Réaliste (pas la full app) :*

*Scénario simple :* Frontend affiche une liste d'étudiants (GET) et peut en créer un (POST), données du Backend Core.

*Tâches :*
- *Frontend ↔ Backend Core :*
  - Frontend appelle réellement `GET /students` et `POST /students` du Backend.
  - Affiche la liste avec Tailwind styling + wireframe login (JWT token passing).
  - Temps : Frontend *1-2 jours*, Backend *1 jour* d'intégration finale.

- *Analytics PoC (optionnel mais appréciable) :*
  - Backend Core expose `GET /analytics/class/{id}/stats` (agrégation via vues Oracle).
  - Analytics simule un appel : données brutes → modèle scikit-learn → retour prédiction simple.
  - Temps : *1-2 jours*.

- *Orchestrator readiness (pas de PoC live, mais architecture validée) :*
  - Démontrer la structure de tâche asynchrone (même si vide).
  - Documenter comment Phase 1 va déclencher les jobs (webhooks, polling).
  - Temps : *1 jour* documentation + review.

*Validation :*
- Tests manuels : Scénario Frontend → Backend fonctionnel end-to-end.
- Swagger/OpenAPI docs générés automatiquement et validés.
- Performance basique (temps de réponse < 500ms pour requêtes simples).
- Logs et error handling en place.

*Livrables fin Semaine 4 :*
- *PoC fonctionnel :* Frontend parle au Backend, CRUD students opérationnel.
- *Repos clean :* Code organisé, commitable sans hacks.
- *Documentation complète :* Postman collection, OpenAPI YAML, README de chaque service.
- *Checklist Phase 1 :* Schéma BD validé, contrats API finalisés, dépendances listées.
- *Roadmap évolutive :* Planning détaillé des 2-3 premières sprints de Phase 1 (basé sur les 5 phases du projet).

*Au-delà de Semaine 4 :*
- Todos pour Phase 1 (Semaine 1-4 du mois prochain) : intégration Frontend complète, auth JWT, tests unitaires, CI/CD pipeline.

== Recommandations

- *API Design:* Standardiser les endpoints et produire un fichier `OpenAPI` minimal pour chaque service.
- *Sécurité basique:* JWT + HTTPS, validation côté serveur, gestion des rôles pour les endpoints critiques.
- *SQL & Perf:* Indexation, utilisation de vues pour agrégation côté BD, et usage d'`EXPLAIN`/plans pour requêtes lourdes.

== Planning Prévisionnel Simplifié
La formation se déroule en parallèle de la phase de conception (Mois 1).

- *Semaine 1 :* Socle Commun (Git, Docker) + Début Conception UML.
- *Semaine 2 :* Début des formations spécifiques langage (React, PHP, Java, C\#).
- *Semaine 3 :* Approfondissement Bibliothèques Spécialisées (JGit, Pandas, Recharts) + Maquettage.
- *Semaine 4 :* PoC (Proof of Concept) : Connecter 2 services ensemble (ex: React appelle Symfony) + Finalisation Dossier Conception.

*Jalons clés :*
- Fin Semaine 1 : Environnement validé, tous les repos locaux fonctionnels.
- Fin Semaine 2 : Chaque service expose une API CRUD basique.
- Fin Semaine 3 : Intégration entre-services (Frontend appelle Backend, Analytics reçoit données du Core).
- Fin Semaine 4 : PoC complet fonctionnel, prêt pour la Phase 1 de développement officiel.