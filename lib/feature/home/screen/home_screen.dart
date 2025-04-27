import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtest/feature/home/model/user_model.dart';
import 'package:riverpodtest/feature/home/service/app_service.dart';


final apiProvider=Provider<ApiService>((ref)=>ApiService());

final userDataProvider = FutureProvider<UserModel>((ref) {
  return ref.read(apiProvider).getUser();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: userData.when(
        data: (userModel) {
          return ListView.builder(
            itemCount: userModel.data?.length ?? 0,
            itemBuilder: (context, index) {
              final user = userModel.data![index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar ?? ''),
                ),
                title: Text(user.firstName ?? ''),
                subtitle: Text(user.email ?? ''),
              );
            },
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


