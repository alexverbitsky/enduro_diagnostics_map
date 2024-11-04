import 'package:enduro_diagnostics_map/features/diagnostics/data/checklist.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/widgets/diagnostics_item.dart';
import 'package:flutter/material.dart';

class DiagnosticsScreen extends StatefulWidget {
  const DiagnosticsScreen({super.key});

  @override
  State<DiagnosticsScreen> createState() => _DiagnosticsScreenState();
}

class _DiagnosticsScreenState extends State<DiagnosticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Диагностика'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: checklist.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final item = checklist[index];
                    return DiagnosticsItem(
                      title: item,
                      onChanged: (value) {},
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
