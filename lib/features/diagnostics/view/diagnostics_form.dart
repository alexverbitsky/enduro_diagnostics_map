import 'package:enduro_diagnostics_map/features/diagnostics/model/diagnistic_task_model.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/view/diagnostics_item.dart';
import 'package:flutter/material.dart';

class DiagnosticsForm extends StatelessWidget {
  final List<DiagnosticTaskModel> diagnosticsTasks;
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
      child: ListView(
        children: [
          const Text('Заказчик:'),
          const TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'ФИО',
            ),
          ),
          const SizedBox(height: 16),
          const Text('Мотоцикл:'),
          const TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Марка, модель, двигатель',
            ),
          ),
          const SizedBox(height: 16),
          const Text('Диагностику провел:'),
          const TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Механик',
            ),
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < diagnosticsTasks.length; i++)
            DiagnosticsItem(
              value: diagnosticsTasks[i],
              onChanged: (value) => onTaskToggled(i, value),
            ),
        ]
      ),
    );
  }
}
