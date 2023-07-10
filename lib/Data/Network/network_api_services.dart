import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mydesign/Data/Exception/app_exception.dart';
import 'package:mydesign/Data/Network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices{

  @override
  Future<dynamic> getApi(String url)async{
    if(kDebugMode){
       print("Url: $url");
    }
    dynamic responseJson ;
    try{
    final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
    responseJson=returnResponse(response);
    } on SocketException{
       throw InternetException();
    } on TimeoutException{
      throw RequestTimeOut();
    } 
    return responseJson;
  }


   dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
    }
  }

}