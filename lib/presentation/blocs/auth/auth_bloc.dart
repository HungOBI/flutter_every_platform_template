import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../application/services/auth_service.dart';
import '../../../application/services/local_service.dart';
import '../../../data/dtos/authentication_dto.dart';
import '../../../initialize_dependencies.dart';
import '../../../oauth2_interceptor.dart';
import '../../../utils/cache.dart';
import '../auth_navigation/auth_navigation_bloc.dart';
import '../auth_navigation/auth_navigation_state.dart';
import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(const AuthState.unAuthorized());

  final authNavigationBloc = GetIt.instance.get<AuthNavigationBloc>();

  final authService = GetIt.instance.get<AuthService>();

  final localService = GetIt.instance.get<LocalService>();

  final Oauth2Manager<AuthenticationDto> oauth2manager = sl.get();

  Future login(String userName, String passWord) async {
    final auth = await authService.login(userName, passWord);
    await localService.saveAuth(
        auth: AuthenticationDto(auth.accessToken, auth.userId));
    oauth2manager.add(AuthenticationDto(auth.accessToken, auth.userId));
    final profile = await authService.profile(userId: auth.userId);
    Cache.profile = profile;
    emit(AuthState.authorized(profile));
    authNavigationBloc.setState(const AuthNavigationState.authorized());
  }

  void logout() {
    Cache.profile = null;
    localService.saveAuth(auth: null);
    emit(const AuthState.unAuthorized());
    authNavigationBloc.setState(const AuthNavigationState.guestMode());
  }

  Future initializeApp() async {
    final auth = localService.getAuthenticationDto();
    final profile = await authService.profile(userId: auth!.userId);
    Cache.profile = profile;
    emit(AuthState.authorized(profile));
  }
}
