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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'favoriteTodos': favoriteTodos.map((x) => x.toMap()).toList(),
    };
  }

  factory FavoriteTodosState.fromMap(Map<String, dynamic> map) {
    return FavoriteTodosState(
      favoriteTodos: List<Todo>.from(
        (map['favoriteTodos'] as List<dynamic>).map<Todo>(
          (x) => Todo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
