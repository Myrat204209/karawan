import 'dart:async' show FutureOr;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

typedef AppBuilder = FutureOr<Widget> Function();
Future<void> bootStrap(Talker talker, AppBuilder builder) async {
  await runTalkerZonedGuarded<Future<void>>(
    talker,
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // await SentryFlutter.init((options) {
      //   options.dsn = 'https://b3aa888e7f33c4ed1bf258b42a1389d1@o4509077517172736.ingest.de.sentry.io/4509077619343440';
      // });
      Bloc.observer = TalkerBlocObserver(talker: talker);
      
      runApp(await builder());
    },

    (exception, stackTrace) async {
      // await Sentry.captureException(exception, stackTrace: stackTrace);
      FlutterError.onError =
          (details) =>
              talker.error('Error has happened', exception, stackTrace);
      PlatformDispatcher.instance.onError = (error, stack) {
        talker.error("PlatformDispatcherError has happened", error, stack);
        return true;
      };
    },
  );
}
