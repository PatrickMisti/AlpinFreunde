import { Body, Controller, Get, Param, Post, Put } from '@nestjs/common';
import { UserService } from './user.service';
import { UserDto } from '../dto/userDto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('user')
@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get('users')
  findUsers() {
    return this.userService.findAllUsers();
  }

  @Post('adduser')
  createUser(@Body() user: UserDto) {
    return this.userService.createUser(user);
  }
}
