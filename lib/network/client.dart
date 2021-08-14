/// http服务
import "package:http/http.dart" as http;
import 'dart:convert';
import 'dart:async';
import 'package:samurais_application/models/res.dart';

class HttpController {
  static String _paramsToQuery(Map<String, String>? params) {
    if (params != null && params.isNotEmpty) {
      StringBuffer _query = new StringBuffer("?");
      params.forEach((key, value) {
        _query.write("$key" + "=" + "$value" + "&");
      });
      String query = _query.toString();
      return query.substring(0, params.length - 1);
    }
    return "";
  }

  /// get请求
  static Future<Res> get(String _url,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    try {
      String query = _paramsToQuery(params);
      Uri url = Uri.parse(_url + query);
      http.Response res = await http.get(url, headers: headers);
      Map<String, dynamic> body = json.decode(res.body);
      return new Res.fromJson(body);
    } catch (e) {
      return new Res(0, "请求异常", null);
    }
  }

  /// post请求
  static Future<Res> post(String _url,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    try {
      Uri url = Uri.parse(_url);
      http.Response res = await http.post(url, headers: headers, body: params);
      Map<String, dynamic> body = json.decode(res.body);
      return new Res.fromJson(body);
    } catch (e) {
      return new Res(0, "请求异常", null);
    }
  }

  /// delete请求
  static Future<Res> delete(String _url,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    try {
      Uri url = Uri.parse(_url);
      http.Response res =
          await http.delete(url, headers: headers, body: params);
      Map<String, dynamic> body = json.decode(res.body);
      return new Res.fromJson(body);
    } catch (e) {
      return new Res(0, "请求异常", null);
    }
  }

  /// put请求
  static Future<Res> put(String _url,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    try {
      Uri url = Uri.parse(_url);
      http.Response res = await http.put(url, headers: headers, body: params);
      Map<String, dynamic> body = json.decode(res.body);
      return new Res.fromJson(body);
    } catch (e) {
      return new Res(0, "请求异常", null);
    }
  }
}
