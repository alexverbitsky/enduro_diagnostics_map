import 'package:equatable/equatable.dart';

class DiagnosticTaskModel extends Equatable {
  final String name;
  final bool isCompleted;

  const DiagnosticTaskModel({
    required this.name,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isCompleted': isCompleted,
    };
  }

  @override
  List<Object> get props => [name, isCompleted];

  @override
  String toString() => 'DiagnosticTaskModel(name: $name, isCompleted: $isCompleted)';
}
