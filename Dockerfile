# Build the project.
FROM node:23-alpine AS build-env
COPY . /app
WORKDIR /app
RUN npm ci && npm run build

# Install the dependencies for production.
FROM node:23-alpine AS production-dependencies-env
COPY ./package.json package-lock.json /app/
WORKDIR /app
RUN npm ci --omit=dev

# Build the final image for production.
FROM node:23-alpine
COPY ./package.json package-lock.json /app/
COPY --from=production-dependencies-env /app/node_modules /app/node_modules
COPY --from=build-env /app/build /app/build
WORKDIR /app
CMD ["npm", "run", "start"]
