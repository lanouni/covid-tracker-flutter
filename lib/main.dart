import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const Maps());

class Maps extends StatefulWidget {
  const Maps ({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Maps> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(33.5836,-7.6425);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  Set<Marker> _createMarker(){
    return<Marker>[
      Marker(
          markerId: MarkerId('home'),
          position:LatLng(33.5836,-7.6425),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Current Location')
      )
    ].toSet();
  }
  Set<Circle> _circles = Set.from([Circle(
      circleId: CircleId('Infection'),
      center: LatLng(33.5836,-7.6425),
      radius: 450,
      fillColor: Colors.pinkAccent.withAlpha(70),
      strokeColor: Colors.pinkAccent
  )]);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          actions: [
            FlatButton.icon(
                onPressed: (){

                },
                icon: Icon(Icons.logout),
                label: Text('Sign out'))
          ],
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          markers: _createMarker(),
          circles: _circles,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14.0,
          ),
        ),
      ),
    );
  }
}


