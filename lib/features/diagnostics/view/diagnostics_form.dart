import 'package:enduro_diagnostics_map/features/diagnostics/view/diagnostics_item.dart';
import 'package:flutter/material.dart';

class DiagnosticsForm extends StatelessWidget {
  final List<String> diagnosticsTasks;
  final Function(int index, bool value) onTaskToggled;

  const DiagnosticsForm({
    required this.diagnosticsTasks,
    required this.onTaskToggled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: diagnosticsTasks.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final item = diagnosticsTasks[index];
                return DiagnosticsItem(
                  title: item,
                  onChanged: (value) {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
