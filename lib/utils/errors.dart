class BaseError extends Error {
  BaseError(this.message, {this.details, this.exception});

  final String message;
  final String? details;
  final dynamic exception;

  @override
  String toString() {
    return '$message details: $details Exception: ${exception.toString()}';
  }
}

class EnvironmentError extends BaseError {
  EnvironmentError({
    String message = 'Environment Error',
    dynamic exception,
  }) : super(message, exception: exception);
}
