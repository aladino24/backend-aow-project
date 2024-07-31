const express = require('express');
const app = express();
require('dotenv').config();

const cors = require('cors');

const corsOptions = {
  origin: 'https://aow-games.vercel.app', 
  optionsSuccessStatus: 200
};

app.use(cors(corsOptions));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
const authenticateToken = require('./middlewares/authMiddleware');

const { 
    router: userRoutes, 
    publicRouter: publicUserRoutes 
} = require('./routes/userRoutes');
const authRoutes = require('./routes/authRoutes');
// const mapRoutes = require('./routes/mapRoutes');
// const roomRoutes = require('./routes/roomRoutes');
// const participantRoutes = require('./routes/participantRoutes');

app.use('/api/users', publicUserRoutes);

app.use('/api/user', authenticateToken, userRoutes);
app.use('/api/auth', authRoutes);


// app.use('/maps', mapRoutes);
// app.use('/rooms', roomRoutes);
// app.use('/participants', participantRoutes);

module.exports = app;
