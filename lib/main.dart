import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/provider/scan_list_provider.dart';
import 'package:qr_scan/provider/ui_provider.dart';
import 'package:qr_scan/screens/home_screen.dart';
import 'package:qr_scan/screens/mapa_screen.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'mapa': (_) => MapaScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: Colors.deepPurple,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
