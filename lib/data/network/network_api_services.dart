import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));


      responseJson = returnResponse(response);
      if (kDebugMode) {
       // print('Response Body: ${response.body}');
      }
    } on SocketException {
      throw InternetException('No Internet connection');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    }
   // print(responseJson);
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print('POST Request Data: ${jsonEncode(data)}');
    }

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(data),
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
   // print('Response Body: ${responseJson}');
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    //print('Response Body: ${response.body.toString()}');
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException('Error occurred while communicating with server: ${response.statusCode}');
    }
  }




}
