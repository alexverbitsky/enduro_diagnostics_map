import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String title;
  final String hint;
  final int maxLines;
  final String? initialValue;
  final Function(String value) onChanged;

  const AppInput({
    required this.title,
    required this.hint,
    required this.onChanged,
    this.initialValue,
    this.maxLines = 1,
    super.key,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.labelLarge),
        TextField(
          controller: _controller,
          decoration: InputDecoration.collapsed(
            hintText: widget.hint,
          ),
          cursorColor: Theme.of(context).primaryColor,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
