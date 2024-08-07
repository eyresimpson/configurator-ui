// Copyright 2014 The 张风捷特烈 . All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Author:      张风捷特烈
// CreateTime:  2024-05-12
// Contact Me:  1981462002@qq.com

import 'package:flutter/material.dart';

class LineIndicator extends StatelessWidget {
  final double width;
  final double height;
  final double progress;
  final Color? color;

  const LineIndicator({
    super.key,
    this.width = 4,
    required this.progress,
    required this.color,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width + (height - 4) * progress,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          width / 2,
        ),
      ),
    );
  }
}

class VerticalMenuCell extends StatelessWidget {
  final Color? backgroundColor;
  final Widget icon;
  final Widget label;
  final double height;
  final bool showLabel;
  final Axis direction;

  const VerticalMenuCell({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.label,
    this.showLabel = true,
    this.direction = Axis.vertical,
    this.height = 54,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          direction == Axis.vertical ? Alignment.center : Alignment.centerLeft,
      padding: direction == Axis.vertical
          ? null
          : const EdgeInsets.symmetric(horizontal: 12),
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Wrap(
        direction: direction,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: direction == Axis.vertical ? 4 : 12,
        children: [
          icon,
          if (showLabel) label,
        ],
      ),
    );
  }
}
