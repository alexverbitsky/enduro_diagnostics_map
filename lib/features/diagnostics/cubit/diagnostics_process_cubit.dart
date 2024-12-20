import 'package:enduro_diagnostics_map/features/diagnostics/model/diagnostic_task_model.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/model/report_model.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/repository/base_diagnostics_repository.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/util/pdf_builder/pdf_builder.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

part 'diagnostics_process_state.dart';

class DiagnosticsProcessCubit extends Cubit<DiagnosticsProcessState> {
  final BaseDiagnosticsRepository _diagnosticsRepository = GetIt.I<BaseDiagnosticsRepository>();

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

  Future<void> submitForm() async {
    final currentState = state;

    if (currentState is DiagnosticsProcessDataLoadedState) {
      emit(
        currentState.copyWith(
          status: DiagnosticsProcessStatus.generatingPdf,
        ),
      );

      final now = DateTime.now();
      final formattedDate = DateFormat('dd.MM.yyyy, HH:mm').format(now);

      final id = await _diagnosticsRepository.getNewReportId();

      final report = ReportModel(
        id: id,
        date: formattedDate,
        diagnosticsTasks: currentState.diagnosticsTasks,
        customerName: currentState.customerName,
        motorcycleName: currentState.motorcycleName,
        extraWork: currentState.extraWork,
        mechanicName: currentState.mechanicName,
      );

      await _diagnosticsRepository.submitReport(report);

      final pdfPath = await generatePdf(report);

      emit(
        currentState.copyWith(
          pdfDocumentPath: pdfPath,
          status: DiagnosticsProcessStatus.pdfReady,
        ),
      );
    }
  }
}
