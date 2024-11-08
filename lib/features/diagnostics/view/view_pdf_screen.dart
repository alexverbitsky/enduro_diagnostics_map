import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ViewPdfScreen extends StatelessWidget {
  final String pdfUrl;

  const ViewPdfScreen({
    required this.pdfUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: PDFView(
          filePath: pdfUrl,
          pageFling: false,
        ),
      ),
    );
  }
}
