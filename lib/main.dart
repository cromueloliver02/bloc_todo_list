import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import './todo_list_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final path = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: path);

  runApp(TodoListApp());
}
