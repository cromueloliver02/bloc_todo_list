import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isDone;
  final bool isFavorite;
  final bool isArchived;

  const Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
    this.isFavorite = false,
    this.isArchived = false,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      description,
      isDone,
      isFavorite,
      isArchived,
    ];
  }

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, description: $description, isDone: $isDone, isFavorite: $isFavorite, isArchived: $isArchived)';
  }

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isDone,
    bool? isFavorite,
    bool? isArchived,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isFavorite: isFavorite ?? this.isFavorite,
      isArchived: isArchived ?? this.isArchived,
    );
  }
}