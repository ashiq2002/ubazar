import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:ubazar/data/network/api_dao.dart';
import 'package:ubazar/res/strings.dart';

import '../app_exception.dart';

class ApiServices extends ApiDao{

  //api GET call
  @override
  Future getApiResponse(String uri) async{
    dynamic data;
    try{
      final response = await http.get(
          Uri.parse(uri),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $bearerToken'
          }
      );
      data = _getResponse(response);
      return data;
    }on SocketException{
      throw FetchDataException("No Internet connection");
    }
  }

  //api POST call
  @override
  Future postApiResponse(String url, body) async{
    final dynamic data;
    try{
      Response response = await http.post(
          Uri.parse(url),
          body: body
      );
      data = _getResponse(response);
      return data;
    }on SocketException{
      throw FetchDataException("No Internet connection");
    }

  }

  //handle api responses
  dynamic _getResponse(Response response){
    switch(response.statusCode){
      case 200:
        return response.body;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorisedException(response.body.toString());

      default:
        throw FetchDataException("Error accrued while communicating with server\nStatus code : ${response.statusCode.toString()}");
    }
  }

}