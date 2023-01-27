import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/provider/db_provider.dart';
import 'package:qr_scan/provider/scan_list_provider.dart';
import 'package:qr_scan/screens/screens.dart';
import 'package:qr_scan/widgets/widgets.dart';

import '../provider/ui_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .esborrarTots();
            },
          )
        ],
      ),
      body: _HomeScreenBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    //scanListProvider.nouScan("geo:40.7260888,2.9113035");
    //scanListProvider.nouScan("https://github.com/");

    switch (currentIndex) {
      case 0:
        scanListProvider.carregaScansPerTipus('geo');
        return MapasScreen();

      case 1:
        scanListProvider.carregaScansPerTipus('http');
        return DireccionsScreen();

      default:
        scanListProvider.carregaScansPerTipus('geo');
        return MapasScreen();
    }
  }
}
