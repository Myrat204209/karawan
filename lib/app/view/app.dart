// ignore_for_file: public_member_api_docs, sort_construct
import 'package:flutter/material.dart';
import 'package:karawan/app/app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: AppView());
  }
}
