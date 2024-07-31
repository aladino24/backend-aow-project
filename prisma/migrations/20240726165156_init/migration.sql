/*
  Warnings:

  - You are about to drop the column `createdById` on the `Room` table. All the data in the column will be lost.
  - You are about to drop the column `idRoom` on the `Room` table. All the data in the column will be lost.
  - You are about to drop the column `link` on the `Room` table. All the data in the column will be lost.
  - You are about to drop the column `mapId` on the `Room` table. All the data in the column will be lost.
  - You are about to drop the column `rule` on the `Room` table. All the data in the column will be lost.
  - The values [KONFRONTASI_1VS1,DOMINASI_1VS1,MANUVER_1VS1,DUA_VS_DUAs] on the enum `Room_tipePerang` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the `Map` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RoomParticipant` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `createdBy` to the `Room` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mapPerangId` to the `Room` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rulePerang` to the `Room` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Room` DROP FOREIGN KEY `Room_createdById_fkey`;

-- DropForeignKey
ALTER TABLE `Room` DROP FOREIGN KEY `Room_mapId_fkey`;

-- DropForeignKey
ALTER TABLE `RoomParticipant` DROP FOREIGN KEY `RoomParticipant_roomId_fkey`;

-- DropForeignKey
ALTER TABLE `RoomParticipant` DROP FOREIGN KEY `RoomParticipant_userId_fkey`;

-- AlterTable
ALTER TABLE `Room` DROP COLUMN `createdById`,
    DROP COLUMN `idRoom`,
    DROP COLUMN `link`,
    DROP COLUMN `mapId`,
    DROP COLUMN `rule`,
    ADD COLUMN `createdBy` INTEGER NOT NULL,
    ADD COLUMN `mapPerangId` INTEGER NOT NULL,
    ADD COLUMN `rulePerang` VARCHAR(191) NOT NULL,
    MODIFY `tipePerang` ENUM('KONFRONTASI', 'DOMINASI', 'MANUVER', 'DUA_VS_DUA', 'TIGA_VS_TIGA', 'FFA3', 'FFA4', 'FFA5', 'FFA6') NOT NULL;

-- DropTable
DROP TABLE `Map`;

-- DropTable
DROP TABLE `RoomParticipant`;

-- DropTable
DROP TABLE `User`;

-- CreateTable
CREATE TABLE `UserAccount` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nameId` VARCHAR(191) NOT NULL,
    `fraksi` VARCHAR(191) NOT NULL,
    `rank` VARCHAR(191) NOT NULL,
    `jumlahSkillCard` INTEGER NOT NULL,
    `jumlahUpgrade` INTEGER NOT NULL,
    `keterangan` VARCHAR(191) NULL,
    `namaPemilikAccount` VARCHAR(191) NOT NULL,
    `noWa` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `namaKlan` VARCHAR(191) NOT NULL,
    `penghargaan` VARCHAR(191) NULL,
    `peringkatPemainUmum` INTEGER NOT NULL,
    `peringkatPemainTurnamen` INTEGER NOT NULL,
    `peringkatPemainSkirmish` INTEGER NOT NULL,
    `peringkatPemainPrestasi` INTEGER NOT NULL,
    `password` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MapPerang` (
    `noMap` INTEGER NOT NULL AUTO_INCREMENT,
    `namaMap` VARCHAR(191) NOT NULL,
    `gambar` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`noMap`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Participant` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `roomId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Room` ADD CONSTRAINT `Room_mapPerangId_fkey` FOREIGN KEY (`mapPerangId`) REFERENCES `MapPerang`(`noMap`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Room` ADD CONSTRAINT `Room_createdBy_fkey` FOREIGN KEY (`createdBy`) REFERENCES `UserAccount`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Participant` ADD CONSTRAINT `Participant_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `UserAccount`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Participant` ADD CONSTRAINT `Participant_roomId_fkey` FOREIGN KEY (`roomId`) REFERENCES `Room`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
