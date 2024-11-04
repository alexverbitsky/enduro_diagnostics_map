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

  final WidgetStateProperty<Icon?> thumbIcon = WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

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
            const SizedBox(width: 16),
            Switch(
              thumbIcon: thumbIcon,
              activeColor: Colors.green,
              activeTrackColor: Theme.of(context).scaffoldBackgroundColor,
              inactiveTrackColor: Theme.of(context).scaffoldBackgroundColor,
              value: _selected,
              onChanged: (_) => toggle(),
            ),
          ],
        ),
      ),
    );
  }
}
