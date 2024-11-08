part of 'diagnostics_process_cubit.dart';

abstract class DiagnosticsProcessState extends Equatable {
  const DiagnosticsProcessState();

  @override
  List<Object?> get props => [];
}

class DiagnosticsProcessDataLoadingState extends DiagnosticsProcessState {
  const DiagnosticsProcessDataLoadingState();
}

class DiagnosticsProcessDataLoadedState extends DiagnosticsProcessState {
  final List<DiagnosticTaskModel> diagnosticsTasks;
  final String? customerName;
  final String? motorcycleName;
  final String? extraWork;
  final String? mechanicName;
  final String pdfDocumentPath;
  final DiagnosticsProcessStatus status;

  const DiagnosticsProcessDataLoadedState(
    this.diagnosticsTasks, {
    this.customerName,
    this.motorcycleName,
    this.extraWork,
    this.mechanicName,
    this.pdfDocumentPath = '',
    this.status = DiagnosticsProcessStatus.inProgress,
  });

  DiagnosticsProcessDataLoadedState copyWith({
    List<DiagnosticTaskModel>? diagnosticsTasks,
    String? customerName,
    String? motorcycleName,
    String? extraWork,
    String? mechanicName,
    String? pdfDocumentPath,
    DiagnosticsProcessStatus? status,
  }) {
    return DiagnosticsProcessDataLoadedState(
      diagnosticsTasks ?? this.diagnosticsTasks,
      customerName: customerName ?? this.customerName,
      motorcycleName: motorcycleName ?? this.motorcycleName,
      extraWork: extraWork ?? this.extraWork,
      mechanicName: mechanicName ?? this.mechanicName,
      pdfDocumentPath: pdfDocumentPath ?? this.pdfDocumentPath,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        diagnosticsTasks,
        customerName,
        motorcycleName,
        extraWork,
        mechanicName,
        pdfDocumentPath,
        status,
      ];
}

class DiagnosticsProcessErrorState extends DiagnosticsProcessState {
  const DiagnosticsProcessErrorState();
}

enum DiagnosticsProcessStatus {
  inProgress,
  generatingPdf,
  pdfReady,
}
