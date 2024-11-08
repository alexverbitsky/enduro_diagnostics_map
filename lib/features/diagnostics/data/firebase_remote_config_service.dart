import 'dart:convert';

import 'package:enduro_diagnostics_map/features/diagnostics/data/base_firebase_remote_config_service.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService implements BaseFirebaseRemoteConfigService {
  static const diagnosticTasksKey = 'diagnostic_tasks';

  late FirebaseRemoteConfig remoteConfig;

  FirebaseRemoteConfigService() {
    _init();
  }

  Future<void> _init() async {
    remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 24),
    ));
    await remoteConfig.fetchAndActivate();
  }

  @override
  List<String> getDiagnosticTasks() {
    var rawData = remoteConfig.getString(diagnosticTasksKey);
    var map = jsonDecode(rawData);

    return map['items'].cast<String>();
  }
}
