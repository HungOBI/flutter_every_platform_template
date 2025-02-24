import 'package:flutter/material.dart';

import '../../../../domain/entities/profile_entity.dart';

class HomeDrawerWidget extends StatefulWidget {
  const HomeDrawerWidget({Key? key, this.profile, this.onLogin, this.onLogout})
      : super(key: key);
  final ProfileEntity? profile;
  final void Function()? onLogin;
  final void Function()? onLogout;

  @override
  HomeDrawerWidgetState createState() => HomeDrawerWidgetState();
}

class HomeDrawerWidgetState extends State<HomeDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: widget.profile != null
          ? Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                Text('Helu ${widget.profile!.name}'),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: widget.onLogout,
                  child: const Text('LogOut'),
                ),
              ],
            )
          : ElevatedButton(
              onPressed: widget.onLogin,
              child: const Text('Login'),
            ),
    );
  }
}
