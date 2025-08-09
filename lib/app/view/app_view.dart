import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karawan/app/app.dart';
import 'package:karawan/app/router/go_router_config.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  static final ThemeData _theme = AppTheme().themeData;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 952),
      minTextAdapt: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: _theme,
        themeMode: ThemeMode.light,
        routerConfig: goRouter,
      ),
    );
  }
}
