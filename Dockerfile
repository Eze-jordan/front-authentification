# Utiliser l'image officielle Apache légère
FROM httpd:alpine

# Copier tous les fichiers de ton projet dans le dossier où Apache sert les fichiers
COPY . /usr/local/apache2/htdocs/
