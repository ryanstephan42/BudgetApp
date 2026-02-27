# --- Stage 1: Build the React App ---
FROM node:22-alpine as build

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install standard dependencies
RUN npm install

# FIX: Explicitly install the libraries we added recently
# This ensures they are available during the build
RUN npm install bootstrap @popperjs/core papaparse recharts @types/papaparse

# Copy source code
COPY . .

# Build the app (outputs to /dist)
RUN npm run build

# --- Stage 2: Serve with Nginx ---
FROM nginx:alpine

# Copy the build output from Stage 1 to Nginx html directory
COPY --from=build /app/dist /usr/share/nginx/html

# Copy our custom Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]