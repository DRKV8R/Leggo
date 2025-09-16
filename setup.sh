#!/bin/bash

echo "🥑 Setting up Psychic Guacamole Server..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    echo "   Visit: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js is available: $(node --version)"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ npm is available: $(npm --version)"

# Create project folders if they don't exist
echo "📁 Creating project folders..."
mkdir -p server public config logs tests .vscode

# Copy environment file if it doesn't exist
if [ ! -f .env ]; then
    echo "📄 Creating .env file from example..."
    cp .env.example .env
else
    echo "✅ .env file already exists"
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Add supertest for testing
npm install --save-dev supertest

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Available commands:"
echo "  npm start     - Start the server"
echo "  npm run dev   - Start with auto-reload (development)"
echo "  npm test      - Run tests"
echo "  npm run debug - Start with debugger"
echo ""
echo "🚀 Run 'npm start' to launch the Psychic Guacamole Server!"
echo "🌐 Then visit http://localhost:3000 in your browser"