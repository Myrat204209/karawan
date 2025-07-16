// part of 'main_host_bloc.dart';

// enum MainHostStatus { initial, loading, success, failure, refreshing }

// class MainHostState extends Equatable {
//   const MainHostState({
//     required this.status,
//     this.mainHosts = const [],
//   });

//   const MainHostState.initial() : this(status: MainHostStatus.initial);

//   final MainHostStatus status;
//   final List<MainHostItem> mainHosts;

//   @override
//   List<Object> get props => [status, mainHosts];

//   MainHostState copyWith({
//     MainHostStatus? status,
//     List<MainHostItem>? mainHosts,
//   }) {
//     return MainHostState(
//       status: status ?? this.status,
//       mainHosts: mainHosts ?? this.mainHosts,
//     );
//   }
// }