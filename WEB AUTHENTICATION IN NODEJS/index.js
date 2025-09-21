require('dotenv').config(); // Load .env variables

const express = require('express');
const authRoutes = require('./server'); // Import auth routes

const app = express();

app.use(express.json());
app.use('/api/auth', authRoutes);

app.get('/', (req, res) => {
  res.send('✅ Node.js Authentication API is running!');
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${3000}`);
});
