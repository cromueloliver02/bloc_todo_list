part of 'tab_bloc.dart';

class TabState extends Equatable {
  final int index;

  const TabState({
    required this.index,
  });

  factory TabState.initial() {
    return const TabState(index: 0);
  }

  @override
  List<Object> get props => [index];

  @override
  String toString() => 'TabState(index: $index)';

  TabState copyWith({
    int? index,
  }) {
    return TabState(
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': index,
    };
  }

  factory TabState.fromMap(Map<String, dynamic> map) {
    return TabState(
      index: map['index'] as int,
    );
  }
}
