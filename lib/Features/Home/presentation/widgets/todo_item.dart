import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtest/Features/Home/data/models/todo_model.dart';
import 'package:riverpodtest/Features/Home/provider/todo_provider.dart';

class TodoItem extends ConsumerWidget {
  final TodoModel todo;
  const TodoItem(  this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration:
              todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      leading: Checkbox(
          value: todo.isDone,
          onChanged: (_) =>
              ref.read(todoListProvider.notifier).toggle(todo.id)),
      trailing: IconButton(
          onPressed: () {
            ref.read(todoListProvider.notifier).remove(todo.id);
          },
          icon: const Icon(Icons.delete)),
    );
  }
}
