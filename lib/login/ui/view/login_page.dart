import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/login/login.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}
