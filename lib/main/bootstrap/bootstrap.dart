import 'dart:async';
import 'dart:io';

import 'package:data_provider/data_provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:karawan/app/app.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _getIt = GetIt.instance;

Future<void> bootstrap() async {
  final talker = TalkerFlutter.init();

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
      _getIt.registerSingleton<Talker>(talker);
      await _setupDependencies();
      _getIt.allReady();
      Bloc.observer = TalkerBlocObserver(talker: talker);

      // Orientation lock
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

Future<void> _setupDependencies() async {
  const defaultBaseUrl = 'http:192.168.137.1:8000';
  _getIt.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  ///Secure Storage
  final secureStorage = FlutterSecureStorage();
  _getIt.registerSingleton<TokenStorage>(
    SecureTokenStorage(secureStorage: secureStorage),
  );
  // Hive init
  await Hive.initFlutter();
  // FastCachedNetworkImage init
  await FastCachedImageConfig.init();
  // Services
  _getIt.registerSingleton<ConnectivityService>(ConnectivityService());

  // HTTP Client
  _getIt.registerLazySingleton<Http>(
    () => Http(
      tokenStorage: _getIt<TokenStorage>(),
      defaultBaseUrl: defaultBaseUrl,
      connectivityService: _getIt<ConnectivityService>(),
      talker: _getIt<Talker>(),
    ),
  );
  _getIt.registerLazySingleton<AuthClient>(() => AuthClient(_getIt<Http>()));
  _getIt.registerLazySingleton<ProfileClient>(
    () => ProfileClient(_getIt<Http>()),
  );
  // Repositories
  // _getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  // _getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository());

  // PageCacher
  final pageCacher = PageCacher(prefs: _getIt<SharedPreferences>());
  _getIt.registerSingleton<PageCacher>(pageCacher);

  // StorageProvider (cart/favorites local storage)
  _getIt.registerSingletonAsync<StorageProvider>(() async {
    final provider = StorageProvider();
    await provider.initialize();
    return provider;
  });

  /// HydratedBLoC
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );
  // Optional dev-only: trust bad certs
  if (!kReleaseMode) {
    HttpOverrides.global = MyHttpOverrides();
  }
}
