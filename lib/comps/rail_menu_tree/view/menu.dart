import 'package:flutter/material.dart';

import '../../model/display_meta.dart';
import '../drag_change_width.dart';
import '../model/menu_tree_state.dart';
import '../model/tree_node.dart';
import 'menu_item_view.dart';
import 'menu_theme.dart';
import 'toly_ui_tree_menu_cell.dart';

class TolyRailMenuTree extends StatelessWidget {
  final double width;
  final double maxWidth;
  final bool enableWidthChange;

  final Widget? leading;
  final Widget? tail;

  final MenuTreeMeta meta;

  final Color? backgroundColor;
  final Color? expandBackgroundColor;
  final MenuTreeCellStyle? cellStyle;

  final ValueChanged<MenuNode> onSelect;
  final MenuTreeCellBuilder? builder;
  final AnimationConfig animationConfig;

  const TolyRailMenuTree({
    super.key,
    required this.meta,
    this.backgroundColor,
    this.leading,
    this.tail,
    this.expandBackgroundColor,
    this.enableWidthChange = false,
    this.animationConfig = const AnimationConfig(),
    required this.onSelect,
    this.builder,
    this.cellStyle,
    this.width = 240,
    this.maxWidth = 360,
  });

  Widget _defaultMenuTreeCellBuilder(MenuNode node, DisplayMeta display) {
    return TolyUITreeMenuCell(
      menuNode: node,
      display: display,
      style: cellStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    TolyMenuTheme? tolyMenuTheme = Theme.of(context).extension<TolyMenuTheme>();
    MenuTreeCellBuilder effectBuilder = builder ?? _defaultMenuTreeCellBuilder;
    Widget child = ColoredBox(
      color: backgroundColor ??
          tolyMenuTheme?.backgroundColor ??
          Colors.transparent,
      child: ListView.builder(
        itemCount: meta.items.length,
        itemBuilder: (_, index) => MenuNodeItemView(
          builder: effectBuilder,
          onSelect: onSelect,
          data: meta.items[index],
          activeMenu: meta.activeMenu?.id,
          expandMenus: meta.expandMenus,
          expandBackgroundColor: expandBackgroundColor ??
              tolyMenuTheme?.expandBackgroundColor ??
              Colors.transparent,
          animationConfig: animationConfig,
        ),
      ),
    );

    if (leading != null || tail != null) {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leading != null) leading!,
          Expanded(child: child),
          if (tail != null) tail!,
        ],
      );
    }

    if (enableWidthChange) {
      child = ChangeWidthArea(
        width: width,
        range: RangeValues(width, maxWidth),
        child: child,
      );
    } else {
      child = SizedBox(
        width: width,
        child: child,
        // child: const Placeholder(),
      );
    }
    return child;
  }
}

class AnimationConfig {
  final AnimTickType type;
  final Duration duration;
  final Curve curve;

  bool get enable => type != AnimTickType.none;

  const AnimationConfig({
    this.type = AnimTickType.select,
    this.duration = const Duration(milliseconds: 360),
    this.curve = Curves.ease,
  });
}

enum AnimTickType { none, select, hove }
