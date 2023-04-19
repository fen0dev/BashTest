#!/bin/bash

# Prompt the user for the name of the web application
read -p "Enter the name of the web application: " appname

# Prompt the user for the directory where the web application will be deployed
read -p "Enter the deployment directory for the web application: " deploydir

# Create a new directory for the web application
mkdir "$appname"

# Clone the latest version of the web application from the Git repository
git clone https://github.com/username/$appname.git "$appname"

# Install the necessary dependencies for the web application
cd "$appname"
npm install

# Build the production version of the web application
npm run build

# Copy the production build files to the deployment directory
cp -r build/* "$deploydir"

# Start the web server
cd "$deploydir"
pm2 start server.js

echo "Web application $appname deployed to $deploydir"
