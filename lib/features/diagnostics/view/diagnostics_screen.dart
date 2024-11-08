import 'package:enduro_diagnostics_map/core/ui_kit/app_progress_overlay.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/cubit/diagnostics_process_cubit.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/view/diagnostics_form/diagnostics_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagnosticsScreen extends StatefulWidget {
  const DiagnosticsScreen({super.key});

  @override
  State<DiagnosticsScreen> createState() => _DiagnosticsScreenState();
}

class _DiagnosticsScreenState extends State<DiagnosticsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiagnosticsProcessCubit()..loadDiagnosticsTasks(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Диагностика'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SafeArea(
          child: BlocBuilder<DiagnosticsProcessCubit, DiagnosticsProcessState>(
            builder: (context, state) {
              final cubit = context.read<DiagnosticsProcessCubit>();

              return Stack(
                children: [
                  if (state is DiagnosticsProcessDataLoadedState)
                    DiagnosticsForm(
                      diagnosticsTasks: state.diagnosticsTasks,
                      onTaskToggled: cubit.toggleTask,
                      // TODO: Implement getting initial mechanic name
                      initialMechanicName: null,
                      onCustomerNameChanged: cubit.updateCustomerName,
                      onMotorcycleNameChanged: cubit.updateMotorcycleName,
                      onMechanicNameChanged: cubit.updateMechanicName,
                      onExtraWorkChanged: cubit.updateExtraWork,
                      onSubmit: cubit.submitForm,
                    ),
                  AppProgressOverlay(
                    shouldBeShown: state is! DiagnosticsProcessDataLoadedState,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
