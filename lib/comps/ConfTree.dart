import 'package:configurator/comps/rail_menu_tree/model/menu_tree_state.dart';
import 'package:configurator/comps/rail_menu_tree/model/tree_node.dart';
import 'package:configurator/comps/rail_menu_tree/view/menu.dart';
import 'package:flutter/cupertino.dart';

import 'model/menu_meta.dart';

class ConfTree extends StatefulWidget {
  const ConfTree({super.key});

  @override
  State<ConfTree> createState() => _ConfTreeState();
}

class _ConfTreeState extends State<ConfTree> {
  @override
  Widget build(BuildContext context) {
    // final List<TreeViewItem> items = [
    //   TreeViewItem(
    //     key: const ValueKey('basic'),
    //     content: const Text('基础配置'),
    //     children: [
    //       TreeViewItem(
    //         key: const ValueKey('child1'),
    //         content: const Text('系统管理'),
    //         children: [
    //           TreeViewItem(
    //               key: const ValueKey('grandchild1'), content: const Text('启动')),
    //           TreeViewItem(
    //               key: const ValueKey('grandchild2'), content: const Text('策略')),
    //         ],
    //       ),
    //       TreeViewItem(key: const ValueKey('child2'), content: const Text('应用管理')),
    //       TreeViewItem(
    //         key: const ValueKey('child3'),
    //         content: const Text('网络配置'),
    //         children: [
    //           TreeViewItem(
    //               key: const ValueKey('grandchild1'), content: const Text('地址')),
    //           TreeViewItem(
    //               key: const ValueKey('grandchild2'), content: const Text('端口')),
    //         ],
    //       ),
    //       TreeViewItem(key: const ValueKey('child4'), content: const Text('安全管理')),
    //     ],
    //   ),
    // ];
    // return TreeView(
    //   selectionMode: TreeViewSelectionMode.single,
    //   onSelectionChanged: onSelectionChanged,
    //   items: items,
    // );
    return TolyRailMenuTree(
      meta: MenuTreeMeta(
          expandMenus: [],
          activeMenu: null,
          root: const MenuNode(data: MenuMeta(label: 'sss'))),
      onSelect: (MenuNode value) {},
    );
  }

// Future<void> onSelectionChanged(Iterable<TreeViewItem> item) async {
//   print(item.first.key);
// }
//
// // 构建树
// List<TreeViewItem> makeTreeViewItem(String key, String text) {
//   return [];
// }
//
// // 构建内容表单
// List<dynamic> makeTextBox(String key, String text) {
//   return [];
// }
}