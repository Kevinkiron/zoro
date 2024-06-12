part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int tabIndex;
  final List<StatelessWidget> pages;
  final List<String> data;
  const HomeState({
    this.tabIndex = 0,
    this.data = const <String>[
      'title',
      'sub',
      'end',
    ],
    this.pages = const <StatelessWidget>[
      HomeView(),
      Transaction(),
      Statistics(),
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
