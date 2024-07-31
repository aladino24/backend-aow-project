/*
  Warnings:

  - You are about to drop the column `rank` on the `UserAccount` table. All the data in the column will be lost.
  - Added the required column `rankAccount` to the `UserAccount` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `UserAccount` DROP COLUMN `rank`,
    ADD COLUMN `rankAccount` VARCHAR(191) NOT NULL;
