import '../../domain/entities/authentication_entity.dart';
import '../../domain/entities/profile_entity.dart';

class LocalDataSource {
  Future<AuthenticationEntity> login(String userName, String passWord) {
    // TODO: implement login
    throw UnimplementedError();
  }

  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  Future<ProfileEntity> profile() {
    // TODO: implement profile
    throw UnimplementedError();
  }

  Future<String> defaultData() async {
    return 'Data unAuth';
  }
}
