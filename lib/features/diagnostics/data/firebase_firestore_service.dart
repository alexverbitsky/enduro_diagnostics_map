import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/data/base_firebase_firestore_service.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/model/report_model.dart';

class FirebaseFirestoreService implements BaseFirebaseFirestoreService {
  static const reportsCollectionKey = 'reports';
  static const lastReportIdKey = 'lastReportId';

  late final FirebaseFirestore _firestore;

  FirebaseFirestoreService() {
    _init();
  }

  Future<void> _init() async {
    _firestore = FirebaseFirestore.instance;
  }

  @override
  Future<int> getLastReportId() async {
    final db = _firestore.collection(reportsCollectionKey).doc(lastReportIdKey);

    final document = await db.get();
    final hasKey = document.data()?.containsKey('value') ?? false;

    if (!hasKey) {
      return -1;
    }

    final id = document.data()?['value'];

    return id ?? -1;
  }

  @override
  Future<void> submitReport(ReportModel report) async {
    await _firestore.collection(reportsCollectionKey).doc().set(report.toJson());
    await _firestore
        .collection(reportsCollectionKey)
        .doc(lastReportIdKey)
        .set({'value': report.id});
  }
}
