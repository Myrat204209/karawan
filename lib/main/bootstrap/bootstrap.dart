import 'dart:async';
import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:data_provider/storage/storage.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:karawan/app/app.dart' show App;
import 'package:karawan/app/core/page_cacher.dart';
import 'package:karawan/repositories/repositories.dart';
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
  final storageProvider = StorageProvider();
  await storageProvider.initialize();
  _getIt.registerSingleton<StorageProvider>(storageProvider);
  _getIt.registerFactoryParam<CartRepository, AppSection, void>(
    (section, _) => CartRepository(
      storageProvider: _getIt<StorageProvider>(),
      section: section,
    ),
  );

  // ADD THIS REGISTRATION
  // Register FavoritesRepository as a factory that also requires an AppSection
  _getIt.registerFactoryParam<FavoritesRepository, AppSection, void>(
    (section, _) => FavoritesRepository(
      storageProvider: _getIt<StorageProvider>(),
      section: section,
    ),
  );

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
