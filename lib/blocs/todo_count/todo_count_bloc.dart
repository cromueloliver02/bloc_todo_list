import 'dart:async';

import 'package:equatable/equatable.dart';

import '../blocs.dart';

part 'todo_count_event.dart';
part 'todo_count_state.dart';

class TodoCountBloc extends HydratedBloc<TodoCountEvent, TodoCountState> {
  late final StreamSubscription _todoListSubscription;
  final TodoListBloc todoListBloc;
  final int initialAllCount;
  final int initialPendingCount;
  final int initialDoneCount;

  TodoCountBloc({
    required this.todoListBloc,
    required this.initialAllCount,
    required this.initialPendingCount,
    required this.initialDoneCount,
  }) : super(TodoCountState(
          allCount: initialAllCount,
          pendingCount: initialPendingCount,
          doneCount: initialDoneCount,
        )) {
    _todoListSubscription =
        todoListBloc.stream.listen((state) => add(SetTodoCountsEvent()));

    on<SetTodoCountsEvent>(_setTodoCounts);
  }

  @override
  Future<void> close() {
    _todoListSubscription.cancel();
    return super.close();
  }

  void _setTodoCounts(
    SetTodoCountsEvent event,
    Emitter<TodoCountState> emit,
  ) {
    final allCount = todoListBloc.state.todos.length;
    final pendingCount =
        todoListBloc.state.todos.where((d) => !d.isDone).length;
    final doneCount = todoListBloc.state.todos.where((d) => d.isDone).length;

    emit(state.copyWith(
      allCount: allCount,
      pendingCount: pendingCount,
      doneCount: doneCount,
    ));
  }

  @override
  TodoCountState? fromJson(Map<String, dynamic> json) {
    return TodoCountState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoCountState state) {
    return state.toMap();
  }
}
