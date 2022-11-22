class AuthResponseErrorException implements Exception {
  final String message;
  AuthResponseErrorException(this.message);

  @override
  String toString() {
    return message;
  }
}
