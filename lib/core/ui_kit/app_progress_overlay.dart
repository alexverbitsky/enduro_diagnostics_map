import 'package:flutter/material.dart';

class AppProgressOverlay extends StatefulWidget {
  final bool shouldBeShown;

  const AppProgressOverlay({
    required this.shouldBeShown,
    super.key,
  });

  @override
  State<AppProgressOverlay> createState() => _AppProgressOverlayState();
}

class _AppProgressOverlayState extends State<AppProgressOverlay> {
  bool _isVisible = true;
  bool _isOpaque = true;

  @override
  void didUpdateWidget(covariant AppProgressOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shouldBeShown) {
      _showOverlay();
    } else {
      _hideOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isOpaque ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      onEnd: () {
        if (!_isOpaque) {
          setState(() {
            _isVisible = false;
          });
        }
      },
      child: Visibility(
        visible: _isVisible,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showOverlay() {
    setState(() {
      _isVisible = true;
      _isOpaque = true;
    });
  }

  void _hideOverlay() {
    setState(() {
      _isOpaque = false;
    });
  }
}
