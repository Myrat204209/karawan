import 'dart:io';

import 'package:app_ui/src/storage/storage_provider.dart';
import 'package:data_provider/data_provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
// import 'package:hive_ce_flutter/hive_flutter.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:karawan/app/app.dart';
import 'package:karawan/main/bootstrap/bootstrap.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _getIt = GetIt.instance;
Future<void> main() async {
  final talker = TalkerFlutter.init();
  _getIt.registerSingleton<Talker>(talker);
  bootStrap(talker, () async {
    // const defaultBaseUrl = 'baseurl:8080';
    final sharedPreferences = await SharedPreferences.getInstance();
    _getIt.registerSingleton<SharedPreferences>(sharedPreferences);
    final pageCacher = PageCacher(prefs: sharedPreferences);
    _getIt.registerSingleton<PageCacher>(pageCacher);

    /// Hive
    await Hive.initFlutter();

    /// Storage Service
    await StorageProvider.initialize();

    /// FastCachedImage
    await FastCachedImageConfig.init();
    // final httpClient = Http(defaultBaseUrl: defaultBaseUrl);

    // HydratedBloc.storage = await HydratedStorage.build(
    //   storageDirectory: HydratedStorageDirectory(
    //     (await getApplicationDocumentsDirectory()).path,
    //   ),
    // );

    HttpOverrides.global = MyHttpOverrides();

    // await Hive.initFlutter();
    // Hive.registerAdapters();
    return App();
  });
}
