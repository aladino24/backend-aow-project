const express = require('express');
const userController = require('../controllers/userController');

// Router untuk rute yang memerlukan autentikasi
const router = express.Router();
router.post('/', userController.createUser);
router.get('/', userController.getAllUser);

// Router untuk rute publik
const publicRouter = express.Router();
publicRouter.get('/all', userController.getAllUser);

module.exports = { router, publicRouter };
