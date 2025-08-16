import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:get_it/get_it.dart';
import 'package:karawan/app/app.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _getIt = GetIt.instance;

Future<void> bootstrap() async {
  final talker = TalkerFlutter.init();
  _getIt.registerSingleton<Talker>(talker);

  await runTalkerZonedGuarded(
    talker,
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) =>
          talker.handle(details.exception, details.stack);
      PlatformDispatcher.instance.onError = (error, stack) {
        talker.handle(error, stack);
        return true;
      };
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      runApp(const App());
    },
    (exception, stackTrace) async {
      talker.handle(exception, stackTrace, 'Zoned Error');
    },
  );
}
