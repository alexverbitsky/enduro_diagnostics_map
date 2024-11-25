import 'package:enduro_diagnostics_map/features/diagnostics/model/diagnostic_task_model.dart';
import 'package:equatable/equatable.dart';

class ReportModel extends Equatable {
  final int id;
  final String date;
  final String? customerName;
  final String? motorcycleName;
  final String? extraWork;
  final String? mechanicName;
  final List<DiagnosticTaskModel> diagnosticsTasks;

  const ReportModel({
    required this.id,
    required this.date,
    required this.diagnosticsTasks,
    this.customerName,
    this.motorcycleName,
    this.extraWork,
    this.mechanicName,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'customerName': customerName,
      'motorcycleName': motorcycleName,
      'extraWork': extraWork,
      'mechanicName': mechanicName,
      'diagnosticsTasks': diagnosticsTasks.map((task) => task.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        date,
        customerName,
        motorcycleName,
        extraWork,
        mechanicName,
        diagnosticsTasks,
      ];

  @override
  String toString() => 'ReportModel('
      'id: $id, '
      'date: $date, '
      'customerName: $customerName, '
      'motorcycleName: $motorcycleName, '
      'extraWork: $extraWork, '
      'mechanicName: $mechanicName, '
      'diagnosticsTasks: $diagnosticsTasks'
      ')';
}
