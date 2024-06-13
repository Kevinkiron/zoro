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

class Append extends MathEvent {
  final String value;
  const Append(this.value);

  @override
  List<Object> get props => [value];
}

class Percent extends MathEvent {
  final String value;
  const Percent(this.value);

  @override
  List<Object> get props => [value];
}

class Delete extends MathEvent {
  final String value;
  const Delete(this.value);

  @override
  List<Object> get props => [value];
}

class Calculate extends MathEvent {
  final String value;
  const Calculate(this.value);

  @override
  List<Object> get props => [value];
}

class ClearAll extends MathEvent {
  final String value;
  const ClearAll(this.value);

  @override
  List<Object> get props => [value];
}
