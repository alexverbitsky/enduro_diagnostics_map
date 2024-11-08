class DiagnosticTaskModel {
  final String name;
  final bool isCompleted;

  DiagnosticTaskModel({
    required this.name,
    required this.isCompleted,
  });

  @override
  String toString() => 'DiagnosticTaskModel(name: $name, isCompleted: $isCompleted)';
}
