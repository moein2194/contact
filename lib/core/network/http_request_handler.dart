import 'package:contact/core/global/app_global.dart';
import 'package:contact/core/network/http_urls.dart';
import 'package:dio/dio.dart';

class HttpRequestHanlder {
  static final String _base = HttpUrls.baseUrl;

  static Future<Map<String, dynamic>> get(
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

      return response.data;
    } on DioException catch (error) {
      throw error.message!;
    }
  }

  static Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? parameters,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(hasApi: hasApi),
      );

      final response = await Dio().post(
        _base + path,
        queryParameters: parameters ?? {},
        options: options,
      );

      return response.data;
    } on DioException catch (error) {
      throw error.message!;
    }
  }

  static Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? parameters,
    bool hasApi = true,
  }) async {
    try {
      final options = Options(
        headers: _header(hasApi: hasApi),
      );

      final response = await Dio().put(
        _base + path,
        queryParameters: parameters ?? {},
        options: options,
      );

      return response.data;
    } on DioException catch (error) {
      throw error.message!;
    }
  }

  static Future<Map<String, dynamic>> patch(
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

      return response.data;
    } on DioException catch (error) {
      throw error.message!;
    }
  }

  static Future<Map<String, dynamic>> delete(
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

      return response.data;
    } on DioException catch (error) {
      throw error.message!;
    }
  }

  static Map<String, dynamic>? _header(
      {bool hasApi = false, bool hasHeader = true}) {
    if (hasHeader) {
      if (hasApi) {
        return {
          'api-key': AppGlobal.appApiKey,
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
