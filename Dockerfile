# Utiliser OpenJDK 17 comme base
FROM openjdk:17-jdk

# Exposer le port 8080
EXPOSE 8080

# Définir une variable d'environnement pour le chemin de l'application
ENV APP_HOME /usr/src/app

# Créer un utilisateur non-root et configurer le répertoire
RUN useradd -m appuser && mkdir -p $APP_HOME && chown -R appuser:appuser $APP_HOME

# Copier l'application dans le répertoire de l'utilisateur
COPY target/*.jar $APP_HOME/app.jar

# Définir le répertoire de travail
WORKDIR $APP_HOME

# Passer à l'utilisateur non-root
USER appuser

# Commande pour exécuter l'application
CMD ["java", "-jar", "app.jar"]
