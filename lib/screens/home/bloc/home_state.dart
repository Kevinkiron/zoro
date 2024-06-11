part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int tabIndex;
  final List<StatelessWidget> pages;
  const HomeState({
    this.tabIndex = 0,
    this.pages = const <StatelessWidget>[
      HomeView(),
      Statistics(),
      Transaction(),
      Budget(),
    ],
  });
  HomeState copWith({
    int? tabIndex,
  }) {
    return HomeState(
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  @override
  List<Object> get props => [
        tabIndex,
      ];
}
