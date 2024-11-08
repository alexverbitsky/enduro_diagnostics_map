import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_plus/share_plus.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share),
            onPressed: () => Share.shareXFiles([XFile(pdfUrl)]),
          ),
        ],
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
