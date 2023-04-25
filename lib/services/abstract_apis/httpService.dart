import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart' as mime;
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
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

  void _checkAuthRequest(bool authRequired) {
    final unsatisfied =
        authRequired && !this.dio.options.headers.containsKey('Cookie');
    if (unsatisfied) {
      rootRouter.push(const SignUpScreen());
    }
  }

  bool _checkAuthDioResponse(DioError dioErr) {
    if (dioErr.response?.statusCode == 401) {
      // TODO? Do we need to set: set state logged out to true and then route to the login signin buttons screen
      // navigating to the splash screen should ensure user can login back into vegi again using the phone -sms firebase onboard
      rootRouter.push(const SignUpScreen());
      return true;
    }
    return false;
  }

  Future<Response<T?>> dioGet<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    bool sendWithAuthCreds = false,
  }) {
    _checkAuthRequest(sendWithAuthCreds);
    if (!path.startsWith('/')) path = '/' + path;
    try {
      return dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (dioErr) {
      if (!_checkAuthDioResponse(dioErr)) {
        log.error(
            'ERROR [vegi service [${dioErr.response?.statusCode}]] - dioGet -> $dioErr');
      }
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
    T? errorResponseData,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool sendWithAuthCreds = false,
  }) {
    _checkAuthRequest(sendWithAuthCreds);
    if (!path.startsWith('/')) path = '/' + path;
    return dio.post<T>(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,)
      ..onError((error, stackTrace) {
        log.error(error, stackTrace: stackTrace);
        if (error is Map<String, dynamic> &&
            error['message'].toString().startsWith('SocketException:') &&
            dio.options.baseUrl.startsWith('http://localhost')) {
          log.warn(
            'If running from real_device, cant connect to localhost on running machine...',
          );
        } else if (error is DioError) {
          if (!_checkAuthDioResponse(error)) {
            return Response(
              data: errorResponseData,
              extra: {
                'error': error.error,
                'message': error.message,
                'dioResponse': error.response,
                'dioErrorType': error.type,
                'data': error.response?.data,
              },
              isRedirect: error.response?.isRedirect ?? false,
              redirects: error.response?.redirects ?? [],
              headers: error.response?.headers,
              statusCode: error.response?.statusCode ?? 500,
              requestOptions: error.requestOptions,
            );
          }
        }
        return Response(
          data: errorResponseData,
          extra: {
            'error': null,
            'message': '',
          },
          statusCode: 500,
          requestOptions: RequestOptions(path: ''),
        );
      });
  }

  Future<Response<T>> dioPutFile<T>(
    String path, {
    required File file,
    Map<String, dynamic>? queryParameters,
    T? errorResponseData,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool sendWithAuthCreds = false,
  }) {
    _checkAuthRequest(sendWithAuthCreds);
    final image = file.readAsBytesSync();

    final options = Options(
      contentType: mime.lookupMimeType(file.path),
      headers: {
        'Accept': 'application/json',
        'Content-Length': image.length,
        'Connection': 'keep-alive',
        'User-Agent': 'ClinicPlush'
      },
    );

    if (!path.startsWith('/')) {
      path = '/$path';
    }
    return dio.put<T>(
      path,
      data: Stream.fromIterable(image.map((e) => [e])),
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )..onError((error, stackTrace) {
        log.error(error, stackTrace: stackTrace);
        if (error is Map<String, dynamic> &&
            error['message'].toString().startsWith('SocketException:') &&
            dio.options.baseUrl.startsWith('http://localhost')) {
          log.warn(
            'If running from real_device, cant connect to localhost on running machine...',
          );
        } else if (error is DioError) {
          if (!_checkAuthDioResponse(error)) {
            return Response(
              data: errorResponseData,
              extra: {
                'error': error.error,
                'message': error.message,
                'dioResponse': error.response,
                'dioErrorType': error.type,
                'data': error.response?.data,
              },
              isRedirect: error.response?.isRedirect ?? false,
              redirects: error.response?.redirects ?? [],
              headers: error.response?.headers,
              statusCode: error.response?.statusCode ?? 500,
              requestOptions: error.requestOptions,
            );
          }
        }
        return Response(
          data: errorResponseData,
          extra: {
            'error': null,
            'message': '',
          },
          statusCode: 500,
          requestOptions: RequestOptions(path: ''),
        );
      });
  }

  Future<Response<T>> dioPostFile<T>(
    String path, {
    required File file,
    required FormData Function({required MultipartFile file}) formDataCreator,
    required void Function(String error, FileUploadErrCode errCode) onError,
    Map<String, dynamic>? queryParameters,
    T? errorResponseData,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool sendWithAuthCreds = false,
  }) {
    _checkAuthRequest(sendWithAuthCreds);
    final image = file.readAsBytesSync();

    MultipartFile imgByteStream;
    String mimeType;
    String mimeSubType;
    try {
      final mimeTypeData = mime.lookupMimeType(file.path)?.split('/');

      if (mimeTypeData == null || mimeTypeData.length < 2) {
        const wm = 'Unable to get Mime Encoding of Image upload.';
        // throw Exception(wm);
        onError(
          wm,
          FileUploadErrCode.imageEncodingError,
        );
        return Future.value(
          Response(
            data: errorResponseData,
            statusCode: 500,
            requestOptions: RequestOptions(path: path),
          ),
        );
      }
      mimeType = mimeTypeData[0];
      mimeSubType = mimeTypeData[1];
      imgByteStream = MultipartFile.fromFileSync(
        file.path,
        contentType: MediaType(
          mimeType,
          mimeSubType,
        ),
      );
      if ((imgByteStream.length * 0.00000095367432) > fileUploadVegiMaxSizeMB) {
        final wm =
            'Image upload (${imgByteStream.length}MB) is too large, must be under ${fileUploadVegiMaxSizeMB}MB';
        onError(
          wm,
          FileUploadErrCode.imageTooLarge,
        );
        return Future.value(
          Response(
            data: errorResponseData,
            statusCode: 500,
            requestOptions: RequestOptions(path: path),
          ),
        );
      }
    } catch (err, stack) {
      final wm = 'Unable to encode image for sending to vegi: $err';
      log.error(err, stackTrace: stack);
      onError(
        wm,
        FileUploadErrCode.unknownError,
      );
      return Future.value(
        Response(
          data: errorResponseData,
          statusCode: 500,
          requestOptions: RequestOptions(path: path),
        ),
      );
    }

    final options = Options(
      contentType: mime.lookupMimeType(file.path),
      headers: {
        'Accept': 'application/json',
        'Content-Length': image.length,
        'Connection': 'keep-alive',
        'User-Agent': 'ClinicPlush'
      },
    );

    if (!path.startsWith('/')) {
      path = '/$path';
    }
    return dio.post<T>(
      path,
      data: formDataCreator(file: imgByteStream),
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )..onError((error, stackTrace) {
        log.error(error, stackTrace: stackTrace);
        if (error is Map<String, dynamic> &&
            error['message'].toString().startsWith('SocketException:') &&
            dio.options.baseUrl.startsWith('http://localhost')) {
          log.warn(
            'If running from real_device, cant connect to localhost on running machine...',
          );
          onError(
            'Simulator specific Error',
            FileUploadErrCode.unknownError,
          );
        } else if (error is DioError) {
          if (!_checkAuthDioResponse(error)) {
            onError(
              error.message ?? '',
              FileUploadErrCode.unknownError,
            );
            return Response(
              data: errorResponseData,
              extra: {
                'error': error.error,
                'message': error.message,
                'dioResponse': error.response,
                'dioErrorType': error.type,
                'data': error.response?.data,
              },
              isRedirect: error.response?.isRedirect ?? false,
              redirects: error.response?.redirects ?? [],
              headers: error.response?.headers,
              statusCode: error.response?.statusCode ?? 500,
              requestOptions: error.requestOptions,
            );
          }
        }
        onError(
          'Unknown error!',
          FileUploadErrCode.unknownError,
        );
        return Response(
          data: errorResponseData,
          extra: {
            'error': null,
            'message': '',
          },
          statusCode: 500,
          requestOptions: RequestOptions(path: path),
        );
      });
  }
}
