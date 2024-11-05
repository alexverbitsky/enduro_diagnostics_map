part of 'diagnostics_process_cubit.dart';

abstract class DiagnosticsProcessState extends Equatable {
  const DiagnosticsProcessState();

  @override
  List<Object> get props => [];
}

class DiagnosticsProcessDataLoadingState extends DiagnosticsProcessState {
  const DiagnosticsProcessDataLoadingState();
}

class DiagnosticsProcessDataLoadedState extends DiagnosticsProcessState {
  final List<String> diagnosticsTasks;

  const DiagnosticsProcessDataLoadedState(this.diagnosticsTasks);

  @override
  List<Object> get props => [diagnosticsTasks];
}

class DiagnosticsProcessErrorState extends DiagnosticsProcessState {
  const DiagnosticsProcessErrorState();
}
