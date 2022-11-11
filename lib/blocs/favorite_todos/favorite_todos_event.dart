part of 'favorite_todos_bloc.dart';

abstract class FavoriteTodosEvent extends Equatable {
  const FavoriteTodosEvent();

  @override
  List<Object> get props => [];
}

class SetFavoriteTodos extends FavoriteTodosEvent {}
