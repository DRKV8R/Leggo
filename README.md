# Psychic Guacamole Server 🥑🔮

A mystical web server that provides psychic predictions with the power of avocados!

## Features

- 🌐 Web server with REST API
- 🔮 Psychic prediction endpoints
- 📊 Health monitoring
- 🎨 Beautiful web interface
- 🐛 Debug configuration
- 🧪 Test suite included

## Quick Start

### Prerequisites

- Node.js (v14 or higher)
- npm (comes with Node.js)

### Installation & Setup

1. **Run the setup script:**
   ```bash
   ./setup.sh
   ```

2. **Or manually install:**
   ```bash
   npm install
   cp .env.example .env
   ```

### Running the Server

1. **Start the server:**
   ```bash
   npm start
   ```

2. **For development (with auto-reload):**
   ```bash
   npm run dev
   ```

3. **For debugging:**
   ```bash
   npm run debug
   ```

4. **Visit the application:**
   Open your browser and go to: http://localhost:3000

## Project Structure

```
psychic-guacamole-server/
├── server/
│   └── index.js          # Main server file
├── public/
│   └── index.html        # Web interface
├── tests/
│   └── server.test.js    # Test suite
├── config/               # Configuration files
├── logs/                 # Log files
├── .vscode/
│   └── launch.json       # VS Code debug config
├── .env.example          # Environment variables template
├── setup.sh              # Setup script
└── package.json          # Project dependencies
```

## API Endpoints

- `GET /` - Welcome message and server status
- `GET /api/health` - Server health check
- `GET /api/psychic` - Get a psychic prediction

### Example API Responses

**Health Check:**
```json
{
  "status": "healthy",
  "uptime": 123.45,
  "memory": { ... },
  "timestamp": "2023-..."
}
```

**Psychic Prediction:**
```json
{
  "prediction": "Your future holds great success!",
  "confidence": 87,
  "timestamp": "2023-..."
}
```

## Development

### Testing

Run the test suite:
```bash
npm test
```

### Debugging

1. **VS Code:** Use the debug configurations in `.vscode/launch.json`
2. **Command line:** Use `npm run debug` and connect to `http://localhost:9229`

### Environment Variables

Copy `.env.example` to `.env` and customize:

```env
PORT=3000
NODE_ENV=development
LOG_LEVEL=info
```

## Troubleshooting

### Port Already in Use
If port 3000 is busy, change the PORT in your `.env` file:
```env
PORT=3001
```

### Missing Dependencies
Run the setup script again:
```bash
./setup.sh
```

### Permission Issues
Make sure the setup script is executable:
```bash
chmod +x setup.sh
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests: `npm test`
5. Submit a pull request

## License

MIT License - see LICENSE file for details