/*
  Warnings:

  - A unique constraint covering the columns `[stripeId]` on the table `CheckoutSession` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `stripeId` to the `CheckoutSession` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."CheckoutSession" ADD COLUMN     "stripeId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "CheckoutSession_stripeId_key" ON "public"."CheckoutSession"("stripeId");
