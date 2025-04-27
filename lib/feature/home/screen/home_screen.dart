import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>(((ref) {
  return Stream.periodic(
      const Duration(seconds: 2), ((computationCount) => computationCount ));
}));

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(streamProvider);

    return Scaffold(
      body: streamValue.when(
        data: (data) {
          return Center(
            child: Text(
              'Stream Value: $data',
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
