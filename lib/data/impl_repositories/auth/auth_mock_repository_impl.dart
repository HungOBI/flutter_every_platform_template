import 'package:flutter_every_platform_template/data/dtos/authentication_dto.dart';

import '../../../domain/entities/authentication_entity.dart';
import '../../../domain/entities/profile_entity.dart';
import '../../../domain/repositories/auth/auth_mock_repository.dart';
import '../../data_sources/mock_data_source.dart';

class AuthMockRepositoryImpl implements AuthMockRepository {
  MockDataSource mockDataSource = MockDataSource();

  @override
  Future<String> defaultData() {
    return mockDataSource.defaultData();
  }

  @override
  Future<AuthenticationEntity> login(String userName, String passWord) async {
    return AuthenticationDto('accessToken', 'userId');
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<ProfileEntity> profile() {
    return mockDataSource.profile();
  }
}
