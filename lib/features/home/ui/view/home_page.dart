// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:karawan/features/features.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.section});

  final AppSection section;
  @override
  Widget build(BuildContext context) {
    return HomeView(section: section);
  }
}
