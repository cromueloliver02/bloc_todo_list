// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_search_event.dart';
part 'todo_search_state.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc() : super(TodoSearchState.initial()) {
    on<SearchTodoEvent>(_searchTodo);
  }

  void _searchTodo(SearchTodoEvent event, Emitter<TodoSearchState> emit) {
    final keywords = event.keywords;

    emit(state.copyWith(keywords: keywords));
  }
}
