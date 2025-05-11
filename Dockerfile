# Build stage
FROM node:18-alpine as build-stage

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Set build arguments
ARG VITE_FINGERPRINT_API_KEY
ARG VITE_FINGERPRINT_SERVER_KEY

# Set environment variables
ENV VITE_FINGERPRINT_API_KEY=$VITE_FINGERPRINT_API_KEY
ENV VITE_FINGERPRINT_SERVER_KEY=$VITE_FINGERPRINT_SERVER_KEY

# Build the app
RUN npm run build

# Production stage
FROM node:18-alpine

WORKDIR /app

# Install serve
RUN npm install -g serve

# Copy built files from build stage
COPY --from=build-stage /app/dist ./dist

# Expose port
EXPOSE 4999

# Start serve
CMD ["serve", "-s", "dist", "-l", "4999"] 