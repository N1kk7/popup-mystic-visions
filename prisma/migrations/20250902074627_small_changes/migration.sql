/*
  Warnings:

  - You are about to drop the column `monthlyAmount` on the `SubscriptionPlan` table. All the data in the column will be lost.
  - You are about to drop the column `yearlyAmount` on the `SubscriptionPlan` table. All the data in the column will be lost.
  - Added the required column `amount` to the `SubscriptionPlan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `priceId` to the `SubscriptionPlan` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."SubscriptionPlan" DROP COLUMN "monthlyAmount",
DROP COLUMN "yearlyAmount",
ADD COLUMN     "amount" INTEGER NOT NULL,
ADD COLUMN     "priceId" TEXT NOT NULL;
