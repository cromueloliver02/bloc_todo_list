import 'dart:async';

import 'package:equatable/equatable.dart';
import '../blocs.dart';

import '../../models/todo.dart';

part 'filtered_todos_event.dart';
part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoSearchSubscription;
  late final StreamSubscription todoListSubscription;
  final TodoFilterBloc todoFilterBloc;
  final TodoSearchBloc todoSearchBloc;
  final TodoListBloc todoListBloc;
  final List<Todo> initialFilteredTodos;

  FilteredTodosBloc({
    required this.todoFilterBloc,
    required this.todoSearchBloc,
    required this.todoListBloc,
    required this.initialFilteredTodos,
  }) : super(FilteredTodosState(filteredTodos: initialFilteredTodos)) {
    todoFilterSubscription = todoFilterBloc.stream.listen((state) {
      add(SetFilteredTodos());
    });

    todoSearchSubscription = todoSearchBloc.stream.listen((state) {
      add(SetFilteredTodos());
    });

    todoListSubscription = todoListBloc.stream.listen((state) {
      add(SetFilteredTodos());
    });

    on<SetFilteredTodos>(_setFilteredTodos);
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }

  void _setFilteredTodos(
    SetFilteredTodos event,
    Emitter<FilteredTodosState> emit,
  ) {
    final filter = todoFilterBloc.state.filter;
    final keywords = todoSearchBloc.state.keywords;
    final todos = todoListBloc.state.todos;
    List<Todo> filteredTodos = [];

    switch (filter) {
      case Filter.pending:
        filteredTodos = todos.where((d) => !d.isDone).toList();
        break;
      case Filter.done:
        filteredTodos = todos.where((d) => d.isDone).toList();
        break;
      case Filter.all:
      default:
        filteredTodos = todos;
    }

    if (keywords.isNotEmpty) {
      filteredTodos = todos
          .where((d) =>
              d.title.toLowerCase().contains(keywords) ||
              d.description.toLowerCase().contains(keywords))
          .toList();
    }

    emit(state.copyWith(filteredTodos: filteredTodos));
  }
}
