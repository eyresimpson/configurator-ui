import 'package:configurator/pages/HomePage.dart';
import 'package:configurator/provider/Status.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

final basicProvider = Provider((ref) => BasicStatus());

final hardConfProvider = Provider((ref) => HardConfStatus());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  windowManager.setMaximizable(false);
  windowManager.setMinimumSize(const Size(800, 650));

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FluentApp(
      title: 'Configurator',
      // 关掉debug的横幅
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(
          ),
      home: HomePage(),
    );
  }
}
