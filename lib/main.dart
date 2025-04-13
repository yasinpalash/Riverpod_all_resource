import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return "Hello Yasin";
});
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
//CosumerWidget is a widget that can read a provider and rebuild when the provider changes.
// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name=ref.watch(nameProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Riverpod Provider"),
//       ),
//       body:  Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               name,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Consumer is a widget that can read a provider and rebuild when the provider changes.
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Riverpod Provider"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//          Consumer(builder: (context,ref,child){
//            final name=ref.watch(nameProvider);
//            return Text(
//              name,
//            );
//       } )
//           ],
//         ),
//       ),
//     );
//   }
// }


//ConsumerStatefulWidget is a widget that can read a provider and rebuild when the provider changes.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
             name,
            ),
          ],
        ),
      ),
    );
  }
}


