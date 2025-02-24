import 'package:flutter/material.dart';
import 'package:flutter_every_platform_template/application/services/local_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../presentation/blocs/auth_navigation/auth_navigation_bloc.dart';
import '../presentation/blocs/auth_navigation/auth_navigation_state.dart';
import '../presentation/navigator/auth_navigator.dart';
import '../presentation/navigator/guest_navigator.dart';
import '../presentation/navigator/main_navigator.dart';
import '../presentation/pages/splash/splash_page.dart';
import '../themes.dart';

class Application extends StatefulWidget {
  static const path = 'Application';

  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light(context),
      darkTheme: dark(context),
      home: BlocBuilder<AuthNavigationBloc, AuthNavigationState>(
        bloc: context.read<AuthNavigationBloc>(),
        builder: (context, state) {
          return state.when(
              authorized: () => const MainNavigator(),
              unAuthorized: () => const AuthNavigator(),
              guestMode: () => const GuestNavigator(),
              loadConfig: () => SplashPage(initializeApp: (context) async {
                    if (GetIt.instance.get<LocalService>().isAuthorized()) {
                      return const AuthNavigationState.authorized();
                    } else {
                      return const AuthNavigationState.guestMode();
                    }
                  }));
        },
        buildWhen: (stateOld, stateCurrent) {
          return stateOld.runtimeType != stateCurrent.runtimeType;
        },
      ),
    );
  }
}
