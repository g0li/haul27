class HaulException implements Exception {
  final String? code, message;

  HaulException({
    required this.message,
    this.code,
  });
}
