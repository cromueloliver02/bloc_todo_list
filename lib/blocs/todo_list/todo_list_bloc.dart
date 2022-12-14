import 'package:equatable/equatable.dart';

import '../blocs.dart';
import '../../models/models.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends HydratedBloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    on<AddTodoEvent>(_addTodo);
    on<EditTodoEvent>(_editTodo);
    on<DeleteTodoEvent>(_deleteTodo);
    on<ArchiveTodoEvent>(_archiveTodo);
    on<RestoreTodoEvent>(_restoreTodo);
    on<ToggleDoneTodoEvent>(_toggleDoneTodo);
    on<ToggleFavoriteTodoEvent>(_toggleFavoriteTodo);
  }

  void _addTodo(AddTodoEvent event, Emitter<TodoListState> emit) {
    final todo = Todo(
      id: uuid.v4(),
      title: event.title,
      description: event.desc,
      dateTime: DateTime.now(),
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
    final archivedTodos =
        state.archivedTodos.where((d) => d.id != event.id).toList();

    emit(state.copyWith(
      todos: todos,
      archivedTodos: archivedTodos,
    ));
  }

  void _archiveTodo(ArchiveTodoEvent event, Emitter<TodoListState> emit) {
    final todo = state.todos.firstWhere((d) => d.id == event.id);
    final todos = state.todos.where((d) => d.id != event.id).toList();
    final archivedTodos = [
      todo.copyWith(isArchived: true),
      ...state.archivedTodos
    ];

    emit(state.copyWith(
      todos: todos,
      archivedTodos: archivedTodos,
    ));
  }

  void _restoreTodo(RestoreTodoEvent event, Emitter<TodoListState> emit) {
    final todo = state.archivedTodos.firstWhere((d) => d.id == event.id);
    final todos = [todo.copyWith(isArchived: false), ...state.todos];
    final archivedTodos =
        state.archivedTodos.where((d) => d.id != event.id).toList();

    emit(state.copyWith(
      todos: todos,
      archivedTodos: archivedTodos,
    ));
  }

  void _toggleDoneTodo(
    ToggleDoneTodoEvent event,
    Emitter<TodoListState> emit,
  ) {
    final todos = state.todos.map((d) {
      return d.id == event.id ? d.copyWith(isDone: !d.isDone) : d;
    }).toList();

    emit(state.copyWith(todos: todos));
  }

  void _toggleFavoriteTodo(
    ToggleFavoriteTodoEvent event,
    Emitter<TodoListState> emit,
  ) {
    final todos = state.todos.map((d) {
      return d.id == event.id ? d.copyWith(isFavorite: !d.isFavorite) : d;
    }).toList();

    emit(state.copyWith(todos: todos));
  }

  @override
  TodoListState? fromJson(Map<String, dynamic> json) {
    return TodoListState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoListState state) {
    return state.toMap();
  }
}
