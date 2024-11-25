import 'package:enduro_diagnostics_map/features/diagnostics/data/base_firebase_firestore_service.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/data/base_firebase_remote_config_service.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/data/firebase_firestore_service.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/data/firebase_remote_config_service.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/repository/base_diagnostics_repository.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/repository/diagnostics_repository.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerSingleton<BaseFirebaseRemoteConfigService>(FirebaseRemoteConfigService());
  GetIt.I.registerSingleton<BaseFirebaseFirestoreService>(FirebaseFirestoreService());
  GetIt.I.registerSingleton<BaseDiagnosticsRepository>(DiagnosticsRepository());
}
