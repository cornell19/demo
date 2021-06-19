class BaseError extends Error {
  final String message;
  final String? details;
  final exception;
  BaseError(this.message, {this.details, this.exception});

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
