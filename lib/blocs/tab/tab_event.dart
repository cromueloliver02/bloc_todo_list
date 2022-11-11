part of 'tab_bloc.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();

  @override
  List<Object> get props => [];
}

class ChangeTabEvent extends TabEvent {
  final int index;

  const ChangeTabEvent({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}
