import 'package:enduro_diagnostics_map/features/diagnostics/model/report_model.dart';

abstract interface class BaseFirebaseFirestoreService {
  Future<int> getLastReportId();

  Future<void> submitReport(ReportModel report);
}
