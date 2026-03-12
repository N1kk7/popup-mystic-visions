-- AlterTable
ALTER TABLE "public"."User" ADD COLUMN     "skoolSubscription" BOOLEAN DEFAULT false,
ADD COLUMN     "skoolUserEmail" TEXT,
ADD COLUMN     "skoolUserId" TEXT;
