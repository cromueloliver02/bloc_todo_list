import 'package:flutter/material.dart';
import '../components/components.dart';

void showTodoModal(BuildContext ctx) => showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (ctx) {
        return const TDLTodoModal();
      },
    );
