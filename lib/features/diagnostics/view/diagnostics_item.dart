import 'package:flutter/material.dart';

class DiagnosticsItem extends StatefulWidget {
  final String title;
  final Function(bool) onChanged;

  const DiagnosticsItem({
    required this.title,
    required this.onChanged,
    super.key,
  });

  @override
  State<DiagnosticsItem> createState() => _DiagnosticsItemState();
}

class _DiagnosticsItemState extends State<DiagnosticsItem> {
  bool _selected = false;

  void toggle() {
    setState(() {
      _selected = !_selected;
      widget.onChanged(_selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.title,
                maxLines: 10,
              ),
            ),
            const SizedBox(width: 24),
            AnimatedCrossFade(
              firstChild: const Icon(
                Icons.check,
                color: Colors.green,
                size: 36,
              ),
              secondChild: const Icon(
                Icons.close,
                color: Colors.red,
                size: 36,
              ),
              crossFadeState: _selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 200),
            ),
          ],
        ),
      ),
    );
  }
}
