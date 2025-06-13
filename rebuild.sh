#!/bin/bash

# Arrêter et supprimer tous les conteneurs, réseaux, volumes créés par docker-compose
docker compose down

# Supprimer l'image de l'application si elle existe
docker image rm _app:latest 2>/dev/null || echo "Image _app:latest non trouvée, rien à supprimer"

# Récupérer les dernières modifications depuis Git
git pull || { echo "Erreur lors du git pull"; exit 1; }

# Reconstruire et relancer le service app
docker compose up -d --build app || { echo "Erreur lors du démarrage du service"; exit 1; }

echo "Déploiement terminé avec succès"
