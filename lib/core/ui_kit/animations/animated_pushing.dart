import 'package:flutter/material.dart';

class AnimatedPushing extends StatefulWidget {
  final Widget child;

  const AnimatedPushing({required this.child, super.key});

  @override
  AnimatedPushingState createState() => AnimatedPushingState();
}

class AnimatedPushingState extends State<AnimatedPushing> with SingleTickerProviderStateMixin {
  double _scale = 1;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        _onPointerDown();
      },
      onPointerUp: (_) {
        _onPointerUp();
      },
      child: AnimatedScale(
        scale: _scale,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        child: widget.child,
      ),
    );
  }

  void _onPointerDown() {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onPointerUp() {
    setState(() {
      _scale = 1;
    });
  }
}
