class UnknownEnumValueException implements Exception {
  final String message;

  UnknownEnumValueException(this.message);

  @override
  String toString() {
    return message;
  }
}
