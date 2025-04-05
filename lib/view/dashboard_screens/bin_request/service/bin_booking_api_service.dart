import 'dart:convert';

import 'package:cleanerapp/utils/apiurl.dart';
import 'package:dio/dio.dart';

Future<Map<String, dynamic>> fetchBinbooking(String token) async {
  try {
    // Validate token

    // Prepare headers and data
    var headers = {'Content-Type': 'application/json'};

    // Instantiate Dio
    var dio = Dio();

    // Debugging: Log the URL and data being sent

    // Make API request
    var response = await dio.request(
      AppUrl.binbooking, // Ensure this URL is correct
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    // Check status code
    if (response.statusCode == 200) {
      print('Raw Response Data: ${response.data}');

      // Process response data
      if (response.data is String) {
        return json.decode(response.data) as Map<String, dynamic>;
      } else if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception(
            'Unexpected response format: ${response.data.runtimeType}');
      }
    } else {
      print('Error Status Code: ${response.statusCode}');
      print('Error Message: ${response.statusMessage}');
      throw Exception('Failed to fetch wallet: ${response.statusMessage}');
    }
  } catch (error, stackTrace) {
    // Print detailed error and stack trace for debugging
    print('Error in fetchWallet: $error');
    print('Stack Trace: $stackTrace');
    throw Exception('An error occurred while fetching the wallet: $error');
  }
}
