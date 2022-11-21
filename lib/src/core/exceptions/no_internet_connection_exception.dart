class NoInternetConnectionException implements Exception {
  final String message;
  NoInternetConnectionException(this.message);

  @override
  String toString() {
    return message;
  }
}
