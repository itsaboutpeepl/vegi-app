import 'package:dio/dio.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

abstract class HttpService {
  final Dio dio;
  String get baseUrl => this.dio.options.baseUrl;

  HttpService(this.dio, String baseUrl) {
    this.dio.options.baseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    this.dio.options.headers = Map.from({'Content-Type': 'application/json'});
  }

  Future<Response<T?>> dioGet<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) {
    if (!path.startsWith('/')) path = '/' + path;

    try {
      return dio.get<T>(path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
    } on DioError catch (dioErr) {
      log.error(
          'ERROR [vegi service [${dioErr.response?.statusCode}]] - dioGet -> $dioErr');
      rethrow;
    } catch (e, s) {
      log.error('ERROR - dioGet -> $e');
      return Future.value(
        Response(
          data: null,
          requestOptions: RequestOptions(path: ''),
        ),
      );
    }
  }

  Future<Response<T>> dioPost<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) {
    if (!path.startsWith('/')) path = '/' + path;
    return dio.post<T>(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }
}
