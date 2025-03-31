import 'dart:convert';

import 'package:cleanerapp/utils/apiurl.dart';
import 'package:dio/dio.dart';

Future<Map<String, dynamic>> fetchLogindata(
    String email, String password) async {
  var headers = {
    'Content-Type': 'application/json',
  };

  var data = json.encode({
    "email": email,
    "password": password,
  });

  var dio = Dio();

  try {
    var response = await dio.request(
      AppUrl.loginurl,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      // Log response data for debugging
      print('Response Data: ${json.encode(response.data)}');

      if (response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        // Decode response if not already a Map
        return jsonDecode(response.data.toString());
      }
    } else {
      throw Exception(
          'Failed to login: ${response.statusCode} - ${response.statusMessage}');
    }
  } catch (e) {
    print('Error during login: $e'); // Log the error
    rethrow; // Pass the exception up
  }
}
