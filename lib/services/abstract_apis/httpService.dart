import 'package:dio/dio.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

abstract class HttpService {
  final Dio dio;
  String get baseUrl => this.dio.options.baseUrl;

  String? sessionCookie;

  HttpService(this.dio, String baseUrl) {
    this.dio.options.baseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
  }

  Options getOptions(Options? options) => (options ?? Options()).copyWith(
        headers: {"Cookie": "$sessionCookie"},
      );

  Future<Response<T>> dioGet<T>(
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
          options: getOptions(options),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
    } on Exception catch (e) {
      log.error(e);
      return Future.value(
          Response<T>(requestOptions: RequestOptions(path: path)));
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
    try {
      return dio.post<T>(path,
          data: data,
          queryParameters: queryParameters,
          options: getOptions(options),
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
    } on Exception catch (e) {
      log.error(e);
      return Future.value(
          Response<T>(requestOptions: RequestOptions(path: path)));
    }
  }
}
