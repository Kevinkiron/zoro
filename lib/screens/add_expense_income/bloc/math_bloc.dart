import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'math_event.dart';
part 'math_state.dart';

class MathBloc extends Bloc<MathEvent, MathState> {
  MathBloc() : super(MathState()) {
    on<MathEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
