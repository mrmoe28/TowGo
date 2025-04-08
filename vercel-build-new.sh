
#!/bin/bash
set -e

echo "Starting Vercel build process..."

# Copy the Vercel-specific package.json
echo "Copying Vercel-specific package.json..."
cp package.vercel.json package.json

# Install dependencies if needed
echo "Installing dependencies..."
npm install

# Run build script
echo "Building application..."
npx vite build

# Ensure server.js is copied to dist directory
echo "Copying server.js to dist directory..."
cp server.js dist/server.js

# Create necessary directories for Vercel
echo "Setting up directory structure for Vercel..."
mkdir -p dist/client

# Ensure index.js is correctly named
if [ -f "dist/index.js" ]; then
  echo "Renaming index.js to match Vercel expectations..."
  cp dist/index.js dist/index.mjs
fi

echo "Verifying file structure..."
ls -la dist
echo "Build process completed successfully!"
