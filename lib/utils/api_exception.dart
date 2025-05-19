class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => message;
}

class NoInternetException extends ApiException {
  NoInternetException()
      : super(
          message: 'Tidak ada koneksi internet',
          statusCode: null,
        );
}

class TimeoutException extends ApiException {
  TimeoutException()
      : super(
          message: 'Koneksi timeout',
          statusCode: null,
        );
}

class ServerException extends ApiException {
  ServerException()
      : super(
          message: 'Internal server error',
          statusCode: 500,
        );
}

class UnauthorizedException extends ApiException {
  UnauthorizedException()
      : super(
          message: 'Unauthorized',
          statusCode: 401,
        );
}

class NotFoundException extends ApiException {
  NotFoundException()
      : super(
          message: 'Data tidak ditemukan',
          statusCode: 404,
        );
} 