import 'package:demo/utils/errors.dart';
import 'package:dio/dio.dart';

class HttpGetError extends BaseError {
  HttpGetError(
    String message, {
    String? details,
    dynamic exception,
  }) : super(message, details: details, exception: exception);
}

class HttpPostError extends BaseError {
  HttpPostError(
    String message, {
    String? details,
    dynamic exception,
  }) : super(message, details: details, exception: exception);
}

class HttpService {
  Future<String> getHttp(String url, {Map<String, String>? headers}) async {
    try {
      final dio = Dio();
      if (headers != null) {
        dio.options.headers = headers;
      }
      final response = await dio.get(url);
      return response.toString();
    } catch (ex) {
      throw new HttpGetError(ex.toString());
    }
  }

  Future<String> postHttp(String url,
      {Map<String, dynamic>? data, Map<String, String>? headers}) async {
    try {
      final dio = Dio();
      if (headers != null) {
        dio.options.headers = headers;
      }
      final response = await dio.post(url, data: data);
      return response.data as String;
    } catch (ex) {
      throw new HttpGetError(ex.toString());
    }
  }
}
