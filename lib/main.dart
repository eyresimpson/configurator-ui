import 'package:configurator/pages/HomePage.dart';
import 'package:configurator/provider/Status.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  windowManager.setMaximizable(false);
  windowManager.setMinimumSize(const Size(800, 650));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Status()),
    ],
    child: const MyApp(),
  ));
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
          ),
      home: const HomePage(),
    );
  }
}
