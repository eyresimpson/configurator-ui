import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';

class Status with ChangeNotifier {
  Status({
    this.isFileLoaded = false,
    this.isFileSaved = false,
    this.isSoftConfLoaded = false,
    this.isSoftConfEnabled = false,
    this.softConfPath = "",
    this.filePath = "",
    this.fileContent = "",
    this.items = const [],
  });

  // 是否已加载文件
  bool isFileLoaded;
  // 是否已保存文件
  bool isFileSaved;
  // 是否已加载软配置
  bool isSoftConfLoaded;
  // 是否已启用软配置
  bool isSoftConfEnabled;
  // 软配置路径
  String softConfPath;
  // 文件路径
  String filePath;
  // 硬配置文件内容
  String fileContent;
  // 配置结构树
  List<TreeViewItem> items;


  void setLoaded(bool value) {
    isFileLoaded = value;
    notifyListeners();
  }

  void setSaved(bool value) {
    isFileSaved = value;
  }
}