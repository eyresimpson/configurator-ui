import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfItem extends ConsumerStatefulWidget {
  ConfItem({
    super.key,
    required this.label,
    required this.value,
    required this.type,
    // 描述，可以为空
    this.description = "",
  });

  String label;
  dynamic value;
  String type;
  String description;

  @override
  ConsumerState<ConfItem> createState() => _ConfitemState();
}

class _ConfitemState extends ConsumerState<ConfItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 配置标题
            Text(
              "${widget.label} :",
              // "${status.isFileLoaded}",
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 100, 100, 100),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              widget.value,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 150, 150, 150),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
