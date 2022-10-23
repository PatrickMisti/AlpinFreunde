
/// loginService controls all get, post and put statements
class LoginService {

  Future<String> sendEmailForCode(String email) async {
    //todo send email to backend and get code 4 pin
    return "asdf";
  }

  Future<bool> sendNewPassword(String newPassword) async {
    //todo http change password and return true if success
    return true;
  }
}