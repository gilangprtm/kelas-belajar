import 'dart:convert';
// import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/service/mahas_service.dart';
import '../mahas_config.dart';
import '../models/api_result_model.dart';
import 'package:http/http.dart' as http;

class HttpApi {
  static String? _apiToken;

  static void clearToken() {
    _apiToken = null;
  }

  static Future<String?> _token() async {
    _apiToken = await auth.currentUser?.getIdToken(true);

    return _apiToken;
  }

  static String getUrl(String url) {
    if (url.toUpperCase().contains('HTTPS://') ||
        url.toUpperCase().contains('HTTP://')) {
      return url;
    } else {
      return MahasConfig.urlApi + url;
    }
  }

  static ApiResultModel _getResult(http.Response r) {
    // print(r.body);
    // print(r.statusCode);
    // print(r.request!.url);
    // print(r.request!.method);
    return ApiResultModel(r.statusCode, r.body);
  }

  static ApiResultModel _getErrorResult(dynamic ex) {
    _apiToken = null;
    String errorString = "";
    return ApiResultModel.error(errorString);
  }

  static Future<ApiResultModel> get(String url) async {
    try {
      final token = await _token();
      // log(token!);
      final urlX = Uri.parse(getUrl(url));
      final r = await http.get(
        urlX,
        headers: {
          'Authorization': token != null ? 'Bearer $token' : '',
        },
      );

      return _getResult(r);
    } catch (ex) {
      if (ex is FirebaseAuthException && ex.code == 'network-request-failed') {
        // Handle Firebase network error
        return ApiResultModel.error(
          "Error Request \nCek koneksi internet Anda dan coba beberapa saat lagi!",
        );
      } else {
        return _getErrorResult(ex);
      }
    }
  }

  static Future<ApiResultModel> post(String url, {Object? body}) async {
    try {
      final token = await _token();
      final urlX = Uri.parse(getUrl(url));
      var r = await http.post(
        urlX,
        headers: {
          'Content-type': 'application/json',
          'Authorization': token != null ? 'Bearer $token' : '',
        },
        body: json.encode(body),
      );
      return _getResult(r);
    } catch (ex) {
      if (ex is FirebaseAuthException && ex.code == 'network-request-failed') {
        // Handle Firebase network error
        return ApiResultModel.error(
          "Error Request \nCek koneksi internet Anda dan coba beberapa saat lagi!",
        );
      } else {
        return _getErrorResult(ex);
      }
    }
  }

  static Future<ApiResultModel> put(String url, {Object? body}) async {
    try {
      final token = await _token();
      final urlX = Uri.parse(getUrl(url));
      var r = await http.put(
        urlX,
        headers: {
          'Content-type': 'application/json',
          'Authorization': token != null ? 'Bearer $token' : '',
        },
        body: json.encode(body),
      );
      return _getResult(r);
    } catch (ex) {
      if (ex is FirebaseAuthException && ex.code == 'network-request-failed') {
        // Handle Firebase network error
        return ApiResultModel.error(
          "Error Request \nCek koneksi internet Anda dan coba beberapa saat lagi!",
        );
      } else {
        return _getErrorResult(ex);
      }
    }
  }

  static Future<ApiResultModel> delete(String url, {Object? body}) async {
    try {
      final token = await _token();
      final urlX = Uri.parse(getUrl(url));
      var r = await http.delete(
        urlX,
        headers: {
          'Content-type': 'application/json',
          'Authorization': token != null ? 'Bearer $token' : '',
        },
        body: json.encode(body),
      );
      return _getResult(r);
    } catch (ex) {
      if (ex is FirebaseAuthException && ex.code == 'network-request-failed') {
        // Handle Firebase network error
        return ApiResultModel.error(
          "Error Request \nCek koneksi internet Anda dan coba beberapa saat lagi!",
        );
      } else {
        return _getErrorResult(ex);
      }
    }
  }
}
