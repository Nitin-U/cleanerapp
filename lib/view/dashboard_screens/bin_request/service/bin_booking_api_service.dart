import 'dart:convert';

import 'package:binbookingapp/utils/apiurl.dart';
import 'package:dio/dio.dart';

Future<Map<String, dynamic>> fetchBinbooking(String token) async {
  try {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // ✅ Include the token!
    };

    var dio = Dio();

    var response = await dio.request(
      AppUrl.binbooking,
      options: Options(
        method: 'GET',
        headers: headers,
        validateStatus: (status) => status != null && status < 500,
      ),
    );


    if (response.data is Map<String, dynamic>) {
      return response.data;
    } else if (response.data is String) {
      // If the response is not valid JSON (e.g. HTML), log and throw
      if (response.data.startsWith('<!DOCTYPE html>')) {
        throw Exception(
            "Received HTML page instead of JSON. Possible auth error.");
      }
      return json.decode(response.data) as Map<String, dynamic>;
    } else {
      throw Exception(
          'Unexpected response format: ${response.data.runtimeType}');
    }
  } catch (error, stackTrace) {
    print('Error in fetchBinbooking: $error');
    print('Stack Trace: $stackTrace');
    throw Exception(
        'An error occurred while fetching bin booking data: $error');
  }
}


Future<Map<String, dynamic>> fetchBinbookingaccept(
  String driverid,
  String binbookingid,
  String token
) async {
  var headers = {
    'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // ✅ Include the token!

  };

  var data = json.encode({
    "driver_id": driverid,
    "booking_id": binbookingid,
    "serial-number":[
      "1","x1"
    ]
  });

  var dio = Dio();

  try {
    var response = await dio.request(
      AppUrl.acceptrequest,
      options: Options(
        method: 'POST',
        headers: headers,
        validateStatus: (status) =>
            status != null && status < 500, // Accept 200–499
      ),
      data: data,
    );

    print('Response Data: ${json.encode(response.data)}');

    // Always return the response data (success or failure)
    if (response.data is Map<String, dynamic>) {
      return response.data;
    } else {
      return jsonDecode(response.data.toString());
    }
  } catch (e) {
    print('Error during login: $e');
    return {"status": "error", "message": "Something went wrong"};
  }
}