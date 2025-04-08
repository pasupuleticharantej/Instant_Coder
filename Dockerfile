# Use Node 22 as the base image
FROM node:22-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if you have one)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port your React app runs on
EXPOSE 7860

# Change ownership of /app to the node user
RUN chown -R node:node /app

# Switch to the node user
USER node

# Command to run the application
CMD ["npm", "run", "dev"]