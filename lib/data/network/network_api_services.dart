import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/data/network/base_api_service.dart';
import 'package:e_commerce/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/config.dart';

class NetworkApiServices implements BaseApiServices {
  dynamic responseJson;

  @override
  Future<dynamic> postLogin(String url, LoginModel data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.post(
        Uri.parse('$baseUrl$url'),
        body: data.toJson(),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
      );
      if (response.statusCode == 200) {
        prefs.setString(
          'token',
          json.decode(response.body)['data']['token'],
        );
      }

      return responseJson = returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  @override
  Future<void> postRequest(String url, data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$url'),
        body: data.toJson(),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
      );

      return responseJson = returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  @override
  Future<dynamic> getRequest(String url) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    try {
      final response = await http.get(
        Uri.parse('$baseUrl$url'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw json.decode(response.body)['info'];
      case 401:
        throw json.decode(response.body)['info'];
      case 404:
        throw json.decode(response.body)['info'];
      case 500:
        throw json.decode(response.body)['info'];
      default:
        throw "Error accourded while communicating with server with status code ${response.statusCode}";
    }
  }
}
