// // lib/services/connectivity_service.dart
// import 'dart:async';

// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// enum ConnectionStatus { online, offline }

// final class ConnectivityService {
//   final _controller = StreamController<ConnectionStatus>.broadcast();
//   late final StreamSubscription<InternetStatus> _subscription;

//   Stream<ConnectionStatus> get status => _controller.stream;

//   ConnectivityService() {
//     _subscription = InternetConnection().onStatusChange.listen((status) {
//       _controller.add(
//         status == InternetStatus.connected
//             ? ConnectionStatus.online
//             : ConnectionStatus.offline,
//       );
//     });
//   }

//   void reportConnectionFailure() {
//     _controller.add(ConnectionStatus.offline);
//   }

//   void dispose() {
//     _subscription.cancel();
//     _controller.close();
//   }
// }
