const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// API Routes (must come before static middleware)
app.get('/api/status', (req, res) => {
  res.json({
    message: 'Welcome to Psychic Guacamole Server!',
    status: 'running',
    timestamp: new Date().toISOString()
  });
});

app.get('/api/health', (req, res) => {
  res.json({
    status: 'healthy',
    uptime: process.uptime(),
    memory: process.memoryUsage(),
    timestamp: new Date().toISOString()
  });
});

app.get('/api/psychic', (req, res) => {
  const predictions = [
    "Your future holds great success!",
    "A mysterious opportunity awaits you.",
    "The avocado spirits guide your path.",
    "Green energy surrounds your decisions.",
    "Fortune favors the bold guacamole lover."
  ];
  
  const randomPrediction = predictions[Math.floor(Math.random() * predictions.length)];
  
  res.json({
    prediction: randomPrediction,
    confidence: Math.floor(Math.random() * 100) + 1,
    timestamp: new Date().toISOString()
  });
});

// Static files (after API routes)
app.use(express.static(path.join(__dirname, '../public')));

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({
    error: 'Something went wrong!',
    message: err.message
  });
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({
    error: 'Not Found',
    message: 'The requested resource was not found'
  });
});

// Only start server if this file is run directly
if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`🥑 Psychic Guacamole Server is running on port ${PORT}`);
    console.log(`🔮 Visit http://localhost:${PORT} to see the magic!`);
    console.log(`📊 Health check: http://localhost:${PORT}/api/health`);
    console.log(`🎯 Predictions: http://localhost:${PORT}/api/psychic`);
  });
}

module.exports = app;