part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final Todo todo;

  const AddTodoEvent({
    required this.todo,
  });

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'AddTodoEvent(todo: $todo)';
}
