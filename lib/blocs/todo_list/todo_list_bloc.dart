// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:uuid/uuid.dart';

import '../../models/models.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    on<AddTodoEvent>(_addTodo);
    on<EditTodoEvent>(_editTodo);
    on<DeleteTodoEvent>(_deleteTodo);
    on<ToggleArchiveTodoEvent>(_toggleArchiveTodo);
  }

  void _addTodo(AddTodoEvent event, Emitter<TodoListState> emit) {
    final todo = Todo(
      id: uuid.v4(),
      title: event.title,
      description: event.desc,
    );
    final todos = [todo, ...state.todos];

    emit(state.copyWith(todos: todos));
  }

  void _editTodo(EditTodoEvent event, Emitter<TodoListState> emit) {
    final todos = state.todos.map((d) {
      if (d.id != event.id) return d;

      return d.copyWith(title: event.title, description: event.desc);
    }).toList();

    emit(state.copyWith(todos: todos));
  }

  void _deleteTodo(DeleteTodoEvent event, Emitter<TodoListState> emit) {
    final todos = state.todos.where((d) => d.id != event.id).toList();

    emit(state.copyWith(todos: todos));
  }

  void _toggleArchiveTodo(
      ToggleArchiveTodoEvent event, Emitter<TodoListState> emit) {
    final todos = state.todos.map((d) {
      if (d.id != event.id) return d;

      return d.copyWith(isArchived: !d.isArchived);
    }).toList();

    emit(state.copyWith(todos: todos));
  }
}
