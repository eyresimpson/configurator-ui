import 'dart:ui';

import 'package:configurator/comps/MainContent.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 顶栏
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Logo
                  const Expanded(
                    flex: 4,
                    child: Text(
                      'Configurator',
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: "moji",
                        color: Color.fromARGB(255, 100, 100, 255),
                      ),
                    ),
                  ),
                  // 占位
                  Expanded(flex: 4, child: Container()),
                  // 操作区域
                  Expanded(
                      flex: 4,
                      // 操作行
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 帮助
                            Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: HyperlinkButton(
                                    // style: ButtonStyle(),
                                    onPressed: () => getHelp(context),
                                    child: const Text(
                                      'Help',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 100, 100, 255),
                                        // fontFamily: 'Arial',
                                      ),
                                    ),
                                  ),
                                )),

                            // Blog
                            Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  child: HyperlinkButton(
                                    // style: ButtonStyle(),
                                    onPressed: () => jumpWebSite(context),
                                    child: const Text(
                                      'Blog',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 100, 100, 255),
                                      ),
                                    ),
                                  ),
                                )),
                            // 操作
                            Expanded(
                              flex: 2,
                              child: FlyoutTarget(
                                  controller: menuController,
                                  child: FilledButton(
                                    style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Color.fromARGB(255, 100, 100, 255)),
                                        foregroundColor: WidgetStatePropertyAll(
                                            Color.fromARGB(
                                                255, 135, 132, 132))),
                                    onPressed: handle,
                                    child: const Text(
                                      'Handle',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  )),
                            ),
                          ]))
                ],
              ),
            ),
          ),
          // 主区域
          const Expanded(
              flex: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // 这个列是提示用，如果未加载配置就显示
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: <Widget>[
                  //     Container(
                  //       margin: const EdgeInsets.only(bottom: 10),
                  //       child: const Icon(
                  //         // color: Colors.grey,
                  //         shadows: [
                  //           Shadow(
                  //             blurRadius: 10,
                  //             offset: Offset(0, 0),
                  //             color: Colors.grey,
                  //           )
                  //         ],
                  //         Icons.file_present_rounded,
                  //         size: 75,
                  //       ),
                  //     ),
                  //     const Text(
                  //       'Configurator',
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontFamily: "moji",
                  //         // color: Colors.grey,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: const EdgeInsets.only(top: 15),
                  //       child: const Text(
                  //         'Click the Load button to load the configuration file',
                  //         style: TextStyle(
                  //           fontSize: 12,
                  //           color: Colors.grey,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // 主配置区域，在这个区域里对配置文件进行修改
                  MainContent(),
                ],
              )),
          // 底栏
          const Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Noah Jones Open source project',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 150, 150, 150),
                        fontFamily: 'moji'),
                  ),
                  Text(
                    'July 30, 2024; Version 1.0.0 Release',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color.fromARGB(255, 150, 150, 150),
                    ),
                  ),
                ],
              ))
        ],
      ),
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
            leading: const Icon(FluentIcons.circle_addition_solid),
            text: const Text('打开文件'),
            onPressed: Flyout.of(context).close,
          ),
          MenuFlyoutItem(
            leading: const Icon(FluentIcons.save),
            text: const Text('保存修改'),
            onPressed: Flyout.of(context).close,
          ),
          MenuFlyoutItem(
            leading: const Icon(FluentIcons.blocked12),
            text: const Text('关闭文件'),
            onPressed: Flyout.of(context).close,
          ),
          MenuFlyoutItem(
            text: const Text('重载文件'),
            leading: const Icon(FluentIcons.analytics_report),
            onPressed: Flyout.of(context).close,
          ),
          const MenuFlyoutSeparator(),
          MenuFlyoutSubItem(
            text: const Text('软配置管理'),
            leading: const Icon(FluentIcons.file_code),
            // onPressed: Flyout.of(context).close,
            items: (_) => [
              MenuFlyoutItem(
                text: const Text('查看配置'),
                onPressed: Flyout.of(context).close,
                leading: const Icon(FluentIcons.see_do),
              ),
              MenuFlyoutItem(
                text: const Text('新建配置'),
                onPressed: Flyout.of(context).close,
                leading: const Icon(FluentIcons.edit_create),
              ),
              MenuFlyoutItem(
                text: const Text('修改配置'),
                leading: const Icon(FluentIcons.code_edit),
                onPressed: () {},
              ),
              MenuFlyoutItem(
                text: const Text('禁用配置'),
                onPressed: Flyout.of(context).close,
                leading: const Icon(FluentIcons.event_declined),
              ),
              MenuFlyoutItem(
                text: const Text('配置广场'),
                onPressed: Flyout.of(context).close,
                leading: const Icon(FluentIcons.express_route_circuits),
              ),
              MenuFlyoutItem(
                text: const Text('刷新配置'),
                onPressed: Flyout.of(context).close,
                leading: const Icon(FluentIcons.refresh),
              ),
            ],
          ),
        ]);
      },
    );
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
