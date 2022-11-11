import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

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
  String toString() =>
      'TodoListState(id: $id, title: $title, description: $description, isDone: $isDone, isFavorite: $isFavorite, isArchived: $isArchived)';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'isFavorite': isFavorite,
      'isArchived': isArchived,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] as bool,
      isFavorite: map['isFavorite'] as bool,
      isArchived: map['isArchived'] as bool,
    );
  }
}
