FROM jenkins/jenkins:lts

# Exposer le port Jenkins
EXPOSE 8080

# Démarrer Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
