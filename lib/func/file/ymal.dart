import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaml/yaml.dart';

import '../../provider/Status.dart';

void analysisYaml(WidgetRef ref) {
  // 硬配置
  final HardConfStatus hardConfState = ref.read(hardConfProvider);
  final VisualDate visualDate = ref.read(visualDateProvider);
  // 打开目标文件
  File file = File(hardConfState.filePath);
  // 尝试读取配置内容
  String content = file.readAsStringSync();
  // 作为yaml解析
  var doc = loadYaml(content) as YamlMap;
  // 在此处配置一遍
  hardConfState.fileType = Types.yml;
  // 存放到硬配置内容中
  hardConfState.content = doc;
  // 解析树结果
  // 解析基础显示区内容（最外层的数据）
  List<VisualPanelDataItem> list = [];
  doc.forEach((key, value) {
    List<VisualPanelDataItem> children = [];
    if (value is YamlMap) {
      value.forEach((subKey, subValue) {
        VisualPanelDataItem subItem = VisualPanelDataItem(
          label: subKey,
          value: subValue,
          type: "item",
          children: [],
        );
        children.add(subItem);
      });
    }
    VisualPanelDataItem item = VisualPanelDataItem(
      label: key,
      value: value,
      type: "root",
      children: children,
    );
    // 添加到列表中
    list.add(item);
  });
  // 添加到展示面板中
  visualDate.visualPanelData = list;
}
