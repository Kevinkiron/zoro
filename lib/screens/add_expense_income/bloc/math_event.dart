part of 'math_bloc.dart';

class MathEvent extends Equatable {
  const MathEvent();

  @override
  List<Object> get props => [];
}

class OnButtonTap extends MathEvent {
  final String value;
  const OnButtonTap(this.value);

  @override
  List<Object> get props => [value];
}
