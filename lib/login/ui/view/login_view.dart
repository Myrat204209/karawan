import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ColoredBox(
          color: Colors.green,
          child: Center(child: Text('Login')),
        ),
        appBar: AppBar(
          leading: Icon(Icons.mark_email_read),
          centerTitle: true,
          title: Text(
            'Login',
            style: TextStyle(color: Colors.yellow, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
