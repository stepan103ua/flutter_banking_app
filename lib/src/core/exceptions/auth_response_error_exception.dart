class AuthErrorException implements Exception {
  final String message;
  AuthErrorException(this.message);

  @override
  String toString() {
    return message;
  }
}
