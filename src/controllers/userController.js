const userService = require('../services/userService');

exports.createUser = async (req, res) => {
  try {
    const user = await userService.createUser(req.body);
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// get all user
exports.getAllUser = async (req, res) => {
  try {
    const users = await userService.getAllUser();
    res.json(users);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}
