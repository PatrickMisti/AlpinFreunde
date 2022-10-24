import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// HttpWrapper init [_httpUri] in main class
///
/// [Get], [Post], [Put], [Delete]
class HttpWrapper {
  static late String _httpUri;

  static set httpUrl(String url) => _httpUri = url;

  Future<T> get<T>(String _path) async {
    try {
      Uri path = _buildUri(_path);
      log("Http Get request: ${path.path}");
      final response = await http.get(path);
      return jsonDecode(response.body) as T;
    } on HttpException catch (err) {
      throw HttpException(err.message, uri: err.uri);
    }
  }

  Future post<T>(String _path, T obj) async {
    try {
      Uri path = _buildUri(_path);
      log("Http Post request ${path.path} value: ${jsonEncode(obj)}");
      final response = await http.post(path, body: obj);
      return response.body;
    } on HttpException catch (err) {
      throw HttpException(err.message, uri: err.uri);
    }
  }

  Future put<T>(String _path, T obj) async {
    try {
      Uri path = _buildUri(_path);
      log("Http Put request ${path.path} value: ${jsonEncode(obj)}");
      final response = await http.put(path, body: obj);
      return response.body;
    } on HttpException catch (err) {
      throw HttpException(err.message, uri: err.uri);
    }
  }

  Future delete<T>(String _path, T obj) async {
    try {
      Uri path = _buildUri(_path);
      log("Http Delete request ${path.path} value: ${jsonEncode(obj)}");
      final response = await http.delete(path, body: obj);
      return response.body;
    } on HttpException catch (err) {
      throw HttpException(err.message, uri: err.uri);
    }
  }

  Uri _buildUri(String path) {
    return kDebugMode ? Uri.http(_httpUri, path) : Uri.https(_httpUri, path);
  }
}
