
import 'dart:async';

import 'package:alpin_frontend/services/disposabled.dart';
import 'package:alpin_frontend/services/service_base.dart';
import 'package:alpin_frontend/utilities/http_wrapper.dart';
import 'package:get_it/get_it.dart';

/// loginService controls all get, post and put statements
class LoginService extends BaseService {
  late HttpWrapper _http;

  LoginService() {
    _http = HttpWrapper();
  }

  Future<String> sendEmailForCode(String email) async {
    //todo send email to backend and get code 4 pin

    return "asdf";
  }

  Future<bool> sendNewPassword(String newPassword) async {
    //todo http change password and return true if success
    return true;
  }
}