import { ApiProperty } from '@nestjs/swagger';

export class UserDto {
  @ApiProperty()
  name: string;

  @ApiProperty()
  email: string;

  constructor(name: string, email: string) {
    this.name = name;
    this.email = email;
  }
}
