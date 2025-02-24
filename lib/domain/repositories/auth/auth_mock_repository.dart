import '../../entities/authentication_entity.dart';
import '../../entities/profile_entity.dart';

abstract class AuthMockRepository {
  Future<AuthenticationEntity> login(String userName, String passWord);

  Future logout();

  Future<ProfileEntity> profile();

  Future<String> defaultData();
}
