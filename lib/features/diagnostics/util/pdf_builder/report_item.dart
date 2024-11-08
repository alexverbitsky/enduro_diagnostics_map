import 'package:pdf/widgets.dart';

class ReportItem extends StatelessWidget {
  final String title;
  final String value;

  ReportItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
        SizedBox(height: 4),
      ],
    );
  }
}
