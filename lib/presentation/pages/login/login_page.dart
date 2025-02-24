import 'package:flutter/material.dart';

import 'widgets/login_body_widget.dart';

class LoginPage extends StatefulWidget {
  static const path = 'LoginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: LoginBodyWidget(),
    );
  }
}
