import { PrismaClient } from '@prisma/client';

declare global {
  var prisma: PrismaClient | undefined;
}

const prisma = global.prisma ?? new PrismaClient();
if (!global.prisma) {
  global.prisma = prisma;
}

export default prisma;

// import { PrismaClient } from '@prisma/client';
// import { Pool } from 'pg';
// import { PrismaPg } from '@prisma/adapter-pg';

// const pool = new Pool({
//   connectionString: process.env.SUPABASE_URL,
// });

// const adapter = new PrismaPg(pool);

// declare global {
//   // eslint-disable-next-line no-var
//   var prisma: PrismaClient | undefined;
// }

// const prisma =
//   global.prisma ??
//   new PrismaClient({
//     adapter,
//   });

// if (!global.prisma) {
//   global.prisma = prisma;
// }

// export default prisma;
