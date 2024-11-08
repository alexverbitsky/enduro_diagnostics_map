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

  const DiagnosticsProcessDataLoadedState(
    this.diagnosticsTasks, {
    this.customerName,
    this.motorcycleName,
    this.extraWork,
    this.mechanicName,
  });

  DiagnosticsProcessDataLoadedState copyWith({
    List<DiagnosticTaskModel>? diagnosticsTasks,
    String? customerName,
    String? motorcycleName,
    String? extraWork,
    String? mechanicName,
  }) {
    return DiagnosticsProcessDataLoadedState(
      diagnosticsTasks ?? this.diagnosticsTasks,
      customerName: customerName ?? this.customerName,
      motorcycleName: motorcycleName ?? this.motorcycleName,
      extraWork: extraWork ?? this.extraWork,
      mechanicName: mechanicName ?? this.mechanicName,
    );
  }

  @override
  List<Object?> get props => [
        diagnosticsTasks,
        customerName,
        motorcycleName,
        extraWork,
        mechanicName,
      ];
}

class DiagnosticsProcessErrorState extends DiagnosticsProcessState {
  const DiagnosticsProcessErrorState();
}
