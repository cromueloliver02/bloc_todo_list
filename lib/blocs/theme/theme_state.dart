part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool isDark;

  const ThemeState({
    required this.isDark,
  });

  factory ThemeState.initial() {
    return const ThemeState(isDark: false);
  }

  @override
  List<Object> get props => [isDark];

  @override
  String toString() => 'ThemeState(isDark: $isDark)';

  ThemeState copyWith({
    bool? isDark,
  }) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
    );
  }
}
