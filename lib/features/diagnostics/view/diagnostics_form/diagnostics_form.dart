import 'package:enduro_diagnostics_map/core/ui_kit/app_elevated_button.dart';
import 'package:enduro_diagnostics_map/core/ui_kit/app_input.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/model/diagnistic_task_model.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/view/diagnostics_form/diagnostics_item.dart';
import 'package:flutter/material.dart';

class DiagnosticsForm extends StatelessWidget {
  final List<DiagnosticTaskModel> diagnosticsTasks;
  final void Function(int index, bool value) onTaskToggled;
  final void Function(String value) onCustomerNameChanged;
  final void Function(String value) onMotorcycleNameChanged;
  final void Function(String value) onMechanicNameChanged;
  final void Function(String value) onExtraWorkChanged;
  final void Function() onSubmit;
  final String? initialMechanicName;

  const DiagnosticsForm({
    required this.diagnosticsTasks,
    required this.onTaskToggled,
    required this.onCustomerNameChanged,
    required this.onMotorcycleNameChanged,
    required this.onMechanicNameChanged,
    required this.onExtraWorkChanged,
    required this.onSubmit,
    this.initialMechanicName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(children: [
        AppInput(
          title: 'Заказчик:',
          hint: 'ФИО',
          onChanged: onCustomerNameChanged,
        ),
        const SizedBox(height: 16),
        AppInput(
          title: 'Мотоцикл:',
          hint: 'Марка, модель, двигатель',
          onChanged: onMotorcycleNameChanged,
        ),
        const SizedBox(height: 16),
        Text('Чек-лист:', style: theme.textTheme.labelLarge),
        const SizedBox(height: 8),
        for (var i = 0; i < diagnosticsTasks.length; i++)
          DiagnosticsItem(
            value: diagnosticsTasks[i],
            onChanged: (value) => onTaskToggled(i, value),
          ),
        const SizedBox(height: 16),
        AppInput(
          title: 'Дополнительные работы:',
          hint: 'Что было сделано',
          maxLines: 2,
          onChanged: onExtraWorkChanged,
        ),
        const SizedBox(height: 16),
        AppInput(
          title: 'Диагностику провел:',
          hint: 'Механик',
          onChanged: onMechanicNameChanged,
          initialValue: initialMechanicName,
        ),
        const SizedBox(height: 24),
        AppElevatedButton(
          title: 'Сохранить и отправить отчет',
          onSubmit: onSubmit,
        ),
      ]),
    );
  }
}
