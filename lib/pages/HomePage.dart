import 'package:configurator/provider/Status.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../comps/MainContent.dart';

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
                            // 打开/关闭按钮
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: TextButton(
                                onPressed: () => handleFile(context, ref),
                                child: Text(
                                  !basicState.opened ? 'Open' : "Close",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 100, 100, 255),
                                  ),
                                ),
                              ),
                            ),
                            // 软配置操作按钮
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: TextButton(
                                // style: ButtonStyle(),
                                onPressed: () => handleImportSoftConf(ref),
                                child: const Text(
                                  'Import',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 100, 100, 255),
                                  ),
                                ),
                              ),
                            ),
                            // 保存按钮
                            TextButton(
                              style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Color.fromARGB(255, 100, 100, 255)),
                                  foregroundColor: WidgetStatePropertyAll(
                                      Color.fromARGB(255, 135, 132, 132))),
                              onPressed: handleSave(ref),
                              child: const Text(
                                'Save',
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
                  basicState.opened
                      ? const MainContent()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const Icon(
                                HugeIcons.strokeRoundedGithub,
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
                                'Look at the stars, Look how they shine for you',
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

  // 保存操作
  handleSave(WidgetRef ref) {}

  // 导入导出软配置
  handleImportSoftConf(WidgetRef ref) async {
    final HardConfStatus hardConfState = ref.watch(hardConfProvider);
    final BasicStatus basicState = ref.watch(basicProvider);
    // 检查当前文件状态
    if (basicState.opened) {
      // 检查文件是否保存
      if (!hardConfState.isSave) {
        // TODO：提示用户未保存文件
      }
      // 文件已打开，执行文件关闭操作并清理掉文件信息
      hardConfState.filePath = '';
      hardConfState.content = null;
      basicState.opened = false;
      setState(() {});
      return;
    }
    // 打开文件对话框
    const xType = XTypeGroup(label: 'CO软配置文件', extensions: ['sc']);
    final XFile? file = await openFile(acceptedTypeGroups: [xType]);
    if (file != null) {
      // 设置文件路径
      hardConfState.filePath = file.path;
      hardConfState.fileName = file.name;
      // 尝试获取文件后缀名，注意这个不一定成功
      final fileType = file.name.split('.').last;
      hardConfState.fileExtension = fileType;
      basicState.opened = true;
      setState(() {});
    }
  }

  // 硬配置操作
  handleFile(BuildContext context, WidgetRef ref) async {
    final HardConfStatus hardConfState = ref.watch(hardConfProvider);
    final BasicStatus basicState = ref.watch(basicProvider);
    // 检查当前文件状态
    if (basicState.opened) {
      // 检查文件是否保存
      if (!hardConfState.isSave) {
        // TODO：提示用户未保存文件
      }
      // 文件已打开，执行文件关闭操作并清理掉文件信息
      hardConfState.filePath = '';
      basicState.opened = false;
      setState(() {});
      return;
    }
    // 打开文件对话框
    const xType = XTypeGroup(
        label: '配置文件',
        extensions: ['yml', 'txt', '*', 'xml', 'json', 'ini', 'yaml', 'toml']);
    final XFile? file = await openFile(acceptedTypeGroups: [xType]);
    if (file != null) {
      // 设置文件路径
      hardConfState.filePath = file.path;
      // 设置文件名称
      hardConfState.fileName = file.name;
      // 默认就是utf8
      hardConfState.fileEncoding = "utf-8";
      // 尝试获取文件后缀名，注意这个不一定成功，如果没有后缀名，可能获取的是错误的
      final fileType = file.name.split('.').last;
      hardConfState.fileExtension = fileType;
      // 默认硬配置优先
      basicState.hardConfPrimary = true;
      basicState.opened = true;
      setState(() {});
    }
  }
}
