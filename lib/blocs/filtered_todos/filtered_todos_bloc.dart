import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../todo_filter/todo_filter_bloc.dart';
import '../todo_list/todo_list_bloc.dart';

import '../../models/todo.dart';

part 'filtered_todos_event.dart';
part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoListSubscription;
  final TodoFilterBloc todoFilterBloc;
  final TodoListBloc todoListBloc;
  final List<Todo> initialFilteredTodos;

  FilteredTodosBloc({
    required this.todoFilterBloc,
    required this.todoListBloc,
    required this.initialFilteredTodos,
  }) : super(FilteredTodosState(filteredTodos: initialFilteredTodos)) {
    todoFilterSubscription = todoFilterBloc.stream.listen((state) {
      add(SetFilteredTodos());
    });

    on<SetFilteredTodos>(_setFilteredTodos);
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }

  void _setFilteredTodos(
    SetFilteredTodos event,
    Emitter<FilteredTodosState> emit,
  ) {
    final filter = todoFilterBloc.state.filter;
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

    emit(state.copyWith(filteredTodos: filteredTodos));
  }
}