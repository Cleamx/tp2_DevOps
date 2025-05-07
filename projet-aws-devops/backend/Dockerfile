# backend/Dockerfile
FROM node:16-alpine

COPY package*.json ./

RUN npm install

COPY . .

ENV NODE_ENV=production

EXPOSE 4000

# 8) Démarrer l'application
CMD ["node", "index.js"]
