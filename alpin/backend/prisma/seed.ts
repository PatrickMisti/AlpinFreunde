import { PrismaClient } from '@prisma/client';
import * as process from 'node:process';

const prisma = new PrismaClient();

async function main() {
  console.log('Fill db');
  const count = await prisma.user.count();
  if (count === 0) {
    const user1 = prisma.user.create({
      data: {
        name: 'Herbert',
        email: 'herbert@gmail.com',
      },
    });
    console.log('create user:', user1);
  }
}

main()
  .catch((err) => {
    console.error(err);
    process.exit(1);
  })
  .finally(async () => {
    prisma.$disconnect();
    process.exit(0);
  });
