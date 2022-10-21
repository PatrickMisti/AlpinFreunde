class User {
  String? userName;
  String? firstName;
  String? lastName;
  final String email;
  final String password;
  bool? emailPush = false;
  bool? push = false;

  User(
      {this.userName,
      this.firstName,
      this.lastName,
      required this.email,
      required this.password,
      this.emailPush,
      this.push});

  bool isEqual(User other) {
    return userName == other.userName &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        password == other.password;
  }
}
