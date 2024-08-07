import 'package:configurator/func/file/ini.dart';
import 'package:configurator/func/file/json.dart';
import 'package:configurator/func/file/toml.dart';
import 'package:configurator/func/file/xml.dart';
import 'package:configurator/func/file/ymal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/Status.dart';
import 'file/text.dart';

void analysis(WidgetRef ref) async {
  // 获取基础配置
  final BasicStatus basicState = ref.read(basicProvider);
  // 检查当前优先的是否硬配置
  if (basicState.hardConfPrimary) {
    // 获取硬配置
    final HardConfStatus hardConfState = ref.read(hardConfProvider);
    // 尝试根据文件路径读取文件内容
    switch (hardConfState.fileExtension) {
      case "yml" || "yaml":
        // 读取yaml文件
        analysisYaml(ref);
        break;
      case "json":
        // 读取json文件
        analysisJson(ref);
        break;
      case "xml":
        // 读取xml文件
        analysisXml(ref);
        break;
      case "ini":
        // 读取ini文件
        analysisIni(ref);
        break;
      case "toml":
        // 读取toml文件
        analysisToml(ref);
        break;
      default:
        // 读取文本文件
        conjecture(ref);
        break;
    }
  } else {
    // 获取软配置
    final SoftConfStatus softConfState = ref.read(softConfProvider);
  }
}
