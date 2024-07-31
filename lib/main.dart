import 'package:configurator/pages/HomePage.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  windowManager.setResizable(false);
  windowManager.setMaximizable(false);
  windowManager.setSize(const Size(800, 650));
  windowManager.setMinimumSize(const Size(800, 650));
  windowManager.setMaximumSize(const Size(800, 650));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Configurator',
      // 关掉debug的横幅
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(
          // // accentColor:  AccentColor(),
          // inactiveColor: Color.fromARGB(255, 255, 255, 255),
          // scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          // inactiveBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          // acrylicBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          // micaBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          // cardColor: Color.fromARGB(255, 255, 255, 255),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}
