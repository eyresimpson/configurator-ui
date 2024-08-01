import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/Status.dart';
import 'ConfTree.dart';
import 'VisualConfig.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.fromLTRB(10, 25, 10, 20),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // 阴影，可以考虑，但目前采用扁平化的风格
              // boxShadow: [
              //   BoxShadow(
              //     color: Color.fromARGB(20, 0, 0, 0),
              //     spreadRadius: 5,
              //     blurRadius: 5,
              //   ),
              // ],
            ),
            // 布局列
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 文件标题栏
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    // 文件名
                    Expanded(
                        flex: 21,
                        child: Text(
                          'bootstrap.yml',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 150, 150, 150)),
                        ))
                  ],
                ),
                // 控制间隔
                SizedBox(
                  height: 15,
                ),
                // 主内容区域
                Expanded(
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
                      // Text(
                      //   '内容',
                      //   style: TextStyle(fontSize: 13, color: Colors.grey),
                      // )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 文件名
                      Text(
                        "编码：UTF-8",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(150, 150, 150, 150)),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "类型：Ymal",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(150, 150, 150, 150)),
                      ),
                      SizedBox(width: 20),
                      // Text(
                      //   "未同步到文件",
                      //   style: TextStyle(
                      //       fontSize: 10,
                      //       color: Color.fromARGB(150, 100, 100, 0)),
                      // ),
                      Text(
                        "配置已同步",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(150, 150, 150, 150)),
                      ),
                      SizedBox(width: 10),
                    ]),
              ],
            )));
  }

  loadConfig() {
    print('加载配置');
  }

  jumpWebSite() {
    print('跳转到');
  }

  saveConfig() {
    print('保存配置');
  }

}
