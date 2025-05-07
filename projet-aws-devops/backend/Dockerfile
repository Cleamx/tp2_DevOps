# backend/Dockerfile

FROM node:16-alpine

WORKDIR /usr/src/app

# 1) Copier les fichiers de dépendances
COPY package*.json ./

# 2) Installer (sans --verbose ni cache clean)
RUN npm install

# 3) Copier le reste du code
COPY . .

ENV NODE_ENV=production
EXPOSE 4000

CMD ["node", "index.js"]
