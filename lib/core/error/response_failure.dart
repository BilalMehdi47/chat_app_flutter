class ResponseFailure {
  final String message;
  final int? code;

  ResponseFailure(this.message, {this.code});

  @override
  String toString() {
    return 'Failure(message: $message, code: $code)';
  }
}
