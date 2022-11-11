part of 'favorite_todos_bloc.dart';

class FavoriteTodosState extends Equatable {
  final List<Todo> favoriteTodos;

  const FavoriteTodosState({
    required this.favoriteTodos,
  });

  factory FavoriteTodosState.initial() {
    return const FavoriteTodosState(favoriteTodos: []);
  }

  @override
  List<Object> get props => [favoriteTodos];

  @override
  String toString() => 'FavoriteTodosState(favoriteTodos: $favoriteTodos)';

  FavoriteTodosState copyWith({
    List<Todo>? favoriteTodos,
  }) {
    return FavoriteTodosState(
      favoriteTodos: favoriteTodos ?? this.favoriteTodos,
    );
  }
}
