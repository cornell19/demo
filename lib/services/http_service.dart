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
      final Dio dio = Dio();
      if (headers != null) {
        dio.options.headers = headers;
      }
      //TODO: Setup Firebase to retrieve real data
      //final Response<dynamic> response = await dio.get<String>(url);
      //return response.toString();
      return '{"-Mc_Zw-55La2JtSiMM3c":{"firstName":"Scott","lastName":"Cornell"},"-Mc_dhHszzeu140I6oyt":{"firstName":"Frank","lastName":"Smith"},"-Mc_dimPOLFyhC2Y_O5G":{"firstName":"John","lastName":"Smith"},"-Mc_djyw26VO006-8tMy":{"firstName":"John","lastName":"Doe"},"-Mc_dlULd3A67Ko0CVXO":{"firstName":"Jane","lastName":"Doe"}}';
    } catch (ex) {
      throw HttpGetError(ex.toString());
    }
  }

  Future<String> postHttp(String url,
      {Map<String, dynamic>? data, Map<String, String>? headers}) async {
    try {
      final Dio dio = Dio();
      if (headers != null) {
        dio.options.headers = headers;
      }
      final Response<dynamic> response =
          await dio.post<String>(url, data: data);
      return response.data as String;
    } catch (ex) {
      throw HttpGetError(ex.toString());
    }
  }
}
