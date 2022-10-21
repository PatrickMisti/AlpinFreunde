class User {
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  bool? emailPush = false;
  bool? push = false;

  User(
      {required this.userName,
      required this.firstName,
      required this.lastName,
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
