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
}
