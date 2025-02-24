import '../../../domain/entities/authentication_entity.dart';
import '../../../domain/entities/profile_entity.dart';
import '../../../domain/repositories/auth/auth_api_repository.dart';
import '../../data_sources/api_data_source.dart';

class AuthApiRepositoryImpl implements AuthApiRepository {
  ApiDataSource apiDataSource = ApiDataSource();

  @override
  Future<AuthenticationEntity> login(String userName, String passWord) {
    return apiDataSource.login('ohmidasvn', 'Ohmidas@123');
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<ProfileEntity> profile({required String userId}) {
    return apiDataSource.profile(userId: userId);
  }
}
