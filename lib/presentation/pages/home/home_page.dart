import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design_system_widgets/app_error_widget.dart';
import '../../../design_system_widgets/app_loading_widget.dart';
import '../../../domain/entities/profile_entity.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_state.dart';
import '../../blocs/auth_navigation/auth_navigation_bloc.dart';
import '../../blocs/auth_navigation/auth_navigation_state.dart';
import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_state.dart';
import 'widgets/guest_body_widget.dart';
import 'widgets/home_body_widget.dart';
import 'widgets/home_drawer_widget.dart';

class HomePage extends StatefulWidget {
  static const path = 'HomePage';

  const HomePage({Key? key, this.guestMode = false}) : super(key: key);
  final bool guestMode;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().fetchDefaultData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: BlocSelector<AuthBloc, AuthState, ProfileEntity?>(
          selector: (state) =>
              state.mapOrNull(authorized: (auth) => auth.profileModel),
          builder: (context, profile) {
            return HomeDrawerWidget(
              profile: profile,
              onLogin: () {
                context
                    .read<AuthNavigationBloc>()
                    .setState(const AuthNavigationState.unAuthorized());
              },
              onLogout: () {
                context.read<AuthBloc>().logout();
                context.read<HomeBloc>().fetchDefaultData();
              },
            );
          }),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return state.when(
            (defaultData) {
              return widget.guestMode
                  ? GuestBodyWidget(defaultData: defaultData)
                  : HomeBodyWidget(defaultData: defaultData);
            },
            loading: () => const AppLoadingWidget(),
            error: (e) => AppErrorWidget(error: e),
          );
        }),
      ),
    );
  }
}
