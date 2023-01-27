import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  late GoogleMapController inicio;

  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  bool mapa = false;
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition _puntInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 14.4746,
      tilt: 50,
    );

    Set<Marker> markers = new Set<Marker>();
    markers.add(
      new Marker(
        markerId: MarkerId('id1'),
        position: scan.getLatLng(),
      ),
    );

    MapType cambioMapa() {
      if (mapa)
        return MapType.terrain;
      else
        return MapType.normal;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.center_focus_strong_outlined),
            onPressed: () {
              inicio.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: _puntInicial.target, zoom: 15)));
            },
          )
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: cambioMapa(),
        markers: markers,
        initialCameraPosition: _puntInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          inicio = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.terrain),
        foregroundColor: Colors.amber,
        onPressed: () {
          if (mapa)
            mapa = false;
          else
            mapa = true;

          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
