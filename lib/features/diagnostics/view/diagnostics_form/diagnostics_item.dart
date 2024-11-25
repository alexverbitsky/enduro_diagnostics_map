import 'package:enduro_diagnostics_map/features/diagnostics/model/diagnostic_task_model.dart';
import 'package:flutter/material.dart';

class DiagnosticsItem extends StatelessWidget {
  final DiagnosticTaskModel value;
  final Function(bool) onChanged;

  const DiagnosticsItem({
    required this.value,
    required this.onChanged,
    super.key,
  });

  void toggle() {
    onChanged(!value.isCompleted);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black.withOpacity(0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                value.name,
                maxLines: 10,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(width: 24),
            AnimatedCrossFade(
              firstChild: const Icon(
                Icons.check,
                color: Colors.green,
                size: 24,
              ),
              secondChild: const Icon(
                Icons.close,
                color: Colors.red,
                size: 24,
              ),
              crossFadeState:
                  value.isCompleted ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 200),
            ),
          ],
        ),
      ),
    );
  }
}
