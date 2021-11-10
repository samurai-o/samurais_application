import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart' as http;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class Samapi {
  http.Dio? _client;
  CookieJar cookieJar = CookieJar();

  Samapi([http.BaseOptions? options]) {
    _client = http.Dio(options);
    _client?.interceptors.add(CookieManager(cookieJar));
  }

  void addInterceptor({
    http.InterceptorSendCallback? onRequest,
    http.InterceptorSuccessCallback? onResponse,
    http.InterceptorErrorCallback? onError,
  }) {
    _client?.interceptors.add(http.InterceptorsWrapper(
      onRequest: onRequest,
      onResponse: onResponse,
      onError: onError,
    ));
  }

  Future get({required String path, Map<String, dynamic>? query}) async {
    final uri = Uri.http(_client!.options.baseUrl, path, query);
    var res = await _client?.get(uri.toString());
    return res;
  }

  Future<dynamic> post(
      {required String path,
      http.FormData? body,
      Map<String, dynamic>? query}) async {
    final uri = Uri.http(_client!.options.baseUrl, path, query);
    var res = await _client?.post(uri.toString(), data: body);
    return res;
  }

  Future put(
      {required String path,
      http.FormData? body,
      Map<String, dynamic>? query}) async {
    final uri = Uri.http(_client!.options.baseUrl, path, query);
    var res = await _client?.put(uri.toString(), data: body);
    return res;
  }
}
