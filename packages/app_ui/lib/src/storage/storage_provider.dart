import 'package:app_ui/src/storage/storage_service.dart';

import 'package:get_it/get_it.dart';

class StorageProvider {
  static final StorageService _storageService = StorageService();

  static Future<void> initialize() async {
    await _storageService.initialize();
    GetIt.I.registerSingleton<StorageService>(_storageService);
  }

  static StorageService get service => GetIt.I<StorageService>();
}
