part of 'todo_search_bloc.dart';

class TodoSearchState extends Equatable {
  final String keywords;

  const TodoSearchState({
    required this.keywords,
  });

  factory TodoSearchState.initial() {
    return const TodoSearchState(keywords: '');
  }

  @override
  List<Object> get props => [keywords];

  @override
  String toString() => 'TodoSearchState(keywords: $keywords)';

  TodoSearchState copyWith({
    String? keywords,
  }) {
    return TodoSearchState(
      keywords: keywords ?? this.keywords,
    );
  }
}
