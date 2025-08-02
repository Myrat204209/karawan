// // lib/network/error_interceptor.dart

// import 'dart:developer';

// import 'package:data_provider/data_provider.dart';
// import 'package:dio/dio.dart';

// class ErrorInterceptor extends Interceptor {
//   ErrorInterceptor({required this.connectivityService});

//   final ConnectivityService connectivityService;

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     log('Connection reached its limit');
//     // Check if the error is a network-related issue.
//     if (err.type == DioExceptionType.connectionTimeout ||
//         err.type == DioExceptionType.sendTimeout ||
//         err.type == DioExceptionType.receiveTimeout ||
//         err.type == DioExceptionType.connectionError) {
//       // If it is, report the connection failure to the global service.
//       // This will trigger your "No Internet" banner.
//       connectivityService.reportConnectionFailure();
//     }

//     // Allow the error to continue to be handled by the repository/BLoC.
//     super.onError(err, handler);
//   }
// }
