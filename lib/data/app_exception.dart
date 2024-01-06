// Base class for application exceptions
class AppException implements Exception {

  // Private fields for message and prefix
  final _message;
  final _prefix;

  // Constructor with optional parameters for message and prefix
  AppException([this._message, this._prefix]);

  // Override toString method to customize the exception message
  String toString() {
    return "$_prefix $_message";
  }
}

// Specific exception class for fetch data errors, extends AppException
class FetchDataException extends AppException {
  // Constructor calls the superclass constructor with a specific prefix
  FetchDataException([String? message]) : super(message, "Fetch Data Exception");
}

// Specific exception class for bad request errors, extends AppException
class BadRequestException extends AppException {
  // Constructor calls the superclass constructor with a specific prefix
  BadRequestException([String? message]) : super(message, "Invalid Request to the server");
}

// Specific exception class for permission denied errors, extends AppException
class NoPermissionException extends AppException {
  // Constructor calls the superclass constructor with a specific prefix
  NoPermissionException([String? message]) : super(message, "Permission Denied");
}
