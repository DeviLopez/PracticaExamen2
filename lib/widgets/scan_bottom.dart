import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/provider/db_provider.dart';
import 'package:qr_scan/provider/scan_list_provider.dart';
import 'package:qr_scan/utils/utils.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () async {
        // String barcodeScanRes = 'geo:39.7260888,2.9113035';
        // String barcodeScanRes = 'https://paucasesnovescifp.cat/';
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#00FFFF', 'Cancel·lar', false, ScanMode.QR);

        ScanModel nouScan = ScanModel(valor: barcodeScanRes);
        scanListProvider.nouScan(barcodeScanRes);
        launchUrl(context, nouScan);
      },
    );
  }
}
