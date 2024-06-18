part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class NavigateIndex extends HomeEvent {
  final int selectIndex;
  const NavigateIndex(this.selectIndex);

  @override
  List<Object> get props => [
        selectIndex,
      ];
}

class ResetHomeState extends HomeEvent {
  const ResetHomeState();

  @override
  List<Object> get props => [];
}
