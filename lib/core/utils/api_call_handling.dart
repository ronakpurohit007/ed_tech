import 'dart:convert';

import 'package:ed_tech/core/errors/app_error.dart';
import 'package:ed_tech/core/utils/logger.dart';

mixin ErrorHandlerMixin {
  final ConsoleAppLogger _logger = ConsoleAppLogger();

  Map<String, dynamic>? extractErrorData(AppError error) {
    String errorBody = error.toString();

    // Handle "No internet connection" case
    if (errorBody.contains('No internet connection')) {
      return {
        'success': false,
        'message':
            'No internet connection. Please check your internet settings.'
      };
    }

    // Extract JSON from response body if present
    if (errorBody.contains('Response Body:')) {
      try {
        String jsonStr = errorBody.split('Response Body:')[1].trim();
        return jsonDecode(jsonStr);
      } catch (_) {
        return {'success': false, 'message': error.message};
      }
    }

    // Default case: return the error message
    return {'success': false, 'message': error.message};
  }

  Future<T> handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } catch (e) {
      _logger.e('API call failed', e);
      if (e is AppError) {
        Map<String, dynamic>? errorData = extractErrorData(e);
        throw errorData ?? {'message': 'An unexpected error occurred'};
      }
      rethrow;
    }
  }
}
