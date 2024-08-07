import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/Status.dart';
import 'ConfTree.dart';
import 'VisualConfig.dart';

class MainContent extends ConsumerStatefulWidget {
  const MainContent({super.key});

  @override
  ConsumerState<MainContent> createState() => _MainContentState();
}

class _MainContentState extends ConsumerState<MainContent> {
  @override
  Widget build(BuildContext context) {
    final BasicStatus basicState = ref.watch(basicProvider);
    final HardConfStatus hardConfState = ref.watch(hardConfProvider);
    return Expanded(
        child: Container(
            margin: const EdgeInsets.fromLTRB(10, 25, 10, 20),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            // 布局列
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 文件标题栏
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    // 文件名
                    Expanded(
                        flex: 21,
                        child: Text(
                          hardConfState.fileName,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 150, 150, 150)),
                        ))
                  ],
                ),
                // 控制间隔
                const SizedBox(
                  height: 15,
                ),
                // 主内容区域
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // 顶部对齐
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 配置树组件
                      Expanded(
                        flex: 4,
                        child: ConfTree(),
                      ),
                      // 配置区域
                      Expanded(
                        flex: 10,
                        child: VisualConfig(),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // TODO：文件编码，将会以此编码进行处理，默认utf8打开保存，点击可以设置
                      Text(
                        "编码：${hardConfState.fileEncoding}",
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(150, 150, 150, 150)),
                      ),
                      const SizedBox(width: 20),
                      // 配置类型，首先以后缀名判断
                      Text(
                        "类型：${hardConfState.fileExtension}",
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(150, 150, 150, 150)),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "硬配置优先模式",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(150, 150, 150, 150)),
                      ),
                      const SizedBox(width: 10),
                      // 自动翻译配置项名称
                      TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(50, 10),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.center),
                          onPressed: () => {
                                setState(() {
                                  hardConfState.translation =
                                      !hardConfState.translation;
                                })
                              },
                          child: Text(
                            "自动翻译已${hardConfState.translation ? "启动" : "禁用"}",
                            style: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(150, 150, 150, 150)),
                          )),
                      const SizedBox(width: 10),
                    ]),
              ],
            )));
  }
}
