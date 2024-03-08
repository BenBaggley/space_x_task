// ignore_for_file: public_member_api_docs
// coverage:ignore-file

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiModule {
  @Named('base_url')
  String get baseUrl => 'https://api.spacexdata.com/v4/';

  BaseOptions getBaseOptions(
    @Named('base_url') String baseUrl,
  ) {
    return BaseOptions(
      baseUrl: baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
  }

  @lazySingleton
  Dio getDio(BaseOptions baseOptions) => Dio(baseOptions)
    ..interceptors.addAll([
      if (kDebugMode)
        LogInterceptor(
          requestHeader: true,
          responseHeader: true,
          requestBody: true,
          responseBody: true,
          logPrint: (o) => debugPrint(o.toString()),
        ),
    ]);
}
