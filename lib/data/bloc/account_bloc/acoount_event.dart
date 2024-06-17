part of 'acoount_bloc.dart';

class AcoountEvent extends Equatable {
  const AcoountEvent();

  @override
  List<Object> get props => [];
}

class AddAmount extends AcoountEvent {
  final String note;
  final double amount;
  const AddAmount(this.note, this.amount);

  @override
  List<Object> get props => [note, amount];
}

class ReadAccount extends AcoountEvent {
  const ReadAccount();

  @override
  List<Object> get props => [];
}
