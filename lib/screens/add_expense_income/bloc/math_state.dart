part of 'math_bloc.dart';

class MathState extends Equatable {
  final List<String> numbers;
  const MathState({
    this.numbers = const <String>[
      'C',
      'AC',
      '%',
      '÷',
      '7',
      '8',
      '9',
      'x',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '0',
      '.',
      '=',
    ],
  });

  @override
  List<Object> get props => [];
}
