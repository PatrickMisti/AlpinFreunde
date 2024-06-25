import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { User } from '@prisma/client';
import { UserDto } from '../dto/userDto';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}

  findAllUsers(): Promise<User[]> {
    return this.prisma.user.findMany();
  }

  createUser(user: UserDto) {
    return this.prisma.user.create({
      data: {
        name: user.name,
        email: user.email,
      },
    });
  }
}
