import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_every_platform_template/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_every_platform_template/presentation/blocs/auth_navigation/auth_navigation_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/services/auth_service.dart';
import 'application/services/local_service.dart';
import 'data/dtos/authentication_dto.dart';
import 'data/impl_repositories/auth/auth_api_repository_impl.dart';
import 'data/impl_repositories/auth/auth_local_repository_impl.dart';
import 'data/impl_repositories/auth/auth_mock_repository_impl.dart';
import 'domain/repositories/auth/auth_api_repository.dart';
import 'domain/repositories/auth/auth_local_reposirory.dart';
import 'domain/repositories/auth/auth_mock_repository.dart';
import 'flavor.dart';
import 'oauth2_interceptor.dart';

final sl = GetIt.I;

Future initializeDependencies() async {
  final baseUrl = Flavor.instance.baseURL;
  log('baseUrl: $baseUrl');
  //region local IO
  final sharedPres = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPres);
  //endregion

  //region repo
  sl.registerLazySingleton<AuthApiRepository>(() => AuthApiRepositoryImpl());
  sl.registerLazySingleton<AuthLocalRepository>(
      () => AuthLocalRepositoryImpl());
  sl.registerLazySingleton<AuthMockRepository>(() => AuthMockRepositoryImpl());
  //endregion

  //region service
  sl.registerLazySingleton(() => LocalService());
  //endregion

  //region state
  sl.registerLazySingleton(() => AuthNavigationBloc());
  sl.registerLazySingleton(() => AuthService(sl(), sl(), sl()));
  sl.registerLazySingleton(() => AuthBloc());
  //endregion

  //region network server
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl))
    ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  Oauth2Manager<AuthenticationDto> oauth2manager =
      Oauth2Manager<AuthenticationDto>(
          currentValue: sl.get<LocalService>().getAuthenticationDto(),
          onSave: (value) {
            if (value == null) {
              sl.get<LocalService>().saveAuth(auth: null);
            } else {
              sl.get<LocalService>().saveAuth(auth: value);
            }
          });

  sl.registerLazySingleton<Oauth2Manager<AuthenticationDto>>(
      () => oauth2manager);

  dio.interceptors.add(
    Oauth2Interceptor(
      dio: dio,
      oauth2Dio: Dio(BaseOptions(baseUrl: baseUrl)),
      pathRefreshToken: '',
      parserJson: (json) {
        return AuthenticationDto.fromJson(json as Map<String, dynamic>);
      },
      tokenProvider: oauth2manager,
    ),
  );
  sl.registerLazySingleton(() => dio);
  //endregion
}
