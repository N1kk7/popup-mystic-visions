/*
  Warnings:

  - Made the column `country` on table `Callback` required. This step will fail if there are existing NULL values in that column.
  - Made the column `language` on table `Callback` required. This step will fail if there are existing NULL values in that column.
  - Made the column `timeZone` on table `Callback` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "public"."Callback" ALTER COLUMN "country" SET NOT NULL,
ALTER COLUMN "language" SET NOT NULL,
ALTER COLUMN "timeZone" SET NOT NULL;
