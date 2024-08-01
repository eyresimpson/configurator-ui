import 'package:configurator/comps/MainContent.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/Status.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlyoutController menuController = FlyoutController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        // 渐变背景色
        gradient: LinearGradient(
            // 上左到下中
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(250, 255, 255, 255),
              Color.fromARGB(240, 255, 255, 255),
            ]),
      ),
      child: Expanded(child: ,)
    );
  }

  // 主功能按钮
  handle() {
    menuController.showFlyout(
      autoModeConfiguration: FlyoutAutoConfiguration(
        preferredMode: FlyoutPlacementMode.bottomLeft,
      ),
      barrierDismissible: true,
      dismissOnPointerMoveAway: false,
      dismissWithEsc: true,
      navigatorKey: rootNavigatorKey.currentState,
      builder: (context) {
        return MenuFlyout(items: [
          MenuFlyoutItem(
            leading: const Icon(HugeIcons.strokeRoundedAddCircle),
            text: const Text('打开文件'),
            onPressed: () => {loadFile(context), Flyout.of(context).close},
          ),
          MenuFlyoutItem(
              leading: const Icon(HugeIcons.strokeRoundedBook02),
              text: const Text('保存修改'),
              onPressed: () => {
                    saveFile(context),
                    Flyout.of(context).close,
                  }),
          MenuFlyoutItem(
              leading: const Icon(HugeIcons.strokeRoundedRemoveCircle),
              text: const Text('关闭文件'),
              onPressed: () => {
                    closeFile(context),
                    Flyout.of(context).close,
                  }),
          MenuFlyoutItem(
            text: const Text('重载文件'),
            leading: const Icon(HugeIcons.strokeRoundedReload),
            onPressed: Flyout.of(context).close,
          ),
          const MenuFlyoutSeparator(),
          MenuFlyoutSubItem(
            text: const Text('软配置管理'),
            leading: const Icon(HugeIcons.strokeRoundedCode),
            items: (_) => [
              MenuFlyoutItem(
                text: const Text('查看配置'),
                onPressed: Flyout.of(context).close,
                leading: const Icon(HugeIcons.strokeRoundedFingerPrint),
              ),
              MenuFlyoutItem(
                text: const Text('新建配置'),
                onPressed: Flyout.of(context).close,
                leading: const Icon(HugeIcons.strokeRoundedCactus),
              ),
              MenuFlyoutItem(
                text: const Text('修改配置'),
                leading: const Icon(HugeIcons.strokeRoundedFileEuro),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                text: const Text('禁用配置'),
                onPressed: Flyout.of(context).close,
                leading: const Icon(HugeIcons.strokeRoundedCallDisabled),
              ),
              MenuFlyoutItem(
                text: const Text('配置广场'),
                onPressed: Flyout.of(context).close,
                leading: const Icon(HugeIcons.strokeRoundedPlayCircle),
              ),
              MenuFlyoutItem(
                text: const Text('刷新配置'),
                onPressed: Flyout.of(context).close,
                leading: const Icon(HugeIcons.strokeRoundedReload),
              ),
            ],
          ),
        ]);
      },
    );
  }

  loadFile(BuildContext context) async {
    final status = Provider.of<Status>(context, listen: false);
    status.isFileLoaded = true;
    setState(() {});
  }

  closeFile(BuildContext context) async {
    final status = Provider.of<Status>(context, listen: false);
    status.isFileLoaded = false;
    setState(() {});
  }

  saveFile(BuildContext context) async {
    final status = Provider.of<Status>(context, listen: false);
    status.isFileLoaded = true;
  }

  // 跳转到我的网站
  void jumpWebSite(BuildContext context) async {
    await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('跳转到外部页面？'),
        content: const Text(
          '此功能需要通过您的默认浏览器，跳转到开发者网站，是否跳转？',
        ),
        actions: [
          Button(
            child: const Text('确定'),
            onPressed: () async {
              const url = 'http://blog.tineaine.cn';
              await launch(url);
              Navigator.pop(context, 'User open external browser');
            },
          ),
          // 什么都不做
          FilledButton(
            child: const Text('取消'),
            onPressed: () => {Navigator.pop(context, 'User canceled')},
          ),
        ],
      ),
    );
  }

  // 获取使用帮助
  void getHelp(BuildContext context) async {
    await showDialog<String>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('跳转到外部页面？'),
        content: const Text(
          '此功能需要通过您的默认浏览器，跳转到开发者网站，是否跳转？',
        ),
        actions: [
          Button(
            child: const Text('确定'),
            onPressed: () async {
              const url = 'http://blog.tineaine.cn';
              await launch(url);
              Navigator.pop(context, 'User open external browser');
            },
          ),
          // 什么都不做
          FilledButton(
            child: const Text('取消'),
            onPressed: () => {Navigator.pop(context, 'User canceled')},
          ),
        ],
      ),
    );
  }
}
