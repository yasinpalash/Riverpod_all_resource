import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtest/Core/widgets/custom_text_field.dart';
import 'package:riverpodtest/Features/Home/provider/todo_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(child: CustomTextField(controller: controller)),
                IconButton(onPressed: () {
                  if(controller.text.isNotEmpty){
                    ref.read(todoListProvider.notifier).add(controller.text);
                    controller.clear();
                  }
                }, icon: const Icon(Icons.add)),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
