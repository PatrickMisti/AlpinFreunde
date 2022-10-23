
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpClient {

  Future<T> get<T>(Uri path) async {
    try {
      final response = await http.get(path);

      return response.body as T;
    } catch (err) {
      stderr.addError(err); // dont know if it work
      return null as T;
    }
  }
  // todo create tests for services to check it make mockdata
// todo important error handler!!!!!



}