import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../components/components.dart';

void showTodoModal(BuildContext ctx, [Todo? todo]) {
  FocusScope.of(ctx).unfocus();

  showModalBottomSheet(
    context: ctx,
    isScrollControlled: true,
    builder: (ctx) => TDLTodoModal(todo: todo),
  );
}

Future<bool?> showConfirmDialog(
  BuildContext ctx, {
  required String title,
  required String description,
  String cancelText = 'No',
  String oKText = 'Yes',
}) =>
    showDialog<bool>(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TDLButton(
            label: cancelText,
            type: ButtonType.text,
            onPressed: () => Navigator.pop(ctx, false),
          ),
          TDLButton(
            label: oKText,
            type: ButtonType.elevated,
            onPressed: () => Navigator.pop(ctx, true),
          ),
        ],
      ),
    );
