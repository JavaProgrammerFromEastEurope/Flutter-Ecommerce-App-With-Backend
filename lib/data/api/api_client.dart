import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/app_constants.dart';

/// Универсальный ответ от API
class ApiResponse {
  final bool success;
  final dynamic data;
  final String? errorMessage;

  ApiResponse({
    required this.success,
    this.data,
    this.errorMessage,
  });
}

/// Продакшен-версия API клиента
class ApiClient {
  final String baseUrl;
  final String token;

  ApiClient({
    this.baseUrl = AppConstants.BASE_URL,
    this.token = AppConstants.TOKEN,
  });

  /// Заголовки для всех запросов
  Map<String, String> get _headers => {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

  /// GET-запрос с обработкой ошибок
  Future<ApiResponse> getData(String uri) async {
    final fullUrl = _normalizeUrl(uri);

    try {
      print("📡 GET: $fullUrl");

      final response = await http.get(Uri.parse(fullUrl), headers: _headers);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return ApiResponse(success: true, data: jsonData);
      } else {
        print("❌ API error: ${response.statusCode} → ${response.body}");
        return ApiResponse(
          success: false,
          errorMessage:
              'Ошибка API (${response.statusCode}): ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      print("⚠️ Network error: $e");
      return ApiResponse(success: false, errorMessage: e.toString());
    }
  }

  /// Удаляет лишние / и формирует корректный полный URL
  String _normalizeUrl(String uri) {
    if (uri.startsWith('http'))
      return uri; // если полный путь — возвращаем как есть
    if (baseUrl.endsWith('/') && uri.startsWith('/')) {
      return baseUrl + uri.substring(1);
    } else if (!baseUrl.endsWith('/') && !uri.startsWith('/')) {
      return '$baseUrl/$uri';
    } else {
      return baseUrl + uri;
    }
  }
}
