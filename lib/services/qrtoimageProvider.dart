import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../providers/myQrProvider.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';
class QrToImageProvider extends ChangeNotifier{
  List imageFile= [];


  splitPDF(qrpdf) async {
    imageFile.clear();
    List imageFile2 = [];
    File? pdffile;
    final Directory? tempDir = await getTemporaryDirectory();
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(qrpdf)).load(qrpdf)).buffer.asUint8List();
    Random r = Random();
    pdffile = File('${tempDir!.path}/page_${r.nextInt(1000)}.pdf');;
    await pdffile.writeAsBytes(bytes);
    final pdf = PdfImageRendererPdf(path: pdffile.path);
    await pdf.open();
    int pageCount = await pdf.getPageCount();
    for (int i = 0; i < pageCount; i++) {
      final File outputFile = File('${tempDir.path}/page_${i+r.nextInt(1000)}.png');
      final Uint8List? pageImageBytes = await pdf.renderPage(pageIndex: i,x: 0,
        y: 0, scale: 1,);
      await outputFile.writeAsBytes(pageImageBytes!).then((value) {
        imageFile2.add(value.path);
        notifyListeners();
      });
    }
    imageFile.addAll(imageFile2);

  }
}