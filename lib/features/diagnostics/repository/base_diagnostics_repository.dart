import 'package:enduro_diagnostics_map/features/diagnostics/model/diagnistic_task_model.dart';

abstract interface class BaseDiagnosticsRepository {
  Future<List<DiagnosticTaskModel>> getDiagnosticsTasks();
}