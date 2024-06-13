part of 'math_bloc.dart';

class MathState extends Equatable {
  final List<String> numbers;
  final String number1;
  final String number2;
  final String operand;
  const MathState({
    this.number1 = '',
    this.operand = '',
    this.number2 = '',
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
  MathState copyWith({
    String? number1,
    String? number2,
    String? operand,
  }) {
    return MathState(
      number1: number1 ?? this.number1,
      number2: number2 ?? this.number2,
      operand: operand ?? this.operand,
    );
  }

  @override
  List<Object> get props => [
        number1,
        number2,
        operand,
      ];
}
