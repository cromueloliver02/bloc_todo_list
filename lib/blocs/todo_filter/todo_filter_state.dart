part of 'todo_filter_bloc.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  const TodoFilterState({
    required this.filter,
  });

  factory TodoFilterState.initial() {
    return const TodoFilterState(filter: Filter.all);
  }

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'TodoFilterState(filter: $filter)';

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'filter': filter.name,
    };
  }

  factory TodoFilterState.fromMap(Map<String, dynamic> map) {
    return TodoFilterState(
      filter:
          Filter.values.firstWhere((d) => d.name == map['filter']) as dynamic,
    );
  }
}

enum Filter { all, pending, done }
