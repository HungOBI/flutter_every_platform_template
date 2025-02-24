import '../../oauth2_interceptor.dart';

abstract class AuthenticationEntity with OAuthInfoMixin {
  String get accessToken;

  String get refreshToken;

  String get userId;
}
