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

  void updateCustomerName(String customerName) {
    final currentState = state;

    if (currentState is DiagnosticsProcessDataLoadedState) {
      emit(currentState.copyWith(customerName: customerName));
    }
  }

  void updateMotorcycleName(String motorcycleName) {
    final currentState = state;

    if (currentState is DiagnosticsProcessDataLoadedState) {
      emit(currentState.copyWith(motorcycleName: motorcycleName));
    }
  }

  void updateExtraWork(String extraWork) {
    final currentState = state;

    if (currentState is DiagnosticsProcessDataLoadedState) {
      emit(currentState.copyWith(extraWork: extraWork));
    }
  }

  void updateMechanicName(String mechanicName) {
    final currentState = state;

    if (currentState is DiagnosticsProcessDataLoadedState) {
      emit(currentState.copyWith(mechanicName: mechanicName));
    }
  }

  // TODO: Implement conversion to pdf
  void submitForm() {
    print('Form submitted');

    final currentState = state;

    if (currentState is DiagnosticsProcessDataLoadedState) {
      print('Customer name: ${currentState.customerName}');
      print('Motorcycle name: ${currentState.motorcycleName}');
      print('Extra work: ${currentState.extraWork}');
      print('Mechanic name: ${currentState.mechanicName}');
      print('Tasks: ${currentState.diagnosticsTasks}');
    }
  }
}
