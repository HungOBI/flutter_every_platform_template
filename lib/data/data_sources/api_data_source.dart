import 'package:dio/dio.dart';

import '../../domain/entities/authentication_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../initialize_dependencies.dart';

class ApiDataSource {
  final Dio _dio = sl.get();

  Future<AuthenticationEntity> login(String userName, String passWord) async {
    throw UnimplementedError();
  }

  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  //region user

  Future<ProfileEntity> profile({required String userId}) async {
    throw UnimplementedError();
  }

//endregion
}
