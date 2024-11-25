import 'package:enduro_diagnostics_map/features/diagnostics/model/diagnostic_task_model.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/model/report_model.dart';

abstract interface class BaseDiagnosticsRepository {
  Future<List<DiagnosticTaskModel>> getDiagnosticsTasks();

  Future<int> getNewReportId();

  Future<void> submitReport(ReportModel report);
}