/*
  Warnings:

  - A unique constraint covering the columns `[skoolUserEmail]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "User_skoolUserEmail_key" ON "public"."User"("skoolUserEmail");
