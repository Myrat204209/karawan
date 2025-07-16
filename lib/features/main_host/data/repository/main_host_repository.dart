// import 'package:equatable/equatable.dart';

// part 'main_host_failures.dart';


// class MainHostRepository {
//   MainHostRepository({
//     required MainHostClient mainHostClient,
//   }) : _mainHostClient = mainHostClient;

//   final MainHostClient _mainHostClient;

//   Future<List<MainHostItem>?> getMainHosts() async {
//     try {
//       return await _mainHostClient.getMainHosts();
//     } catch (error, stackTrace) {
//       Error.throwWithStackTrace(GetMainHostListFailure(error), stackTrace);
//     }
//   }
// }