// ignore_for_file: prefer_collection_literals

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hcdrs_app/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.satellite;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    final CameraPosition puntoInicial = CameraPosition(
        target: scan
            .getLatLng(), //Extrae la latitud y longitud de la fundion getLatLng que esta en el modelo
        zoom: 19,
        tilt: 50);
    //marcadores
    Set<Marker> markers = Set<Marker>();
    markers.add(Marker(
        markerId: const MarkerId('geo-location'), position: scan.getLatLng()));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: scan.getLatLng(), zoom: 14, tilt: 50)));
              },
              icon: const Icon(Icons.my_location_sharp))
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      //*floatingActionButton: Align(         //CAMBIAR EL TIPO DE MAPA
      //    alignment: Alignment.bottomLeft,
      //    widthFactor: 6,
      //    child: FloatingActionButton(
      //      onPressed: () {
      //       if (mapType == MapType.satellite) {
      //         mapType = MapType.normal;
      //      } else {
      //       mapType = MapType.satellite;
      //     }
      //     setState(() {});
      //   },
      //   child: const Icon(Icons.layers),
      //  ),
      // ),
    );
  }
}
