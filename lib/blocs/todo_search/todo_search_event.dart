part of 'todo_search_bloc.dart';

abstract class TodoSearchEvent extends Equatable {
  const TodoSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchTodoEvent extends TodoSearchEvent {
  final String keywords;

  const SearchTodoEvent({
    required this.keywords,
  });

  @override
  List<Object> get props => [keywords];
}
