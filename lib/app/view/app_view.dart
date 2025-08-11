import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karawan/app/app.dart';
import 'package:karawan/app/l10n/app_localizations/app_localizations.dart';
import 'package:karawan/app/language/cubit/language_cubit.dart';
import 'package:karawan/app/router/go_router_config.dart';
import 'package:turkmen_localization_support/turkmen_localization_support.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 952),
      minTextAdapt: true,

      useInheritedMediaQuery: true,
      child: BlocBuilder<LanguageCubit, Locale>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, locale) {
          return MaterialApp.router(
            locale: locale,

            debugShowCheckedModeBanner: false,
            theme: AppTheme().themeData,

            // darkTheme: AppDarkTheme().themeData,
            localizationsDelegates: const [
              ...AppLocalizations.localizationsDelegates,
              ...TkDelegates.delegates,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            themeMode: ThemeMode.light,
            routerConfig: goRouter,
          );
        },
      ),
    );
  }
}
