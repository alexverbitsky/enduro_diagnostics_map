import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class CheckListTable extends StatelessWidget {
  final List<TableRow> items;

  CheckListTable({required this.items});

  @override
  Widget build(Context context) {
    return Table(
      columnWidths: {
        0: const FlexColumnWidth(3),
        1: const FlexColumnWidth(1),
      },
      children: [
        TableRow(
          repeat: true,
          decoration: const BoxDecoration(
            border: TableBorder(
              bottom: BorderSide(width: 1, color: PdfColors.black),
            ),
          ),
          children: [
            Text('Работа', style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            Text('Статус', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        ...items,
      ],
    );
  }
}
