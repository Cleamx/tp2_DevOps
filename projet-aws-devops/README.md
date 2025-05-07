# Projet AWS DevOps

Contexte du Projet
Vous allez procéder au déploiement d’une application web (frontend, backend et base
de données) pour gérer les campagnes publicitaires. Cette application doit donc être hau-
tement disponible, scalable et facile à maintenir face aux fluctuations des demandes des
clients. En tant qu’ingénieur DevOps, vous allez mettre en place un pipeline CI/CD com-
plet pour automatiser le déploiement de cette application depuis le code source jusqu’à
l’environnement de production dans le cloud.

## Structure du projet

### Backend
- Contient le code source de l'application backend.
- Inclut un `Dockerfile` pour construire l'image Docker.
- Dépendances définies dans `package.json`.

### Frontend
- Contient le code source de l'application frontend.
- Inclut un `Dockerfile` pour construire l'image Docker.
- Dépendances définies dans `package.json`.

### Infra
- Contient les fichiers Terraform pour déployer l'infrastructure dans le cloud.
- Modules inclus :
  - Réseau (VPC, sous-réseaux, etc.).
  - Base de données.
  - Cluster ECS pour exécuter les conteneurs Docker.

## Pipeline CI/CD

Le pipeline CI/CD est configuré avec GitHub Actions et inclut les étapes suivantes :

1. **Build et push des images Docker** :
   - Backend : construit et pousse l'image Docker dans Amazon ECR.
   - Frontend : construit et pousse l'image Docker dans Amazon ECR.

2. **Déploiement de l'infrastructure** :
   - Utilise Terraform pour provisionner les ressources cloud nécessaires.

## Instructions pour exécuter le projet

### Prérequis
- Docker installé localement.
- Terraform installé localement.
- Accès à un compte AWS avec les permissions nécessaires.

### Étapes

1. **Installer les dépendances** :
   ```bash
   # Backend
   cd backend
   npm install

   # Frontend
   cd frontend
   npm install
   ```

2. **Construire et exécuter les conteneurs localement** :
   ```bash
   docker-compose up --build
   ```

3. **Déployer l'application dans le cloud** :
   ```bash
   cd infra
   terraform init
   terraform apply -auto-approve
   ```

## Monitoring

Une solution de monitoring est mise en place pour surveiller l'application :
- **CloudWatch** : utilisé pour surveiller les logs et les métriques des conteneurs.
- **Prometheus/Grafana** : optionnel pour des métriques personnalisées.

## Vérification finale

Testez le pipeline CI/CD en effectuant un push sur la branche `main`. Assurez-vous que :
- Les images Docker sont correctement construites et poussées dans ECR.
- L'infrastructure est déployée avec succès.
- L'application est accessible et fonctionnelle dans le cloud.

1 Ce que je veux évaluer
1. Mise en œuvre d’une stratégie DevOps complète
2. Concepts et outils de CI/CD
3. Services cloud pour le déploiement d’applications
4. Implémentation de solutions de monitoring
5. Application de l’Infrastructure as Code

2 Ce que vous devez rendre
1. Une application complète et fonctionnelle (non je déconne ! Je veux juste les bases
d’un projet selon le langage de votre choix)
2. Une application déployée dans le cloud public de votre choix (AWS, Azure, GCP,
OVH, etc.)
3. Un dépôt Git contenant :
— Le code source de l’application
— Les fichiers d’infrastructure as code (IaC)
— Les fichiers de configuration du pipeline CI/CD
— Les scripts de déploiement et d’automatisation
— La documentation du projet
Pensez à accorder les droits d’accès à chabibabatounde@gmail.com.
4. Un pipeline CI/CD automatisé et fonctionnel
5. Une solution de monitoring
6. Un entretien très rapide de 3 minutes de votre proposition, suivie de 0 à 2 questions.
Bien évidemment je ne vous demandes pas des diapositives, il s’agit juste d’un
entretien.

3 Proposition d’étapes de mise en oeuvre
Phase 1 : Analyse et Conception (1h30)
— Analyse des besoins et choix technologiques
— Conception de l’architecture
— Création du dépôt Git et structure du projet (branches)

Phase 2 : Implémentation (1h30)
— Développement de l’application (Toute petite proposition)
— Création de l’infrastructure
— Configuration du pipeline CI/CD
— Mise en place des conteneurs

Phase 3 : Déploiement et Monitoring (1h30)
— Déploiement sur le cloud
— Configuration du monitoring

The END