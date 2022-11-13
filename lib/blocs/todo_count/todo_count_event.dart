part of 'todo_count_bloc.dart';

abstract class TodoCountEvent extends Equatable {
  const TodoCountEvent();

  @override
  List<Object> get props => [];
}

class SetTodoCountsEvent extends TodoCountEvent {}
