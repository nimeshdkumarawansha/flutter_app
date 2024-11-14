
// ignore_for_file: empty_catches

import '../api/api_status.dart';

class ErrorMessages {
  static String getExceptionMessage(dynamic e) {
    return e.toString();
  }

  static String? getErrorMessage({required response}) {
    switch (response.apiStatus) {
      case ApiStatus.NO_INTERNET:
        return "Internet connection not available";
      case ApiStatus.TIMEOUT:
        return "Request timed out! Please check your connection";
      case ApiStatus.CLIENT_ERROR:
        try {
          if (response.jsonBody != null) {
            String message = response.jsonBody['message'];
            if (message.isNotEmpty) {
              return message;
            }
          }
        } catch (e) {
        }
        try {
          if (response.jsonBody != null) {
            String message = response.jsonBody['detail'];
            if (message.isNotEmpty) {
              return message;
            }
          }
        } catch (e) {
        }
        return response.statusMessage;
      case ApiStatus.SERVICE_ERROR:
        return "Sorry, Service unavailable at this moment";
      default:
        return "Sorry, Something went wrong\n";
    }
  }
}
