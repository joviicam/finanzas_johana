import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  CameraPosition? _initialPosition;
  Set<Marker> _markers = {};

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    const CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
    );

    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  @override
  void initState() {
    super.initState();
    _determinePosition().then((position) {
      setState(() {
        _initialPosition = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 14.4746,
        );
        _markers.add(Marker(
            markerId: const MarkerId("currentLocation"),
            position: LatLng(position.latitude, position.longitude),
            infoWindow: const InfoWindow(
                title: 'Mi ubicación', snippet: 'Aqui estoy')));
      });
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _initialPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.none,
              initialCameraPosition: _initialPosition!,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _markers,
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }
}

//18.851147069213507, -99.20120692671632

/*


Bearing: Representa la rotación de la cámara en grados en el plano horizontal, similar a una 
brújula. Un valor de 0 apunta al norte, 90 al este, 180 al sur, y 270 al oeste. Esto permite orientar el mapa en diferentes direcciones.

Tilt: Controla el ángulo de inclinación de la cámara en relación con el suelo. Un valor de 0 grados 
significa que la cámara está perpendicular al suelo (vista de arriba hacia abajo), mientras que valores más altos, hasta 90, 
inclinan la vista en perspectiva, proporcionando una vista más "3D".


*/
