import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:covid_stats/Themes/palette.dart';

import 'package:flutter/material.dart';

class PdfScreen extends StatelessWidget {
  final String asset;
  PdfScreen({
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Double tap to Zoom in & Zoom out"),
      ),
      body: FutureBuilder<PDFDocument>(
          future: PDFDocument.fromAsset(asset),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return PDFViewer(
                  indicatorBackground: Colors.black,
                  zoomSteps: 2,
                  pickerButtonColor: Palette.kPrimaryColor,
                  showNavigation: true,
                  maxScale: 5,
                  showIndicator: false,
                  document: (snapshot.data)!);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
