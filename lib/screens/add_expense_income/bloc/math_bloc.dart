import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'math_event.dart';
part 'math_state.dart';

class MathBloc extends Bloc<MathEvent, MathState> {
  MathBloc() : super(MathState()) {
    on<OnButtonTap>(_onButtonTap);
  }
  _onButtonTap(OnButtonTap event, Emitter<MathState> emit) {
    if (event.value != state.numbers.contains('.').toString() &&
        int.tryParse(event.value) == null) {
      if (state.operand.isNotEmpty && state.number2.isNotEmpty) {}
      emit(state.copyWith(operand: event.value));
    } else if (state.number1.isEmpty || state.operand.isEmpty) {
      if (event.value == state.numbers.contains('.').toString() &&
          state.number1.contains('.')) {
        return;
      }
      if (event.value == state.numbers.contains('.').toString() &&
              state.number1.isEmpty ||
          state.number1 == state.numbers.contains('.').toString()) {
        String value = '0.';
      }
      emit(state.copyWith(number1: event.value));
    }
  }
}
