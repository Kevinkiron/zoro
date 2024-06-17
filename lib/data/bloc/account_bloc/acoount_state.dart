part of 'acoount_bloc.dart';

final class AcoountState extends Equatable {
  final List<Account> accounts;
  const AcoountState({
    this.accounts = const <Account>[],
  });
  AcoountState copyWith({
    List<Account>? accounts,
  }) {
    return AcoountState(accounts: accounts ?? this.accounts);
  }

  @override
  List<Object> get props => [accounts];
}
