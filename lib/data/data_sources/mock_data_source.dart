import '../../domain/entities/authentication_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../dtos/authentication_dto.dart';
import '../dtos/profile_dto.dart';

class MockDataSource {
  Future<AuthenticationEntity> login(String userName, String passWord) async {
    return AuthenticationDto('accessToken', 'abc');
  }

  Future logout() async {}

  Future<ProfileEntity> profile() async {
    return ProfileDto('duc', 'id', '');
  }

  Future<String> defaultData() async {
    return 'Data Auth';
  }
}
