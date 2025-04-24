import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtest/Features/Home/data/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoListNotifier extends StateNotifier<List<TodoModel>> {
  TodoListNotifier() : super([]);

  final uuid = const Uuid();

  void add(String title) {
    final todo = TodoModel(id: uuid.v4(), title: title);
    state = [...state, todo];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(isDone: !todo.isDone) else todo
    ];
  }

  void remove(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<TodoModel>>(
        (ref) => TodoListNotifier());
