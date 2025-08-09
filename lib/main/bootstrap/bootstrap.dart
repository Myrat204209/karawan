import 'dart:async';
import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:data_provider/storage/token_storage.dart' as dp;
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:karawan/app/core/page_cacher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;

class HiveBoxKeys {
  static const String userLanguageBoxKey = 'user_language_box';
}

class TokenStorage implements dp.TokenStorage {
  TokenStorage(this._secureStorage);
  final FlutterSecureStorage _secureStorage;

  static const _kAccess = 'access_token';
  static const _kRefresh = 'refresh_token';

  @override
  Future<void> clearTokens() async {
    await _secureStorage.delete(key: _kAccess);
    await _secureStorage.delete(key: _kRefresh);
  }

  @override
  Future<String?> readAccessToken() => _secureStorage.read(key: _kAccess);

  @override
  Future<String?> readRefreshToken() => _secureStorage.read(key: _kRefresh);

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _secureStorage.write(key: _kAccess, value: accessToken);
    await _secureStorage.write(key: _kRefresh, value: refreshToken);
  }
}

typedef AppBuilder = FutureOr<Widget> Function();

Future<void> bootstrap(AppBuilder builder) async {
  final talker = TalkerFlutter.init();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Error handling
      FlutterError.onError = (details) =>
          talker.handle(details.exception, details.stack);
      PlatformDispatcher.instance.onError = (error, stack) {
        talker.handle(error, stack);
        return true;
      };

      // Orientation lock
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      // Talker + Bloc observer
      getIt.registerSingleton<Talker>(talker);
      Bloc.observer = TalkerBlocObserver(talker: talker);

      // SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      getIt.registerSingleton<SharedPreferences>(prefs);

      // PageCacher
      final pageCacher = PageCacher(prefs: prefs);
      getIt.registerSingleton<PageCacher>(pageCacher);

      // StorageProvider (cart/favorites local storage)
      final storageProvider = StorageProvider();
      await storageProvider.initialize();
      getIt.registerSingleton<StorageProvider>(storageProvider);

      // Hive init
      await Hive.initFlutter();
      final languagesBox = await Hive.openBox<Map>(
        HiveBoxKeys.userLanguageBoxKey,
      );
      getIt.registerSingleton<Box<Map>>(
        languagesBox,
        instanceName: HiveBoxKeys.userLanguageBoxKey,
      );

      // FastCachedNetworkImage init
      await FastCachedImageConfig.init();

      // Secure token storage
      final secure = const FlutterSecureStorage();
      getIt.registerSingleton<TokenStorage>(TokenStorage(secure));

      // Http client
      // final http = Http(
      //   tokenStorage: getIt<TokenStorage>(),
      //   defaultBaseUrl: 'BASE_URL',
      //   talker: talker,
      // );
      // getIt.registerSingleton<Http>(http);

      // Optional dev-only: trust bad certs
      if (!kReleaseMode) {
        HttpOverrides.global = MyHttpOverrides();
      }

      runApp(await builder());
    },
    (error, stack) {
      talker.handle(error, stack);
    },
  );
}
