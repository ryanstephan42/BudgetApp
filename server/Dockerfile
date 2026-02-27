# Use lightweight Node image
FROM node:22-alpine

# Create app directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Create uploads directory for receipts
RUN mkdir -p uploads

# Expose the API port
EXPOSE 5500

# Start the application
CMD ["npm", "start"]
