part of 'filtered_todos_bloc.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;

  const FilteredTodosState({
    required this.filteredTodos,
  });

  factory FilteredTodosState.initial() {
    return const FilteredTodosState(filteredTodos: []);
  }

  @override
  List<Object> get props => [filteredTodos];

  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredTodos)';

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'filteredTodos': filteredTodos.map((x) => x.toMap()).toList(),
    };
  }

  factory FilteredTodosState.fromMap(Map<String, dynamic> map) {
    return FilteredTodosState(
      filteredTodos: List<Todo>.from(
        (map['filteredTodos'] as List<dynamic>).map<Todo>(
          (x) => Todo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
