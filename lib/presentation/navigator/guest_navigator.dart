import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/navigator_support.dart';
import '../blocs/home/home_bloc.dart';
import '../pages/home/home_page.dart';

class GuestNavigator extends StatefulWidget {
  static const path = '/guest_navigator';

  const GuestNavigator({Key? key}) : super(key: key);

  @override
  State<GuestNavigator> createState() => _GuestNavigatorState();
}

class _GuestNavigatorState extends State<GuestNavigator> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeBloc();
      },
      child: NavigatorSupport(
        initialRoute: HomePage.path,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case HomePage.path:
              return MaterialPageRoute(
                  builder: (context) => const HomePage(
                        guestMode: true,
                      ));
            default:
              return MaterialPageRoute(builder: (context) => Container());
          }
        },
      ),
    );
  }
}
