import 'dart:io';

import 'package:dio/dio.dart';
import 'package:clean_architecutre_posts_app/core/network/api_consumer.dart';
import 'package:clean_architecutre_posts_app/core/network/api_end_points.dart';
import 'package:clean_architecutre_posts_app/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  DioConsumer({required this.dio}) {
    dio.options
      ..baseUrl = EndPoint.baseUrl
      ..connectTimeout = const Duration(seconds: 15)
      ..sendTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15)
      ..persistentConnection = false
      ..headers = {HttpHeaders.acceptHeader: Headers.jsonContentType};

    //TODO: Remove This comment when add Interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
      ),
    );
  }
  final Dio dio;

  @override
  Future delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      final dynamic response = await dio.delete(
        path,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    bool isFormData = false,
  }) async {
    try {
      final dynamic response = await dio.get(
        path,
        queryParameters: queryParameters,
        data: data,
        options: isFormData
            ? Options(contentType: Headers.formUrlEncodedContentType)
            : null,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      final dynamic response = await dio.post(
        path,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      final dynamic response = await dio.put(
        path,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
