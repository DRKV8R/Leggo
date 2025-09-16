const request = require('supertest');
const app = require('../server/index');

describe('Psychic Guacamole Server', () => {
  let server;

  afterAll((done) => {
    if (server) {
      server.close(done);
    } else {
      done();
    }
  });

  test('GET /api/status should return welcome message', async () => {
    const response = await request(app)
      .get('/api/status')
      .expect(200);
    
    expect(response.body.message).toBe('Welcome to Psychic Guacamole Server!');
    expect(response.body.status).toBe('running');
  });

  test('GET /api/health should return health status', async () => {
    const response = await request(app)
      .get('/api/health')
      .expect(200);
    
    expect(response.body.status).toBe('healthy');
    expect(response.body.uptime).toBeGreaterThanOrEqual(0);
  });

  test('GET /api/psychic should return a prediction', async () => {
    const response = await request(app)
      .get('/api/psychic')
      .expect(200);
    
    expect(response.body.prediction).toBeDefined();
    expect(response.body.confidence).toBeGreaterThan(0);
    expect(response.body.confidence).toBeLessThanOrEqual(100);
  });

  test('GET /nonexistent should return 404', async () => {
    const response = await request(app)
      .get('/nonexistent')
      .expect(404);
    
    expect(response.body.error).toBe('Not Found');
  });
});