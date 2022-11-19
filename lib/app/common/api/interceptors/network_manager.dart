import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import '../../../services/local/shared_preferences_service.dart';
import '../endpoints.dart';
import '../haul_error.dart';

abstract class BaseRemoteSource {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      sendTimeout: 5000,
      receiveTimeout: 5000,
      contentType: Headers.jsonContentType,
      receiveDataWhenStatusError: true,
    ),
  );

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;
      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      throw exception;
    }
  }
}

HaulException handleDioError(DioError dioError) {
  printDioError(dioError);
  switch (dioError.type) {
    case DioErrorType.cancel:
      return HaulException(message: "Request to API server was cancelled");
    case DioErrorType.connectTimeout:
      return HaulException(message: "Connection timeout with API server");
    case DioErrorType.other:
      return HaulException(message: "There is no internet connection");
    case DioErrorType.receiveTimeout:
      return HaulException(
          message: "Receive timeout in connection with API server");
    case DioErrorType.sendTimeout:
      return HaulException(
          message: "Send timeout in connection with API server");
    case DioErrorType.response:
      return HaulException(
          message: dioError.response!.data['message'],
          code: dioError.response!.statusCode.toString());
  }
}

void printDioError(DioError dioError) {
  debugPrint('*REQUEST OPTIONS*');
  debugPrint(dioError.requestOptions.baseUrl);
  debugPrint(dioError.requestOptions.path);
  debugPrint(dioError.requestOptions.method);
  debugPrint('*RESPONSE*');
  debugPrint(dioError.message);
}
