import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'math_event.dart';
part 'math_state.dart';

class MathBloc extends Bloc<MathEvent, MathState> {
  MathBloc() : super(const MathState()) {
    on<OnButtonTap>(_onButtonTap);
    on<Calculate>(calculate);
    on<Append>(inputing);
    on<Percent>(percent);
    on<Delete>(delete);
    on<ClearAll>(clearAll);
  }
  _onButtonTap(OnButtonTap event, Emitter<MathState> emit) {
    if (event.value == '=') {
      add(Calculate(event.value));
      return;
    }
    if (event.value == '%') {
      add(Percent(event.value));
      return;
    }
    if (event.value == 'AC') {
      add(Delete(event.value));
      return;
    }
    if (event.value == 'C') {
      add(ClearAll(event.value));
      return;
    }
    add(Append(event.value));

    // if (event.value == state.numbers.contains('C').toString()) {
    //   emit(state.copyWith(number1: '', operand: '', number2: ''));
    //   return;
    // }

    //  String? value;
    //   if (event.value != state.numbers.contains('.').toString() &&
    //       int.tryParse(event.value) == null) {
    //     if (state.operand.isNotEmpty && state.number2.isNotEmpty) {}
    //     emit(state.copyWith(operand: event.value));
    //   } else if (state.number1.isEmpty || state.operand.isEmpty) {
    //     if (event.value == state.numbers.contains('.').toString() &&
    //         state.number1.contains('.')) {
    //       return;
    //     }
    //     if (event.value == state.numbers.contains('.').toString() &&
    //             state.number1.isEmpty ||
    //         state.number1 == state.numbers.contains('.').toString()) {
    //       value = '0.';
    //     }
    //     emit(state.copyWith(
    //       number1: event.value,
    //     ));
    //   } else if (state.number2.isEmpty || state.operand.isNotEmpty) {
    //     if (event.value == state.numbers.contains('.').toString() &&
    //         state.number2.contains('.')) {
    //       return;
    //     }
    //     if (event.value == state.numbers.contains('.').toString() &&
    //             state.number2.isEmpty ||
    //         state.number2 == state.numbers.contains('.').toString()) {
    //       value = '0.';
    //     }

    //     emit(state.copyWith(
    //       number2: event.value,
    //     ));
    //   }
    // }
  }

  calculate(Calculate event, Emitter<MathState> emit) {
    if (state.number1.isEmpty) return;
    if (state.operand.isEmpty) return;
    if (state.number2.isEmpty) return;
    final double num1 = double.parse(state.number1);
    final double num2 = double.parse(state.number2);
    var res = 0.0;
    switch (state.operand) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case 'x':
        res = num1 * num2;
        break;
      case '÷':
        res = num1 / num2;
        break;
      default:
    }
    emit(state.copyWith(number1: "$res"));
    if (state.number1.endsWith('.0')) {
      emit(state.copyWith(
          number1: state.number1.substring(0, state.number1.length - 2),
          number2: '',
          operand: ''));
    }
  }

  clearAll(ClearAll event, Emitter<MathState> emit) {
    emit(state.copyWith(number1: '', number2: '', operand: ''));
  }

  percent(Percent event, Emitter<MathState> emit) {
    if (state.number1.isNotEmpty &&
        state.operand.isNotEmpty &&
        state.number2.isNotEmpty) {
      add(Calculate(event.value));
    }
    if (state.operand.isNotEmpty) {
      return;
    }
    final number = double.parse(state.number1);
    emit(state.copyWith(
      number1: '${(number / 100)}',
      operand: '',
      number2: '',
    ));
  }

  delete(Delete event, Emitter<MathState> emit) {
    if (state.number2.isNotEmpty) {
      emit(state.copyWith(
          number2: state.number2.substring(0, state.number2.length - 1)));
    } else if (state.operand.isNotEmpty) {
      emit(state.copyWith(operand: ''));
    } else if (state.number1.isNotEmpty) {
      emit(state.copyWith(
          number1: state.number1.substring(0, state.number1.length - 1)));
    }
  }

  inputing(Append event, Emitter<MathState> emit) {
    if (event.value != state.numbers.contains('.').toString() &&
        int.tryParse(event.value) == null) {
      if (state.operand.isNotEmpty && state.number2.isNotEmpty) {
        add(Calculate(event.value));
      }
      emit(state.copyWith(operand: event.value));
    } else if (state.number1.isEmpty || state.operand.isEmpty) {
      if (event.value == '.' && state.number1.contains('.')) {
        return;
      }
      String newNumber1 = state.number1 + event.value;
      if (event.value == '.' && state.number1.isEmpty) {
        newNumber1 = '0.';
      }
      emit(state.copyWith(
        number1: newNumber1,
      ));
    } else if (state.number2.isEmpty || state.operand.isNotEmpty) {
      if (event.value == '.' && state.number2.contains('.')) {
        return;
      }
      String newNumber2 = state.number2 + event.value;
      if (event.value == '.' && state.number2.isEmpty) {
        newNumber2 = '0.';
      }
      emit(state.copyWith(
        number2: newNumber2,
      ));
    }
  }
}
