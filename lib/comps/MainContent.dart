import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

import 'ConfTree.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 文件标题栏
                const Row(
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
                        )),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: closeFile,
                            icon: Icon(
                                color: Color.fromARGB(150, 150, 0, 0),
                                size: 13,
                                CupertinoIcons.circle_filled)))
                  ],
                ),
                // 控制间隔
                const SizedBox(
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
                      const Expanded(
                        flex: 4,
                        child: ConfTree(),
                      ),
                      // 配置区域
                      Expanded(
                        flex: 10,
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 250, 250, 250),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 路径导航
                                const Text('基础配置 / 系统管理',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Color.fromARGB(
                                            255, 150, 150, 150))),
                                const SizedBox(height: 10),
                                // 当前配置标题
                                const Text(
                                  "系统管理",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                // 分割线组件（通过边框实现）
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromARGB(
                                                  100, 80, 80, 80),
                                              width: 0.2
                                          )
                                      )
                                  ),
                                ),
                                // 间隔
                                const SizedBox(height: 10),
                                // 当前配置内容
                                const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "系统名称",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromARGB(
                                              255, 150, 150, 150),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                    ])
                              ]),
                        ),
                      )
                      // Text(
                      //   '内容',
                      //   style: TextStyle(fontSize: 13, color: Colors.grey),
                      // )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
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

closeFile() {
  print('关闭文件');
}
