class AppException implements Exception {
  String? message;
  int? code;

  AppException(this.message, this.code);

  @override
  String toString() {
    return "$code:$message";
  }
}
