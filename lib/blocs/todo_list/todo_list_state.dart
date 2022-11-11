part of 'todo_list_bloc.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  final List<Todo> archivedTodos;

  const TodoListState({
    required this.todos,
    required this.archivedTodos,
  });

  factory TodoListState.initial() {
    return TodoListState(
      todos: dummyTodos,
      archivedTodos: const [],
    );
  }

  @override
  List<Object> get props => [todos, archivedTodos];

  @override
  String toString() =>
      'TodoListState(todos: $todos, archivedTodos: $archivedTodos)';

  TodoListState copyWith({
    List<Todo>? todos,
    List<Todo>? archivedTodos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
      archivedTodos: archivedTodos ?? this.archivedTodos,
    );
  }
}
