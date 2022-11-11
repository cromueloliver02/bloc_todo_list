import 'dart:async';
import 'package:equatable/equatable.dart';
import '../blocs.dart';

import '../../models/todo.dart';

part 'favorite_todos_event.dart';
part 'favorite_todos_state.dart';

class FavoriteTodosBloc
    extends HydratedBloc<FavoriteTodosEvent, FavoriteTodosState> {
  late final StreamSubscription todoListSubscription;
  final TodoListBloc todoListBloc;
  final List<Todo> initialFavoriteTodos;

  FavoriteTodosBloc({
    required this.todoListBloc,
    required this.initialFavoriteTodos,
  }) : super(FavoriteTodosState(favoriteTodos: initialFavoriteTodos)) {
    todoListSubscription =
        todoListBloc.stream.listen((state) => add(SetFavoriteTodos()));

    on<SetFavoriteTodos>(_setFavoriteTodos);
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }

  void _setFavoriteTodos(
    SetFavoriteTodos event,
    Emitter<FavoriteTodosState> emit,
  ) {
    final favoriteTodos =
        todoListBloc.state.todos.where((d) => d.isFavorite).toList();

    emit(state.copyWith(favoriteTodos: favoriteTodos));
  }

  @override
  FavoriteTodosState? fromJson(Map<String, dynamic> json) {
    return FavoriteTodosState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(FavoriteTodosState state) {
    return state.toMap();
  }
}
