import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/auth_bloc.dart';

class LoginBodyWidget extends StatefulWidget {
  const LoginBodyWidget({Key? key}) : super(key: key);

  @override
  LoginBodyWidgetState createState() => LoginBodyWidgetState();
}

class LoginBodyWidgetState extends State<LoginBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: ElevatedButton(
            onPressed: () async {
              await context.read<AuthBloc>().login('userName', 'passWord');
            },
            child: Text('LogIn')),
      ),
    );
  }
}
