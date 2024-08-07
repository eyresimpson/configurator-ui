import 'package:configurator/provider/Status.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../comps/MainContent.dart';
import '../main.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BasicStatus basicState = ref.watch(basicProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        // 渐变背景色
        gradient: LinearGradient(
            // 上左到下中
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(230, 255, 255, 255),
              Color.fromARGB(245, 255, 255, 255),
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
                  Expanded(
                    flex: 4,
                    child: Text(
                      basicState.title,
                      style: const TextStyle(
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 帮助
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: TextButton(
                                onPressed: () => getHelp(context),
                                child: const Text(
                                  '帮助',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 100, 100, 255),
                                    // fontFamily: 'Arial',
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: TextButton(
                                // style: ButtonStyle(),
                                onPressed: () => jumpWebSite(context),
                                child: const Text(
                                  '文档',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 100, 100, 255),
                                  ),
                                ),
                              ),
                            ),
                            // 操作
                            // FlyoutTarget(
                            //   key: GlobalKey(),
                            //   controller: _flyoutController,
                            //   child:
                            TextButton(
                              style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromARGB(255, 100, 100, 255)),
                                    foregroundColor: WidgetStatePropertyAll(
                                        Color.fromARGB(255, 135, 132, 132))),
                                onPressed: handle(ref),
                                child: const Text(
                                  '操作',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              // ),
                            ),
                          ]))
                ],
              ),
            ),
          ),
          // 主区域
          Expanded(
              flex: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  !basicState.fileOpend
                      ? const MainContent()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const Icon(
                                // color: Colors.grey,
                                // shadows: [
                                //   Shadow(
                                //       blurRadius: 10,
                                //       offset: Offset(0, 0),
                                //       color: Color.fromARGB(255, 150, 150, 150))
                                // ],
                                HugeIcons.strokeRoundedGithub,
                                // Icons.file_present_rounded,
                                size: 75,
                                color: Color.fromARGB(255, 150, 150, 150),
                              ),
                            ),
                            const Text(
                              'Configurator',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "moji",
                                color: Color.fromARGB(255, 150, 150, 150),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: const Text(
                                'Look at the stars, Look how they shine for you.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 150, 150, 150),
                                ),
                              ),
                            ),
                          ],
                        )
                ],
              )),
        ],
      ),
    );
  }

  // 主功能按钮
  handle(WidgetRef ref) {
    // _flyoutController.showFlyout(
    //   autoModeConfiguration: FlyoutAutoConfiguration(
    //     preferredMode: FlyoutPlacementMode.bottomLeft,
    //   ),
    //   barrierDismissible: true,
    //   dismissOnPointerMoveAway: false,
    //   dismissWithEsc: true,
    //   navigatorKey: rootNavigatorKey.currentState,
    //   builder: (context) {
    //     return MenuFlyout(items: [
    //       MenuFlyoutItem(
    //         leading: const Icon(HugeIcons.strokeRoundedFileAdd),
    //         text: const Text('打开文件'),
    //         onPressed: () => {loadFile(context, ref), Flyout.of(context).close},
    //       ),
    //       MenuFlyoutItem(
    //           leading: const Icon(HugeIcons.strokeRoundedFileDownload),
    //           text: const Text('保存修改'),
    //           onPressed: () => {
    //                 saveFile(context),
    //                 Flyout.of(context).close,
    //               }),
    //       MenuFlyoutItem(
    //           leading: const Icon(HugeIcons.strokeRoundedFileRemove),
    //           text: const Text('关闭文件'),
    //           onPressed: () => {
    //                 closeFile(context, ref),
    //                 Flyout.of(context).close,
    //               }),
    //       MenuFlyoutItem(
    //         text: const Text('状态重载'),
    //         leading: const Icon(HugeIcons.strokeRoundedReload),
    //         onPressed: Flyout.of(context).close,
    //       ),
    //       const MenuFlyoutSeparator(),
    //       MenuFlyoutSubItem(
    //         text: const Text('软配置'),
    //         leading: const Icon(HugeIcons.strokeRoundedFileScript),
    //         items: (_) => [
    //           MenuFlyoutItem(
    //             text: const Text('打开配置'),
    //             onPressed: Flyout.of(context).close,
    //             leading: const Icon(HugeIcons.strokeRoundedFileImport),
    //           ),
    //           MenuFlyoutItem(
    //             text: const Text('查看配置'),
    //             onPressed: Flyout.of(context).close,
    //             leading: const Icon(HugeIcons.strokeRoundedFileView),
    //           ),
    //           MenuFlyoutItem(
    //             text: const Text('禁用配置'),
    //             onPressed: Flyout.of(context).close,
    //             leading: const Icon(HugeIcons.strokeRoundedFileLocked),
    //           ),
    //           MenuFlyoutItem(
    //             text: const Text('刷新配置'),
    //             onPressed: Flyout.of(context).close,
    //             leading: const Icon(HugeIcons.strokeRoundedFileSync),
    //           ),
    //           MenuFlyoutItem(
    //             text: const Text('配置广场'),
    //             onPressed: Flyout.of(context).close,
    //             leading: const Icon(HugeIcons.strokeRoundedCloud),
    //           ),
    //         ],
    //       ),
    //     ]);
    //   },
    // );
  }

  // 打开文件操作
  loadFile(BuildContext context, WidgetRef ref) async {
    print("object");
    final HardConfStatus hardConfState = ref.watch(hardConfProvider);
    final BasicStatus basicState = ref.watch(basicProvider);
    // 打开文件对话框
    String path = '';
    const xType = XTypeGroup(
        label: '配置文件',
        extensions: ['yml', 'txt', '', 'xml', 'json', 'ini', 'yaml', 'toml']);
    final XFile? file = await openFile(acceptedTypeGroups: [xType]);
    // final status = Provider.of<Status>(context, listen: false);
    if (file != null) {
      path = file.path;
      print(file.name);
      // 设置文件路径
      hardConfState.filePath = path;
      hardConfState.fileName = file.name;
      hardConfState.fileType = file.mimeType!;
      basicState.fileOpend = true;
    }
  }

  closeFile(BuildContext context, WidgetRef ref) async {
    final HardConfStatus hardConfState = ref.watch(hardConfProvider);
    final BasicStatus basicState = ref.watch(basicProvider);
    hardConfState.filePath = '';
    basicState.fileOpend = false;
  }

  saveFile(BuildContext context) async {
    // final status = Provider.of<Status>(context, listen: false);
    // status.isFileLoaded = true;
  }

  // 跳转到我的网站
  void jumpWebSite(BuildContext context) async {
    // await showDialog<String>(
    //   context: context,
    //   builder: (context) => ContentDialog(
    //     title: const Text('跳转到外部文档页面？'),
    //     content: const Text(
    //       '此功能需要通过您的默认浏览器，跳转到开发者网站，是否跳转？',
    //     ),
    //     actions: [
    //       Button(
    //         child: const Text('确定'),
    //         onPressed: () async {
    //           const url = 'http://blog.tineaine.cn';
    //           await launch(url);
    //           Navigator.pop(context, 'User open external browser');
    //         },
    //       ),
    //       // 什么都不做
    //       FilledButton(
    //         child: const Text('取消'),
    //         onPressed: () => {Navigator.pop(context, 'User canceled')},
    //       ),
    //     ],
    //   ),
    // );
  }

  // 获取使用帮助
  void getHelp(BuildContext context) async {
    // await showDialog<String>(
    //   context: context,
    //   builder: (context) => ContentDialog(
    //     title: const Text('跳转到外部帮助页面？'),
    //     content: const Text(
    //       '此功能需要通过您的默认浏览器，跳转到开发者网站，是否跳转？',
    //     ),
    //     actions: [
    //       Button(
    //         child: const Text('确定'),
    //         onPressed: () async {
    //           const url = 'http://blog.tineaine.cn';
    //           await launch(url);
    //           Navigator.pop(context, 'User open external browser');
    //         },
    //       ),
    //       // 什么都不做
    //       FilledButton(
    //         child: const Text('取消'),
    //         onPressed: () => {Navigator.pop(context, 'User canceled')},
    //       ),
    //     ],
    //   ),
    // );
  }
}
