-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `namaId` VARCHAR(191) NOT NULL,
    `fraksi` VARCHAR(191) NOT NULL,
    `rank` VARCHAR(191) NOT NULL,
    `jumlahSkillCard` INTEGER NOT NULL,
    `jumlahUpgrade` INTEGER NOT NULL,
    `keterangan` VARCHAR(191) NULL,
    `namaPemilik` VARCHAR(191) NOT NULL,
    `noWa` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `namaKlan` VARCHAR(191) NOT NULL,
    `penghargaan` VARCHAR(191) NULL,
    `peringkatPemainUmum` INTEGER NOT NULL,
    `peringkatPemainTurnamen` INTEGER NOT NULL,
    `peringkatPemainSkirmish` INTEGER NOT NULL,
    `peringkatPemainPrestasi` INTEGER NOT NULL,
    `password` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `User_namaId_key`(`namaId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Map` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NOT NULL,
    `gambar` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Room` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tipePerang` ENUM('KONFRONTASI_1VS1', 'DOMINASI_1VS1', 'MANUVER_1VS1', 'DUA_VS_DUAs', 'TIGA_VS_TIGA', 'FFA3', 'FFA4', 'FFA5', 'FFA6') NOT NULL,
    `mapId` INTEGER NOT NULL,
    `rule` VARCHAR(191) NOT NULL,
    `createdById` INTEGER NOT NULL,
    `link` VARCHAR(191) NOT NULL,
    `idRoom` VARCHAR(191) NOT NULL,
    `broadcastMessage` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RoomParticipant` (
    `roomId` INTEGER NOT NULL,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`roomId`, `userId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Room` ADD CONSTRAINT `Room_mapId_fkey` FOREIGN KEY (`mapId`) REFERENCES `Map`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Room` ADD CONSTRAINT `Room_createdById_fkey` FOREIGN KEY (`createdById`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RoomParticipant` ADD CONSTRAINT `RoomParticipant_roomId_fkey` FOREIGN KEY (`roomId`) REFERENCES `Room`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RoomParticipant` ADD CONSTRAINT `RoomParticipant_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
