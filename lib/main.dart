import 'package:configurator/pages/HomePage.dart';
import 'package:configurator/provider/Status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

final basicProvider = Provider((ref) => BasicStatus());

final hardConfProvider = Provider((ref) => HardConfStatus());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.setMaximizable(false);
  await windowManager.setMinimumSize(const Size(800, 650));

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Configurator',
      // 关掉debug的横幅
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const Scaffold(
        backgroundColor: Color.fromARGB(150, 200, 200, 200),
        body: HomePage(),
      ),
    );
  }
}
