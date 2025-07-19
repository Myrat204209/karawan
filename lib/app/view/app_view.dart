import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:karawan/app/router/router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final AppRouter _router;
  late final Talker _talker;

  @override
  void initState() {
    super.initState();
    _talker = GetIt.I<Talker>();
    _router = GetIt.I<AppRouter>();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize: const Size(428, 952),
          minTextAdapt: true,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme().themeData,
            themeMode: ThemeMode.light,
            routerConfig: _router.config(
              navigatorObservers: () => [
                TalkerRouteObserver(_talker),
                // SentryNavigatorObserver(),
              ],
            ),
          ),
        );
      },
    );
  }
}
