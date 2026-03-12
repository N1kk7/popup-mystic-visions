/*
  Warnings:

  - You are about to drop the column `activeSub` on the `Seller` table. All the data in the column will be lost.
  - You are about to drop the column `pendingSub` on the `Seller` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "public"."CheckoutStatus" AS ENUM ('PENDING', 'COMPLETED', 'EXPIRED');

-- AlterTable
ALTER TABLE "public"."Seller" DROP COLUMN "activeSub",
DROP COLUMN "pendingSub";

-- CreateTable
CREATE TABLE "public"."CheckoutSession" (
    "id" TEXT NOT NULL,
    "sellerId" TEXT NOT NULL,
    "userId" TEXT,
    "status" "public"."CheckoutStatus" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CheckoutSession_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "public"."CheckoutSession" ADD CONSTRAINT "CheckoutSession_sellerId_fkey" FOREIGN KEY ("sellerId") REFERENCES "public"."Seller"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."CheckoutSession" ADD CONSTRAINT "CheckoutSession_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
