# Dockerfile


# This sets the base image.
# This image includes Node.js and npm, so we don’t need to install them manually
FROM node:22-slim


# Thats where my app will live in docker container.
WORKDIR /app


# - Copies package.json and package-lock.json  to the container's /app directory.
# - This is done before copying the rest of the app to take advantage of Docker's layer caching — so npm install only runs again if dependencies change.
COPY package*.json ./


# Install all necessay dependencies inside container.
RUN npm install


# - Copies everything from your project folder to the container’s `/app` directory.
# - That includes your source code, config files, etc.
COPY . .


# Runs the build script defined in package.json,It's used to transpile TypeScript to JavaScript into a dist folder.
RUN npm run build


# Tells docker the app will listen on port 3000
EXPOSE 3000


# This is the default command Docker will run when the container starts.
# It starts your Node.js app using the compiled output 
CMD ["node", "dist/main"]
