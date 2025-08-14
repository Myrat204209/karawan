part of 'home_repository.dart';

abstract class HomeFailure with EquatableMixin implements Exception {
  const HomeFailure(this.error);
  final Object error;
  @override
  List<Object?> get props => [error];
}
