import 'dart:convert';

import 'package:http/http.dart';

import 'api_response.dart';

class ApiCaller {

 static Future<ApiResponse> getrequest({required String url})async{
    try{
      Uri uri = Uri.parse(url);
      Response response = await get(uri,headers: {
      });

      final int statusCode = response.statusCode;
      
      if(statusCode == 200){
        final decodeData = jsonDecode(response.body);
        return ApiResponse(
            isSuccess: true, 
            responseCode: statusCode, 
            responseData: decodeData);
      }else if(statusCode == 401){
        return ApiResponse(
            isSuccess: false,
            responseCode: statusCode, 
            responseData: "un-authorize");
      }else{
        final decodeData = jsonDecode(response.body);
        return ApiResponse(
            isSuccess: false,
            responseCode: statusCode,
            responseData: decodeData);
      }
    }on Exception catch(e){

      return ApiResponse(isSuccess: false,
          responseCode: -1,
          responseData: null,
          errorMessage: e.toString(),

      );

    }
  }
 static Future<ApiResponse> postrequest({required String url,Map<String,dynamic>? body})async{

    try{
      Uri uri = Uri.parse(url);
      Response response = await post(
        uri,
        headers: {},
        body : jsonEncode(body),
      );
      final int Statuscode = response.statusCode;

      if(Statuscode == 200){
        final decodeData = jsonDecode(response.body);
        return ApiResponse(
            isSuccess: true,
            responseCode: Statuscode,
            responseData: decodeData);

      } else if(Statuscode == 401){
        return ApiResponse(
            isSuccess: false,
            responseCode: Statuscode,
            responseData:null,
            errorMessage:  "un-authorize",
        );
      }else{
        final decodeData = jsonDecode(response.body);
        return ApiResponse(
            isSuccess: false,
            responseCode: Statuscode,
            responseData: decodeData,
          errorMessage: decodeData['data']

        );
      }
    } on Exception catch(e){
      return ApiResponse(
        isSuccess: false, responseCode: -1, responseData: null,
      errorMessage: e.toString(),
      );
    }
  }
}