class CardApiException implements Exception {
  final String message;

  CardApiException(this.message);

  @override
  String toString() {
    return message;
  }
}
