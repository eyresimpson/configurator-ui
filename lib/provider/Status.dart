import 'package:flutter_riverpod/flutter_riverpod.dart';

final basicProvider = Provider((ref) => BasicStatus());
final hardConfProvider = Provider((ref) => HardConfStatus());
final softConfProvider = Provider((ref) => SoftConfStatus());
final visualDateProvider = Provider((ref) => VisualDate());

// 基础配置
class BasicStatus {
  BasicStatus({
    this.title = "Configurator",
    this.isSaved = true,
    this.opened = false,
    this.hardConfPrimary = true,
  });

  bool opened;
  bool isSaved;
  String title;
  bool hardConfPrimary;
}

class VisualDate {
  // 结构树最深为项目-2，即留出显示的项
  List visualTreeData;

  // 界面中最多显示两层结构，即父项名称和枝叶项配置
  List<VisualPanelDataItem> visualPanelData;

  // 当前项名称，相对于结构树而言，对于可视化视图，实际上是父项的名称
  String currentItem;

  VisualDate({
    this.visualTreeData = const [],
    this.visualPanelData = const [],
    this.currentItem = "根配置",
  });
}

class VisualPanelDataItem {
  // 标签名，即配置项名称
  String label;

  // 配置的值
  dynamic value;

  // 要展现的组件类型
  String type;

  // 当前项最枝叶的子项
  String description;
  List<VisualPanelDataItem> children;

  VisualPanelDataItem({
    this.label = "",
    this.value = "",
    this.type = "",
    this.description = "",
    this.children = const [],
  });
}

// 硬配置
class HardConfStatus {
  bool isSave;
  String filePath;
  String fileName;
  String fileExtension;
  String fileEncoding;
  String connSoftConf;
  Types fileType = Types.unknown;
  bool translation = false;
  dynamic content;

  HardConfStatus({
    this.isSave = false,
    this.filePath = "",
    this.fileName = "",
    this.fileExtension = "",
    this.fileEncoding = "utf-8",
    this.connSoftConf = "",
    fileType = Types.unknown,
  });
}

// 软配置
class SoftConfStatus {
  bool isImported;
  bool isApply;
  String path;
  String name;
  List<HardConfStatus> configList;

  SoftConfStatus({
    this.isImported = false,
    this.isApply = false,
    this.path = "",
    this.name = "",
    this.configList = const [],
  });
}

enum Types {
  yml,
  yaml,
  json,
  xml,
  ini,
  toml,
  unknown,
  nginxConf,
  mysql8Conf,
  redisConf,
  nacosConf
}