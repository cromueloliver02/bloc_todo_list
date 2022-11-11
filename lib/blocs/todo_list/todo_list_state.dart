part of 'todo_list_bloc.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  final List<Todo> archivedTodos;

  const TodoListState({
    required this.todos,
    required this.archivedTodos,
  });

  factory TodoListState.initial() {
    return const TodoListState(
      todos: [],
      archivedTodos: [],
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'todos': todos.map((x) => x.toMap()).toList(),
      'archivedTodos': archivedTodos.map((x) => x.toMap()).toList(),
    };
  }

  factory TodoListState.fromMap(Map<String, dynamic> map) {
    return TodoListState(
      todos: List<Todo>.from(
        (map['todos'] as List<dynamic>).map<Todo>(
          (x) => Todo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      archivedTodos: List<Todo>.from(
        (map['archivedTodos'] as List<dynamic>).map<Todo>(
          (x) => Todo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
