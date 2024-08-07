import 'package:flutter/cupertino.dart';

class VisualConfig extends StatefulWidget {
  const VisualConfig({super.key});



  @override
  State<VisualConfig> createState() => _VisualConfigState();
}


class _VisualConfigState extends State<VisualConfig> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              margin:
              const EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(
                              100, 80, 80, 80),
                          width: 0.2))),
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
                    "sss",
                    // "${status.isFileLoaded}",
                    style: TextStyle(
                      fontSize: 11,
                      color: Color.fromARGB(255, 150, 150, 150),
                    ),
                  ),
                  SizedBox(height: 5),
                ])
          ]),
    );
  }
}
