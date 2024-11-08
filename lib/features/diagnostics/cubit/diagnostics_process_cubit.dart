import 'package:enduro_diagnostics_map/features/diagnostics/model/diagnistic_task_model.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/repository/base_diagnostics_repository.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/repository/diagnostics_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'diagnostics_process_state.dart';

class DiagnosticsProcessCubit extends Cubit<DiagnosticsProcessState> {
  final BaseDiagnosticsRepository _diagnosticsRepository = GetIt.I<DiagnosticsRepository>();

  DiagnosticsProcessCubit() : super(const DiagnosticsProcessDataLoadingState());

  void loadDiagnosticsTasks() async {
    try {
      final diagnosticsTasks = await _diagnosticsRepository.getDiagnosticsTasks();
      emit(DiagnosticsProcessDataLoadedState(diagnosticsTasks));
    } on Exception {
      emit(const DiagnosticsProcessErrorState());
    }
  }

  void toggleTask(int index, bool isCompleted) {
    final currentState = state;

    if (currentState is DiagnosticsProcessDataLoadedState) {
      final updatedTasks = List<DiagnosticTaskModel>.from(currentState.diagnosticsTasks);

      updatedTasks[index] = DiagnosticTaskModel(
        name: updatedTasks[index].name,
        isCompleted: isCompleted,
      );

      emit(DiagnosticsProcessDataLoadedState(updatedTasks));
    }
  }
}
