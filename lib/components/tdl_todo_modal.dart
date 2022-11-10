import 'package:flutter/material.dart';
import 'components.dart';

class TDLTodoModal extends StatelessWidget {
  const TDLTodoModal({super.key});

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
                  const TDLTextField(
                    label: 'Title',
                    prefixIcon: Icons.create,
                    autofocus: true,
                    filled: true,
                  ),
                  const SizedBox(height: 10),
                  const TDLTextField(
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
                        onPressed: () {},
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
}
