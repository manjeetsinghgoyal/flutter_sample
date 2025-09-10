class CustomException implements Exception {
  final String message;
  final int? code;

  CustomException({required this.message, this.code});

  @override
  String toString() => 'CustomException(code: $code, message: $message)';
}

class ServerException implements Exception {
  final String message;
  final int? code;

  ServerException({required this.message, this.code});

  @override
  String toString() => 'ServerException(code: $code, message: $message)';
}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});

  @override
  String toString() => 'CacheException(message: $message)';
}

