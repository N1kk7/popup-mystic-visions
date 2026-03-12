/*
  Warnings:

  - You are about to drop the column `subQuantity` on the `Seller` table. All the data in the column will be lost.
  - Added the required column `activeSub` to the `Seller` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pendingSub` to the `Seller` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."Seller" DROP COLUMN "subQuantity",
ADD COLUMN     "activeSub" INTEGER NOT NULL,
ADD COLUMN     "pendingSub" INTEGER NOT NULL;
