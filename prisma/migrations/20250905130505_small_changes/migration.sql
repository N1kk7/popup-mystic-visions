/*
  Warnings:

  - Added the required column `amountTotal` to the `CheckoutSession` table without a default value. This is not possible if the table is not empty.
  - Added the required column `clientEmail` to the `CheckoutSession` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."CheckoutSession" ADD COLUMN     "amountTotal" INTEGER NOT NULL,
ADD COLUMN     "clientEmail" TEXT NOT NULL;
