import 'package:equatable/equatable.dart';

import '../blocs.dart';

part 'todo_search_event.dart';
part 'todo_search_state.dart';

class TodoSearchBloc extends HydratedBloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc() : super(TodoSearchState.initial()) {
    on<SearchTodoEvent>(_searchTodo);
  }

  void _searchTodo(SearchTodoEvent event, Emitter<TodoSearchState> emit) {
    final keywords = event.keywords;

    emit(state.copyWith(keywords: keywords));
  }

  @override
  TodoSearchState? fromJson(Map<String, dynamic> json) {
    return TodoSearchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoSearchState state) {
    return state.toMap();
  }
}
