class ServerException implements Exception {
  final String statusMessage;
  final num statusCode;

  ServerException({
    required this.statusMessage,
    required this.statusCode,
  });

  @override
  String toString() => 'ServerException(statusMessage: $statusMessage, statusCode: $statusCode)';
}

class CacheException implements Exception {}
