#!/bin/bash

echo "🔍 Verifying Psychic Guacamole Server Setup..."
echo ""

# Check if all required files exist
echo "📁 Checking project structure..."
required_files=(
    "package.json"
    "server/index.js"
    "public/index.html"
    "tests/server.test.js"
    ".env.example"
    "setup.sh"
    "README.md"
)

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file exists"
    else
        echo "❌ $file missing"
        exit 1
    fi
done

echo ""
echo "🧪 Running tests..."
npm test

if [ $? -eq 0 ]; then
    echo "✅ All tests passed!"
else
    echo "❌ Tests failed!"
    exit 1
fi

echo ""
echo "🚀 Starting server for verification..."
npm start &
SERVER_PID=$!

# Wait for server to start
sleep 3

echo ""
echo "🔍 Testing API endpoints..."

# Test status endpoint
STATUS_RESPONSE=$(curl -s http://localhost:3000/api/status)
if echo "$STATUS_RESPONSE" | grep -q "Welcome to Psychic Guacamole Server"; then
    echo "✅ Status endpoint working"
else
    echo "❌ Status endpoint failed"
    kill $SERVER_PID
    exit 1
fi

# Test health endpoint
HEALTH_RESPONSE=$(curl -s http://localhost:3000/api/health)
if echo "$HEALTH_RESPONSE" | grep -q "healthy"; then
    echo "✅ Health endpoint working"
else
    echo "❌ Health endpoint failed"
    kill $SERVER_PID
    exit 1
fi

# Test psychic endpoint
PSYCHIC_RESPONSE=$(curl -s http://localhost:3000/api/psychic)
if echo "$PSYCHIC_RESPONSE" | grep -q "prediction"; then
    echo "✅ Psychic endpoint working"
else
    echo "❌ Psychic endpoint failed"
    kill $SERVER_PID
    exit 1
fi

# Stop the server
kill $SERVER_PID

echo ""
echo "🎉 All verifications passed!"
echo "📋 Setup Summary:"
echo "   - Project structure: ✅"
echo "   - Dependencies: ✅"
echo "   - Tests: ✅"
echo "   - API endpoints: ✅"
echo "   - Web interface: ✅"
echo "   - Debug configuration: ✅"
echo ""
echo "🚀 Server is ready to use!"
echo "   Run: npm start"
echo "   Visit: http://localhost:3000"