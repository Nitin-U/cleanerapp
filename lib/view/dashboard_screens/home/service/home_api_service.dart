// import 'dart:convert';

// import 'package:cleanerapp/utils/apiurl.dart';
// import 'package:dio/dio.dart';

// Future<Map<String, dynamic>> fetchLogindata() async {
//   var headers = {
//     'Content-Type': 'application/json',
//   };

//   var data = json.encode({});

//   var dio = Dio();

//   try {
//     var response = await dio.request(
//       AppUrl.loginurl,
//       options: Options(
//         method: 'Get',
//         headers: headers,
//         validateStatus: (status) =>
//             status != null && status < 500, // Accept 200–499
//       ),
//       data: data,
//     );

//     print('Response Data: ${json.encode(response.data)}');

//     // Always return the response data (success or failure)
//     if (response.data is Map<String, dynamic>) {
//       return response.data;
//     } else {
//       return jsonDecode(response.data.toString());
//     }
//   } catch (e) {
//     print('Error during login: $e');
//     return {"status": "error", "message": "Something went wrong"};
//   }
// }
