import 'package:enduro_diagnostics_map/features/diagnostics/data/base_firebase_firestore_service.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/data/base_firebase_remote_config_service.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/model/diagnostic_task_model.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/model/report_model.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/repository/base_diagnostics_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class DiagnosticsRepository implements BaseDiagnosticsRepository {
  final _firebaseRemoteConfigService = GetIt.I<BaseFirebaseRemoteConfigService>();
  final _firebaseFirestoreService = GetIt.I<BaseFirebaseFirestoreService>();

  @override
  Future<List<DiagnosticTaskModel>> getDiagnosticsTasks() async {
    final diagnosticTasks = _firebaseRemoteConfigService.getDiagnosticTasks();

    return await compute(_mapToTasks, diagnosticTasks);
  }

  List<DiagnosticTaskModel> _mapToTasks(List<String> tasks) {
    return tasks
        .map(
          (task) => DiagnosticTaskModel(
            name: task,
            isCompleted: false,
          ),
        )
        .toList();
  }

  @override
  Future<int> getNewReportId() async {
    final lastId = await _firebaseFirestoreService.getLastReportId();

    print('Last report id: $lastId');

    return lastId + 1;
  }

  @override
  Future<void> submitReport(ReportModel report) {
    return _firebaseFirestoreService.submitReport(report);
  }
}
