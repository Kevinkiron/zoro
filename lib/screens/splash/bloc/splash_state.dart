part of 'splash_bloc.dart';

enum Status { success, failure, initial }

class SplashState extends Equatable {
  final Status status;
  const SplashState({
    this.status = Status.initial,
  });

  @override
  List<Object> get props => [status];
}
