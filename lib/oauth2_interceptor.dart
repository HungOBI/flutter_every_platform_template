import 'dart:async';
import 'dart:developer' as developer;
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

typedef OAuthInfoMixinParse = OAuthInfoMixin Function(Map map);

class Oauth2Interceptor extends QueuedInterceptor {
  static const TAG = 'Oauth2Interceptor';

  Dio dio;
  Dio oauth2Dio;
  String pathRefreshToken;
  String keyRefreshToken = 'refreshToken';
  OAuthInfoMixinParse parserJson;
  Oauth2Manager<OAuthInfoMixin?> tokenProvider;

  Oauth2Interceptor({
    required this.dio,
    required this.oauth2Dio,
    required this.pathRefreshToken,
    required this.tokenProvider,
    required this.parserJson,
    this.keyRefreshToken = 'refreshToken',
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('onRequest: ${options.headers}');
    options.headers.putIfAbsent(
        'X-Auth-Token', () => '${tokenProvider.currentValue?.accessToken}');
    options.headers.putIfAbsent(
        'X-User-Id', () => '${tokenProvider.currentValue?.userId}');
    handler.next(options);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    log('onError: ${error.response?.statusCode} -- ${tokenProvider.currentValue}');
    if (error.response?.statusCode == 401 &&
        tokenProvider.currentValue != null) {
      developer.log('onError 401 [$error]', name: TAG);
      RequestOptions options = error.response!.requestOptions;
      if ('${tokenProvider.currentValue?.accessToken}' !=
          options.headers["X-Auth-Token"]) {
        options.headers["X-Auth-Token"] =
            '${tokenProvider.currentValue?.accessToken}';
        options.headers["X-User-Id"] = '${tokenProvider.currentValue?.userId}';
        dio.fetch(options).then((value) {
          handler.resolve(value);
        }, onError: (error) {
          handler.reject(error);
        });
        return;
      }
      //region lock current Dio
      // dio.lock;
      // dio.interceptors.responseLock.lock();
      // dio.interceptors.errorLock.lock();
      //endregion
      oauth2Dio.post(pathRefreshToken, data: {
        keyRefreshToken: tokenProvider.currentValue?.refreshToken
      }).then((value) {
        log('"X-Auth-Token: ${tokenProvider.currentValue?.accessToken}');
        tokenProvider.add(parserJson(value.data));
        options.headers["X-Auth-Token"] =
            '${tokenProvider.currentValue?.accessToken}';
      }, onError: (error) {
        tokenProvider.add(null);
        handler.reject(error);
      }).whenComplete(() {
        //region unlock when refresh done
        // dio.unlock();
        // dio.interceptors.responseLock.unlock();
        // dio.interceptors.errorLock.unlock();
        //endregion
      }).then((value) {
        dio.fetch(options).then((value) {
          handler.resolve(value);
        }, onError: (error) {
          tokenProvider.add(null);
          handler.reject(error);
        });
      });
    } else {
      handler.next(error);
    }
  }
}

class Oauth2Manager<OAuthInfoMixin> {
  static const TAG = 'Oauth2Manager';

  OAuthInfoMixin? currentValue;

  late StreamController<OAuthInfoMixin?> controller;

  ValueChanged<OAuthInfoMixin?>? onSave;

  Oauth2Manager({this.currentValue, this.onSave}) {
    controller = StreamController.broadcast();
    controller.stream.listen((event) {
      currentValue = event;
    });
  }

  void add(OAuthInfoMixin? event) {
    developer.log('add [event] : $event', name: TAG);
    currentValue = event;
    onSave!(event);
    controller.add(event);
  }

  void dispose() {
    controller.close();
  }
}

mixin OAuthInfoMixin {
  get accessToken;

  get refreshToken;

  get userId;
}
