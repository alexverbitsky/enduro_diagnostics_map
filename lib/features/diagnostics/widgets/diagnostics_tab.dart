import 'package:flutter/material.dart';

class DiagnosticsTab extends StatelessWidget {
  const DiagnosticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: const Text('Diagnostics Tab'),
      ),
    );
  }
}
