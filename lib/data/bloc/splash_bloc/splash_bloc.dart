import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<NavigateToHome>(navigateToHome);
  }
  navigateToHome(NavigateToHome event, Emitter<SplashState> emit) {
    emit(const SplashState(status: Status.success));
  }
}
