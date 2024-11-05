import 'package:dio/dio.dart';

import '../../constants/network_constants.dart';


abstract class DioHelper {
  static Dio? productDio;

  static init() {
    productDio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: NetworkConstants.baseUrl,
      responseType: ResponseType.json,
      contentType: NetworkConstants.jsonContentType,
      connectTimeout: NetworkConstants.timeoutDuration,
    ));
  }

  static Future<Response> getProductData(
      {String? endPoint,
        Map<String, dynamic>? body,
        Map<String, dynamic>? params}) async {
    return await productDio!.get(
      endPoint!,
      data: body,
      queryParameters: params,
    );
  }

  static Future<Response> postProductData(
      {String? endPoint,
        Map<String, dynamic>? body,
        Map<String, dynamic>? params}) async {
    return await productDio!.post(endPoint!, data: body, queryParameters: params);
  }
}
