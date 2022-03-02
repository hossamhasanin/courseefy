import 'package:equatable/equatable.dart';

abstract class LogicEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShowErrorDialog extends LogicEvents{
  final String error;

  ShowErrorDialog(this.error);
  @override
  List<Object?> get props => [error];
}