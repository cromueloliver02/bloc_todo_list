part of 'todo_list_bloc.dart';

const uuid = Uuid();

class TodoListState extends Equatable {
  final List<Todo> todos;

  const TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(
        id: uuid.v4(),
        title: lorem(paragraphs: 1, words: 7),
        description: lorem(paragraphs: 1, words: 20),
      ),
      Todo(
        id: uuid.v4(),
        title: lorem(paragraphs: 1, words: 7),
        description: lorem(paragraphs: 1, words: 20),
      ),
      Todo(
        id: uuid.v4(),
        title: lorem(paragraphs: 1, words: 7),
        description: lorem(paragraphs: 1, words: 20),
      ),
    ]);
  }

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodoListState(todos: $todos)';

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
