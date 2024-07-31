const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const createUser = async (userData) => {
  try {
    const user = await prisma.userAccount.create({
      data: {
        nameId: userData.nameId,
        fraksi: userData.fraksi,
        rank: userData.rank.toString(),  // Pastikan rank adalah string
        jumlahSkillCard: parseInt(userData.jumlahSkillCard, 10),
        jumlahUpgrade: parseInt(userData.jumlahUpgrade, 10),
        keterangan: userData.keterangan,
        namaPemilikAccount: userData.namaPemilikAccount,
        noWa: userData.noWa,
        status: userData.status,
        namaKlan: userData.namaKlan,
        penghargaan: userData.penghargaan,
        peringkatPemainUmum: parseInt(userData.peringkatPemainUmum, 10),
        peringkatPemainTurnamen: parseInt(userData.peringkatPemainTurnamen || 0, 10),
        peringkatPemainSkirmish: parseInt(userData.peringkatPemainSkirmish || 0, 10),
        peringkatPemainPrestasi: parseInt(userData.peringkatPemainPrestasi || 0, 10),
        password: userData.password,
      },
    });
    return user;
  } catch (error) {
    throw new Error(error.message);
  }
};

// getAllUser
const getAllUser = async () => {
  try {
    const users = await prisma.userAccount.findMany();
    return users;
  } catch (error) {
    throw new Error(error.message);
  }
}

module.exports = {
  createUser, getAllUser
};
