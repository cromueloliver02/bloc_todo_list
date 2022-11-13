part of 'todo_count_bloc.dart';

class TodoCountState extends Equatable {
  final int allCount;
  final int pendingCount;
  final int doneCount;

  const TodoCountState({
    required this.allCount,
    required this.pendingCount,
    required this.doneCount,
  });

  factory TodoCountState.initial() {
    return const TodoCountState(
      allCount: 0,
      pendingCount: 0,
      doneCount: 0,
    );
  }

  @override
  List<Object> get props => [allCount, pendingCount, doneCount];

  @override
  String toString() =>
      'TodoCountState(allCount: $allCount, pendingCount: $pendingCount, doneCount: $doneCount)';

  TodoCountState copyWith({
    int? allCount,
    int? pendingCount,
    int? doneCount,
  }) {
    return TodoCountState(
      allCount: allCount ?? this.allCount,
      pendingCount: pendingCount ?? this.pendingCount,
      doneCount: doneCount ?? this.doneCount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'allCount': allCount});
    result.addAll({'pendingCount': pendingCount});
    result.addAll({'doneCount': doneCount});

    return result;
  }

  factory TodoCountState.fromMap(Map<String, dynamic> map) {
    return TodoCountState(
      allCount: map['allCount']?.toInt() ?? 0,
      pendingCount: map['pendingCount']?.toInt() ?? 0,
      doneCount: map['doneCount']?.toInt() ?? 0,
    );
  }
}
