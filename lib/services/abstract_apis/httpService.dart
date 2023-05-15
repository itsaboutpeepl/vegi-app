import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart' as mime;
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

enum AuthenticationStatus {
  unauthenticated,
  authenticationFailed,
  authenticationSucceeded,
  expired,
}

abstract class HttpService {
  final Dio dio;
  String get baseUrl => this.dio.options.baseUrl;
  AuthenticationStatus authStatus = AuthenticationStatus.unauthenticated;

  HttpService(this.dio, String baseUrl) {
    this.dio.options.baseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    this.dio.options.headers = Map.from({'Content-Type': 'application/json'});
  }

  bool _checkAuthRequestIsSatisfied(
    bool authRequired, {
    required bool dontRoute,
  }) {
    final unsatisfied =
        authRequired && !this.dio.options.headers.containsKey('Cookie');
    if (unsatisfied &&
        !dontRoute &&
        authStatus != AuthenticationStatus.authenticationFailed) {
      if (rootRouter.current.name != SignUpScreen.name) {
        log.info('Push SignUpScreen()');
        rootRouter.push(const SignUpScreen());
      }
    }
    return !unsatisfied;
  }

  bool get hasCookieStored => dio.options.headers.containsKey('Cookie');

  Future<void> deleteSessionCookie() async {
    if (hasCookieStored) {
      dio.options.headers.remove('Cookie');
    }
    authStatus = AuthenticationStatus.expired;
    (await reduxStore).dispatch(SetVegiSessionExpired());
  }

  Future<bool> isCookieExpired() async {
    bool cookieHasExpired = true;
    if (hasCookieStored) {
      final cookie = dio.options.headers['Cookie'] as String;
      final expiryStrPattern =
          RegExp('Expires=([A-Za-z]{3}, [0-9]{1,2} [A-Za-z]{3} [0-9]{4})');
      final x = expiryStrPattern.firstMatch(cookie);
      if (x != null) {
        final dtStr = x[0];
      }
      cookieHasExpired = true;
    } else {
      cookieHasExpired = true;
    }
    if (cookieHasExpired) {
      authStatus = AuthenticationStatus.expired;
      (await reduxStore).dispatch(SetVegiSessionExpired());
    }
    return cookieHasExpired;
  }

  Future<void> logoutSession() async {
    if (hasCookieStored) {
      dio.options.headers.remove('Cookie');
    }
    authStatus = AuthenticationStatus.unauthenticated;
    (await reduxStore).dispatch(SetVerificationFailed());
  }

  Future<void> setSessionCookie(String cookie) async {
    dio.options.headers['Cookie'] = cookie;
    authStatus = AuthenticationStatus.authenticationSucceeded;
    (await reduxStore).dispatch(
      SetUserAuthenticationStatus(
        vegiStatus: VegiAuthenticationStatus.authenticated,
        firebaseStatus: FirebaseAuthenticationStatus.authenticated,
      ),
    );
  }

  bool _checkAuthDioResponse(
    DioError dioErr, {
    required bool dontRoute,
  }) {
    if (dioErr.response?.statusCode == 401) {
      // TODO? Do we need to set: set state logged out to true and then route to the login signin buttons screen
      // navigating to the splash screen should ensure user can login back into vegi again using the phone -sms firebase onboard
      deleteSessionCookie();
      // log.info('Push SignUpScreen()');
      // rootRouter.push(const SignUpScreen());
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
    bool dontRoute = false,
    bool sendWithAuthCreds = false,
    List<int> allowStatusCodes = const <int>[],
  }) {
    _checkAuthRequestIsSatisfied(sendWithAuthCreds, dontRoute: dontRoute);
    if (!path.startsWith('/')) path = '/' + path;
    log.info('GET: "${dio.options.baseUrl}$path"');
    try {
      return dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (dioErr) {
      if (dioErr.response != null &&
          allowStatusCodes.contains(dioErr.response!.statusCode)) {
        return Future.value(
          Response(
            data: null,
            extra: {
              'message':
                  'GET: "${dio.options.baseUrl}$path" returned expected error response with code: [${dioErr.response!.statusCode}]',
            },
            statusCode: 200,
            requestOptions: RequestOptions(path: '${dio.options.baseUrl}$path'),
          ),
        );
      }
      if (!_checkAuthDioResponse(dioErr, dontRoute: dontRoute)) {
        log.error(
            'ERROR [vegi service [${dioErr.response?.statusCode}]] - dioGet -> $dioErr');
      }
      return Future.value(
        Response(
          data: null,
          extra: {
            'error': dioErr,
            'message':
                'GET: "${dio.options.baseUrl}$path" threw -> "${dioErr.message}"',
          },
          statusCode: dioErr.response?.statusCode,
          requestOptions: RequestOptions(path: '${dio.options.baseUrl}$path'),
        ),
      );
    } catch (e, s) {
      log.error(
        'ERROR - dioGet -> $e',
        stackTrace: s,
      );
      return Future.value(
        Response(
          data: null,
          extra: {
            'error': e,
            'message': 'GET: "${dio.options.baseUrl}$path" threw -> "$e"',
          },
          requestOptions: RequestOptions(path: '${dio.options.baseUrl}$path'),
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
    bool dontRoute = false,
    bool sendWithAuthCreds = false,
  }) {
    log.info('POST: "${dio.options.baseUrl}${path}"');
    _checkAuthRequestIsSatisfied(sendWithAuthCreds, dontRoute: dontRoute);
    if (!path.startsWith('/')) path = '/' + path;
    return dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )..onError((error, stackTrace) {
        log.error(
            'Ran into error trying to POST to "${dio.options.baseUrl}${path}"');
        log.error(error, stackTrace: stackTrace);
        if (error.toString().contains('Connection reset by peer')) {
          deleteSessionCookie(); //todo: return a 401...
          // rootRouter.push(const SignUpScreen());
          return Response(
            data: errorResponseData,
            extra: {
              'error': null,
              'message':
                  'Stale session cookie possible caused by server reboot',
            },
            statusCode: 401,
            requestOptions:
                RequestOptions(path: '${dio.options.baseUrl}${path}'),
          );
        }
        if (error is Map<String, dynamic> &&
            error['message'].toString().startsWith('SocketException:') &&
            dio.options.baseUrl.startsWith('http://localhost')) {
          log.warn(
            'If running from real_device, cant connect to localhost on running machine...',
          );
        } else if (error is DioError) {
          if (!_checkAuthDioResponse(error, dontRoute: dontRoute)) {
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
          } else {
            return Response(
              data: errorResponseData,
              extra: {
                'error': null,
                'message':
                    'Stale session cookie possible caused by server reboot',
              },
              statusCode: 401,
              requestOptions:
                  RequestOptions(path: '${dio.options.baseUrl}${path}'),
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
    bool dontRoute = false,
    bool sendWithAuthCreds = false,
  }) {
    _checkAuthRequestIsSatisfied(sendWithAuthCreds, dontRoute: dontRoute);
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
    log.info('PUT: "${dio.options.baseUrl}${path}"');
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
          if (!_checkAuthDioResponse(error, dontRoute: dontRoute)) {
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
          } else {
            return Response(
              data: errorResponseData,
              extra: {
                'error': null,
                'message':
                    'Stale session cookie possible caused by server reboot',
              },
              statusCode: 401,
              requestOptions:
                  RequestOptions(path: '${dio.options.baseUrl}${path}'),
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
    bool dontRoute = false,
    bool sendWithAuthCreds = false,
  }) {
    _checkAuthRequestIsSatisfied(sendWithAuthCreds, dontRoute: dontRoute);
    final image = file.readAsBytesSync();
    log.info('POST: "${dio.options.baseUrl}${path}"');
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
          if (!_checkAuthDioResponse(error, dontRoute: dontRoute)) {
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
          } else {
            return Response(
              data: errorResponseData,
              extra: {
                'error': null,
                'message':
                    'Stale session cookie possible caused by server reboot',
              },
              statusCode: 401,
              requestOptions:
                  RequestOptions(path: '${dio.options.baseUrl}${path}'),
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
