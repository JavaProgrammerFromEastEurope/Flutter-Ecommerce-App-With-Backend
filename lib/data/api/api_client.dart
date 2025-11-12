import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiResponse {
  final bool success;
  final Map<String, dynamic>? data;
  final String? errorMessage;

  ApiResponse({required this.success, this.data, this.errorMessage});
}

class ApiClient {
  final String baseUrl;
  final String token;

  ApiClient({
    required this.baseUrl,
    required this.token,
  });

  Map<String, String> get _headers => {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

  Future<ApiResponse> getData(String uri) async {
    try {
      final response =
          await http.get(Uri.parse(baseUrl + uri), headers: _headers);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        return ApiResponse(success: true, data: jsonData);
      } else {
        return ApiResponse(
            success: false, errorMessage: 'Error ${response.statusCode}');
      }
    } catch (e) {
      return ApiResponse(success: false, errorMessage: e.toString());
    }
  }
}
