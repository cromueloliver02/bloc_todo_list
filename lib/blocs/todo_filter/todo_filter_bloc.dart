import 'package:equatable/equatable.dart';
import '../blocs.dart';

part 'todo_filter_event.dart';
part 'todo_filter_state.dart';

class TodoFilterBloc extends HydratedBloc<TodoFilterEvent, TodoFilterState> {
  TodoFilterBloc() : super(TodoFilterState.initial()) {
    on<ChangeFilterEvent>(_changeFilter);
  }

  void _changeFilter(ChangeFilterEvent event, Emitter<TodoFilterState> emit) {
    emit(state.copyWith(filter: event.filter));
  }

  @override
  TodoFilterState? fromJson(Map<String, dynamic> json) {
    return TodoFilterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoFilterState state) {
    return state.toMap();
  }
}
