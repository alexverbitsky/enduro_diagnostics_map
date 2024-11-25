import 'dart:io';

import 'package:enduro_diagnostics_map/features/diagnostics/model/report_model.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/util/pdf_builder/check_list_table.dart';
import 'package:enduro_diagnostics_map/features/diagnostics/util/pdf_builder/report_item.dart';
import 'package:enduro_diagnostics_map/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<String> generatePdf(ReportModel report) async {
  final pdf = Document();
  final nunitoRegularFont = await PdfGoogleFonts.nunitoRegular();
  final nunitoBoldFont = await PdfGoogleFonts.nunitoBold();

  final logoImage = await _getImageFileFromAssets(Assets.images.enduroServiceLogo.path);
  final logoWidget = MemoryImage(logoImage.readAsBytesSync());

  final successCheckmarkImage = await _getImageFileFromAssets(Assets.images.success.path);
  final successCheckmarkWidget = MemoryImage(successCheckmarkImage.readAsBytesSync());

  final failureCheckmarkImage = await _getImageFileFromAssets(Assets.images.error.path);
  final failureCheckmarkWidget = MemoryImage(failureCheckmarkImage.readAsBytesSync());

  final customerName = report.customerName;
  final motorcycleName = report.motorcycleName;
  final extraWork = report.extraWork;
  final mechanicName = report.mechanicName;
  final diagnosticsTasks = report.diagnosticsTasks;

  pdf.addPage(
    MultiPage(
      pageTheme: PageTheme(
        pageFormat: PdfPageFormat.a4,
        theme: ThemeData.withFont(base: nunitoRegularFont, bold: nunitoBoldFont),
      ),
      build: (Context context) {
        return [
          Align(
            alignment: Alignment.center,
            child: Image(logoWidget, width: 150),
          ),
          SizedBox(height: 48),
          ReportItem(
            title: 'Дата отчета: ',
            value: report.date,
          ),
          if (customerName != null)
            ReportItem(
              title: 'Клиент: ',
              value: customerName,
            ),
          if (motorcycleName != null)
            ReportItem(
              title: 'Мотоцикл: ',
              value: motorcycleName,
            ),
          SizedBox(height: 24),
          CheckListTable(
            items: diagnosticsTasks
                .map(
                  (task) => _getTableRow(
                    task.name,
                    task.isCompleted ? successCheckmarkWidget : failureCheckmarkWidget,
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 24),
          if (mechanicName != null)
            ReportItem(
              title: 'Механик: ',
              value: mechanicName,
            ),
          if (extraWork != null)
            ReportItem(
              title: 'Дополнительные работы: ',
              value: extraWork,
            ),
        ];
      },
    ),
  );

  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/diagnostics_report.pdf');
  final bytes = await compute(_getPdfBytes, pdf);
  await file.writeAsBytes(bytes);

  return file.path;
}

TableRow _getTableRow(String title, MemoryImage image) {
  return TableRow(
    verticalAlignment: TableCellVerticalAlignment.middle,
    decoration: const BoxDecoration(
      border: TableBorder(
        bottom: BorderSide(width: .5, color: PdfColors.grey),
      ),
    ),
    children: [
      Padding(
        padding: const EdgeInsets.all(4),
        child: Text(title),
      ),
      Spacer(),
      Padding(
        padding: const EdgeInsets.all(4),
        child: Image(
          image,
          width: 16,
          height: 16,
        ),
      ),
    ],
  );
}

Future<File> _getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load(path);

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.create(recursive: true);
  await file.writeAsBytes(byteData.buffer.asUint8List(
    byteData.offsetInBytes,
    byteData.lengthInBytes,
  ));

  return file;
}

Future<Uint8List> _getPdfBytes(Document pdf) async {
  final bytes = await pdf.save();

  return bytes;
}
