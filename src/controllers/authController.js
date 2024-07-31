const jwt = require('jsonwebtoken');
const {PrismaClient, Prisma} = require('@prisma/client');
const prisma = new PrismaClient();

const SECRET_KEY = process.env.SECRET_KEY;

exports.login = async (req, res) => {
    const {nameId, password} = req.body;

    try {
        const user = await prisma.userAccount.findUnique({
            where: {
                nameId: nameId,
            },
        })

        if (user && user.password === password) {
            const token = jwt.sign({ id: user.id, nameId: user.nameId }, SECRET_KEY, { expiresIn: '1h' });
            res.json({ token });
          } else {
            res.status(401).json({ error: 'Invalid username or password' });
          }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}