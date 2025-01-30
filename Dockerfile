FROM node:20
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY azapi /usr/src/app/
#COPY ["package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
#Note: If the above fails with EIA_AGAIN, read this: https://robinwinslow.uk/fix-docker-networking-dns
COPY . .
EXPOSE 3100
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
