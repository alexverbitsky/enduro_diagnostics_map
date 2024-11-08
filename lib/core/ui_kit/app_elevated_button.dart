import 'package:enduro_diagnostics_map/core/ui_kit/animations/animated_pushing.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String title;
  final void Function() onSubmit;

  const AppElevatedButton({
    required this.title,
    required this.onSubmit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedPushing(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 56),
          backgroundColor: Colors.black.withOpacity(0.3),
          enableFeedback: false,
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: onSubmit,
        child: Text(
          title,
          style: theme.textTheme.labelLarge?.copyWith(color: theme.primaryColor),
        ),
      ),
    );
  }
}
