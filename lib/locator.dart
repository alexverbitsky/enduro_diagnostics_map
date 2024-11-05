import 'package:enduro_diagnostics_map/features/diagnostics/repository/diagnostics_repository.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerSingleton<DiagnosticsRepository>(DiagnosticsRepository());
}
