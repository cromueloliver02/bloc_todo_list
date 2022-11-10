part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String title;
  final String desc;

  const AddTodoEvent({
    required this.title,
    required this.desc,
  });

  @override
  List<Object> get props => [title, desc];

  @override
  String toString() => 'AddTodoEvent(title: $title, desc: $desc)';
}

class EditTodoEvent extends TodoListEvent {
  final String id;
  final String title;
  final String desc;

  const EditTodoEvent({
    required this.id,
    required this.title,
    required this.desc,
  });

  @override
  List<Object> get props => [id, title, desc];

  @override
  String toString() => 'EditTodoEvent(id: $id, title: $title, desc: $desc)';
}