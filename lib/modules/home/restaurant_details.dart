import 'dart:async';
import 'package:finanzas_johana/modules/home/entities/restaurant.dart';
import 'package:finanzas_johana/widgets/home/list_comments_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({
    super.key,
    required this.restaurant,
  });
  final Restaurant restaurant;

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late CameraPosition _initialPosition;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    _initialPosition = CameraPosition(
      target: LatLng(widget.restaurant.latitud, widget.restaurant.longitud),
      zoom: 15.0,
    );

    _markers.add(
      Marker(
        markerId: MarkerId(widget.restaurant.name),
        position: LatLng(widget.restaurant.latitud, widget.restaurant.longitud),
        infoWindow: InfoWindow(
          title: widget.restaurant.name,
          snippet: 'Ubicación del restaurante',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre del restaurante: ${widget.restaurant.name}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Descripción: ${widget.restaurant.description}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Rating: ', style: TextStyle(fontSize: 20)),
                StarRating(
                  rating: widget.restaurant.rating / widget.restaurant.count,
                  starCount: 5,
                  size: 20,
                  color: Colors.amber,
                  borderColor: Colors.grey,
                ),
              ],
            ),
            const Divider(),
            const Text('Comentarios:', style: TextStyle(fontSize: 20)),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: widget.restaurant.comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListCommentsData(restaurant: widget.restaurant);
                },
              ),
            ),
            const Divider(),
            const Text('Ubicación del restaurante',
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _initialPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: _markers,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Imágenes del restaurante:',
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: widget.restaurant.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.network(
                      widget.restaurant.images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
