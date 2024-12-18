
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'package:getx_mvvm/data/network/base_api_services.dart';

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices{
  
  @override
  Future getApi(String url) async{
    
    if(kDebugMode){
      print(url);
    }
    
    //empty var
    dynamic responseJson;
           try{
             final respnose=await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
             //respnose  this have a data
             // and decode to responseJson but api have a status code we chick it 
             responseJson=returnResponse(respnose);
           }on SocketException{
             throw InternetException;
           }on RequestTimeOut{
             throw RequestTimeOut;
           }
           return responseJson;
  }
  




  @override
  Future postApi(var data ,String url) async{

    if(kDebugMode){
      print(data);
    }
    //empty var
    dynamic responseJson;
    try{
      final respnose=await http.post(Uri.parse(url),
        body: jsonEncode(data)
      ).timeout(Duration(seconds: 10));
      //respnose  this have a data
      // and decode to responseJson but api have a status code we chick it 
      responseJson=returnResponse(respnose);
    }on SocketException{
      throw InternetException;
    }on RequestTimeOut{
      throw RequestTimeOut;
    }
    return responseJson;

  }


  

  dynamic returnResponse( http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;

      case 400:
        throw InvalidUrlException;

      default:
        throw FetchDataException;
    }

  }
  
}

