-- CreateEnum
CREATE TYPE "public"."ChoicedBookCover" AS ENUM ('SOFT_COVER', 'HARD_COVER');

-- AlterTable
ALTER TABLE "public"."User" ADD COLUMN     "bookCover" "public"."ChoicedBookCover" NOT NULL DEFAULT 'HARD_COVER';
