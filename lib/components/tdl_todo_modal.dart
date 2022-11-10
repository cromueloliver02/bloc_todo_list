import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../blocs/blocs.dart';
import '../models/models.dart';
import 'components.dart';

class TDLTodoModal extends StatefulWidget {
  const TDLTodoModal({super.key});

  @override
  State<TDLTodoModal> createState() => _TDLTodoModalState();
}

class _TDLTodoModalState extends State<TDLTodoModal> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;

  void _save() {
    if (_titleController.text.isEmpty || _descController.text.isEmpty) return;

    const uuid = Uuid();
    final todo = Todo(
      id: uuid.v4(),
      title: _titleController.text,
      description: _descController.text,
    );

    context.read<TodoListBloc>().add(AddTodoEvent(todo: todo));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TDLTextField(
                    controller: _titleController,
                    label: 'Title',
                    prefixIcon: Icons.create,
                    autofocus: true,
                    filled: true,
                  ),
                  const SizedBox(height: 10),
                  TDLTextField(
                    controller: _descController,
                    label: 'Description',
                    prefixIcon: Icons.note_add,
                    maxLines: 5,
                    filled: true,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TDLButton(
                        label: 'Cancel',
                        type: ButtonType.text,
                        onPressed: () => Navigator.pop(context),
                      ),
                      TDLButton(
                        label: 'Save',
                        type: ButtonType.elevated,
                        onPressed: _save,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }
}
