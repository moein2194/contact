import 'package:contact/core/global/app_global.dart';
import 'package:contact/core/network/http_urls.dart';
import 'package:dio/dio.dart';

class HttpRequestHanlder {
  static final String _base = HttpUrls.baseUrl;

  static Future<(dynamic data, String? errorMessage)> get(
    String path, {
    Map<String, dynamic>? parameters,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(hasApi: hasApi),
      );

      final response = await Dio().get(
        _base + path,
        queryParameters: parameters ?? {},
        options: options,
      );

      return (response.data, null);
    } on DioException catch (error) {
      return (null, error.message!);
    }
  }

  static Future<(Map<String, dynamic>? data, String? errorMessage)> post(
    String path, {
    Map<String, dynamic>? parameters,
    FormData? data,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(hasApi: hasApi),
      );

      final response = await Dio().post(
        _base + path,
        queryParameters: parameters ?? {},
        data: data,
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (null, error.message!);
    }
  }

  static Future<(Map<String, dynamic>? data, String? errorMessage)> put(
    String path, {
    Map<String, dynamic>? parameters,
    FormData? data,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(hasApi: hasApi),
      );

      final response = await Dio().put(
        _base + path,
        queryParameters: parameters ?? {},
        data: data,
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (null, error.message!);
    }
  }

  static Future<(Map<String, dynamic>? data, String? errorMessage)> patch(
    String path, {
    Map<String, dynamic>? parameters,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(hasApi: hasApi),
      );

      final response = await Dio().patch(
        _base + path,
        queryParameters: parameters ?? {},
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (null, error.message!);
    }
  }

  static Future<(Map<String, dynamic>? data, String? errorMessage)> delete(
    String path, {
    Map<String, dynamic>? parameters,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(hasApi: hasApi),
      );

      final response = await Dio().delete(
        _base + path,
        queryParameters: parameters ?? {},
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (null, error.message!);
    }
  }

  static Map<String, dynamic>? _header(
      {bool hasApi = false, bool hasHeader = true}) {
    if (hasHeader) {
      if (hasApi) {
        return {
          'x-api-key': AppGlobal.appApiKey,
          'Content-Type': 'application/json; charset=UTF-8',
        };
      } else {
        return {
          'Content-Type': 'application/json; charset=UTF-8',
        };
      }
    } else {
      return null;
    }
  }
}
