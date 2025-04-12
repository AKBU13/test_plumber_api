# 1. Utiliser une image de base officielle de R
FROM rocker/r-ver:4.3.1

# 2. Installer le package 'plumber' via R
RUN R -e "install.packages('plumber')"

# 3. Copier tous les fichiers du projet dans le conteneur (au répertoire /app)
COPY . /app

# 4. Définir le répertoire de travail du conteneur (dans /app)
WORKDIR /app

# 5. Exposer le port (optionnel)
EXPOSE 8000

# 6. Exécuter la commande pour lancer l'API Plumber en utilisant le PORT de Render
CMD ["R", "-e", "pr <- plumber::plumb('Plumber_Api_Test.R'); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT', 8000)))"]