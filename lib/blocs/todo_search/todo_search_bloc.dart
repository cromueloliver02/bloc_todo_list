import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../blocs.dart';

part 'todo_search_event.dart';
part 'todo_search_state.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc() : super(TodoSearchState.initial()) {
    on<SearchTodoEvent>(
      _searchTodo,
      transformer: debounce(const Duration(milliseconds: 1500)),
    );
  }

  EventTransformer<SetSearchTermEvent> debounce<SetSearchTermEvent>(
    Duration duration,
  ) =>
      (events, mapper) {
        return events.debounceTime(duration).flatMap(mapper);
      };

  void _searchTodo(SearchTodoEvent event, Emitter<TodoSearchState> emit) {
    final keywords = event.keywords;

    emit(state.copyWith(keywords: keywords));
  }
}
