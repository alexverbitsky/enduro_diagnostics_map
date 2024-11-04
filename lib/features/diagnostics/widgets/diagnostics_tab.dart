import 'package:enduro_diagnostics_map/features/diagnostics/widgets/diagnostics_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiagnosticsTab extends StatelessWidget {
  const DiagnosticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: GestureDetector(
            onTap: () {
              // TODO: extract navigation
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DiagnosticsScreen(),
                ),
              );
            },
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              height: 144,
              width: 144,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.add, size: 48, color: Theme.of(context).primaryColor),
                  const SizedBox(height: 8),
                  const Text('Добавить'),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
