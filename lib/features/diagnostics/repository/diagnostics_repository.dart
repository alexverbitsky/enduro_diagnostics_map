import 'package:enduro_diagnostics_map/features/diagnostics/data/base_firebase_remote_config_service.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/model/diagnistic_task_model.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/repository/base_diagnostics_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class DiagnosticsRepository implements BaseDiagnosticsRepository {
  final _firebaseRemoteConfigService = GetIt.I<BaseFirebaseRemoteConfigService>();

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
}
