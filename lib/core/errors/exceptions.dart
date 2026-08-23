// This file is used to create custom exceptions for the application
// Each exception is a class that implements the Exception interface
// And there is an exception for each type of Failure

import 'package:clean_architecutre_posts_app/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class OfflineException implements Exception {}

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

class CacheException implements Exception {}

class EmptyCacheException implements Exception {}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400: // bad request
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 401: // unauthorized
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 403: // forbidden
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 404: // not found
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 500: // internal server error
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 504: // gateway timeout
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );

        default:
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
      }
    case DioExceptionType.transformTimeout:
      // TODO: Handle this case.
      throw UnimplementedError();
  }
}
