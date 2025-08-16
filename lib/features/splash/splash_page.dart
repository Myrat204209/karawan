import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _getIt = GetIt.I;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeAppAndNavigate();

    // Trigger the fade-in animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _opacity = 1.0);
    });
  }

  Future<void> _initializeAppAndNavigate() async {
    await _setupDependencies();
    _getIt.allReady();
    Bloc.observer = TalkerBlocObserver(talker: GetIt.I<Talker>());
    if (mounted) {
      // This will be caught by your GoRouter's redirect logic.
      context.go('/splash');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 1500),
          opacity: _opacity,
          child: Assets.images.logoDark.image(),
        ),
      ).colorize(Colors.white),
    );
  }
}

Future<void> _setupDependencies() async {
  const defaultBaseUrl = 'http:192.168.137.1:8000';
  await Future.wait([
    SharedPreferences.getInstance().then(
      (prefs) => _getIt.registerSingleton(prefs),
    ),
    Hive.initFlutter(),
    FastCachedImageConfig.init(),
    getApplicationDocumentsDirectory().then((dir) async {
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorageDirectory(dir.path),
      );
    }),
  ]);

  ///Secure Storage
  final secureStorage = FlutterSecureStorage();
  _getIt.registerSingleton<TokenStorage>(
    SecureTokenStorage(secureStorage: secureStorage),
  );
  // Hive init
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
  // final pageCacher = PageCacher(prefs: _getIt<SharedPreferences>());
  // _getIt.registerSingleton<PageCacher>(pageCacher);

  // StorageProvider (cart/favorites local storage)
  _getIt.registerSingletonAsync<StorageProvider>(() async {
    final provider = StorageProvider();
    await provider.initialize();
    return provider;
  });

  // Optional dev-only: trust bad certs
  if (!kReleaseMode) {
    HttpOverrides.global = MyHttpOverrides();
  }
}
