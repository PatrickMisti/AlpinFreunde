export class User {
  id?: number;
  deleted?: boolean;
  timestamp: Date;
  role: Role;
  roleId: number;

  firstName?: string;
  lastName?: string;
  userName?: string;
  password: string;

  email: string
  pushNotification: boolean
  // userOnAppointment: UserOnAppointment[]

  constructor(role: Role, email: string, userName: string, password: string, firstName?: string, lastName?: string, pushNotification?: boolean) {
    this.timestamp = new Date(Date.now());
    this.roleId = role.id;
    this.email = email;
    this.userName = userName;
    this.password = password;
    this.firstName = firstName;
    this.lastName = lastName;
    this.role = role;
    this.pushNotification = pushNotification;
  }
}

export class Role {
  id?: number;
  deleted?: boolean;
  timestamp: Date;
  name: string
  permission?: string;
  isAdmin: boolean

  constructor (name: string,permission?: string,isAdmin?: boolean) {
    this.timestamp = new Date(Date.now());
    this.permission = permission;
    this.name = name;
    this.isAdmin = isAdmin;
  }
}