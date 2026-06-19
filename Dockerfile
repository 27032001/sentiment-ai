FROM python:3.11-slim
# Dé finir le ré pertoire de travail dans le conteneur
WORKDIR /app
# É tape 1 : copier UNIQUEMENT le fichier de dé pendances
# Cette couche sera mise en cache tant que requirements . txt ne change pas
COPY requirements.txt .
# É tape 2 : installer les dé pendances ( couche mise en cache )
RUN pip install --no-cache-dir -r requirements.txt
# É tape 3 : copier le code source ( invalid é à chaque modification du code )
COPY src/ ./src/
COPY tests/ ./tests/
# Documenter le port utilis é par l’ application
EXPOSE 8000
# Commande de démarrage du serveur Uvicorn
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]
