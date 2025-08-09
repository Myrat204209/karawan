import 'dart:async';

import 'package:karawan/app/app.dart';
import 'package:karawan/main/bootstrap/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
