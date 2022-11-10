import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/todo.dart';

void showTodoModal(BuildContext ctx, [Todo? todo]) => showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (ctx) => TDLTodoModal(todo: todo),
    );
