import 'package:configurator/comps/ConfItem.dart';
import 'package:configurator/func/analysis.dart';
import 'package:configurator/provider/Status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisualConfig extends ConsumerStatefulWidget {
  const VisualConfig({super.key});

  @override
  ConsumerState<VisualConfig> createState() => _VisualConfigState();
}

class _VisualConfigState extends ConsumerState<VisualConfig> {
  @override
  void initState() {
    print('VisualConfig initState');
    // 解析路径中的配置，取根配置
    analysis(ref);
    // 取解析出来的配置

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final VisualDate visualDate = ref.watch(visualDateProvider);
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
            const Text('version',
                style: TextStyle(
                    fontSize: 11, color: Color.fromARGB(255, 150, 150, 150))),
            const SizedBox(height: 10),
            // 当前配置标题
            Text(
              visualDate.currentItem,
              style: const TextStyle(
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
                          color: Color.fromARGB(100, 80, 80, 80), width: 0.2))),
            ),
            // 间隔
            const SizedBox(height: 10),
            // 当前配置内容
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildConfItem(visualDate.visualPanelData))
          ]),
    );
  }

  List<Widget> _buildConfItem(List<VisualPanelDataItem> list) {
    List<Widget> ret = list.map((item) {
      String val;
      if (item.children.isNotEmpty) {
        val = !item.description.isEmpty ? item.description : "{ ... }";
      } else {
        val = item.value.toString();
      }
      return ConfItem(
        label: item.label,
        value: val,
        type: '',
        description: item.description,
      );
    }).toList();
    return ret;
  }
}
