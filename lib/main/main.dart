import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:karawan/app/app.dart';
import 'package:karawan/main/bootstrap/bootstrap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _getIt = GetIt.instance;

Future<void> main() async {
  final talker = TalkerFlutter.init();
  _getIt.registerSingleton<Talker>(talker);

  bootStrap(talker, () async {
    // Initialize SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    _getIt.registerSingleton<SharedPreferences>(sharedPreferences);

    // Initialize PageCacher
    final pageCacher = PageCacher(prefs: sharedPreferences);
    _getIt.registerSingleton<PageCacher>(pageCacher);

    // Initialize Hive
    await Hive.initFlutter();

    // Initialize Storage Service
    final storageProvider = StorageProvider();
    await storageProvider.initialize();
    _getIt.registerSingleton<StorageProvider>(storageProvider);

    // Initialize FastCachedImage
    await FastCachedImageConfig.init();

    // Set HTTP overrides for development only
    if (!kReleaseMode) {
      HttpOverrides.global = MyHttpOverrides();
    }

    return const App();
  });
}
