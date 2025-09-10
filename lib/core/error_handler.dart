import 'dart:convert';
import 'package:http/http.dart' as http;
import 'exceptions.dart';

class ErrorHandler {
  static void handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return; // success
    } else {
      try {
        final jsonBody = jsonDecode(response.body);
        throw CustomException(
          message: jsonBody['Message'] ?? 'Unknown error',
          code: response.statusCode,
        );
      } catch (_) {
        throw CustomException(
          message: 'Server error: ${response.statusCode}',
          code: response.statusCode,
        );
      }
    }
  }

  static void handleException(dynamic e) {
    if (e is CustomException) {
      throw e;
    } else {
      throw CustomException(message: e.toString());
    }
  }
}
