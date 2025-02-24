import '../../entities/authentication_entity.dart';
import '../../entities/profile_entity.dart';

abstract class AuthApiRepository {
  Future<AuthenticationEntity> login(String userName, String passWord);

  Future logout();

  Future<ProfileEntity> profile({required String userId});
}
