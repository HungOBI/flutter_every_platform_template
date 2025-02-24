import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/auth_service.dart';
import '../../../initialize_dependencies.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(const HomeState.loading());

  final AuthService authService = sl.get();

  Future fetchDefaultData() async {
    var data = await authService.defaultData();
    emit(HomeState(data));
  }
}
