import 'package:equatable/equatable.dart';

abstract class LogicEvents extends Equatable{
  @override
  List<Object?> get props => [];
}

class ShowDoneLoginDialog extends LogicEvents{}
class ShowErrorLoginDialog extends LogicEvents{
  final String error;

  ShowErrorLoginDialog(this.error);

  @override
  List<Object?> get props => [error];
}