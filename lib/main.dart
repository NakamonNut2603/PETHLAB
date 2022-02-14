/*
This is the source code from internet use to learn about google map api
This isn't one of our application page
Use Android phopne to debug this
*/

import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = <Marker>{};
  final Set<Polyline> _polylines = <Polyline>{};
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  late LocationData currentLocation;
  late LocationData destinationLocation;
  late Location location;
  String googleAPIKey = 'AIzaSyBsu9ooQdRvFSQsn4SM_Ttl2e2CGFDZDlk';

  @override
  void initState() {
    super.initState();
      
    // create an instance of Location
    location = Location();
    polylinePoints = PolylinePoints();
    
    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    location.onLocationChanged.listen((LocationData cLoc) {
        // cLoc contains the lat and long of the
        // current user's position in real time,
        // so we're holding on to it
        currentLocation = cLoc;
        updatePinOnMap();
    });
    // set the initial location
    setInitialLocation();
  }
  void setInitialLocation() async {
    // set the initial location by pulling the user's 
    // current location from the location's getLocation()
    currentLocation = await location.getLocation();
    
    // hard-coded destination for this example
    destinationLocation = LocationData.fromMap({
        "latitude": 13.7738824,
        "longitude": 100.3340543
    });
  }
  void showPinsOnMap() {
    // get a LatLng for the source location
    // from the LocationData currentLocation object
    
    var pinPosition = LatLng(double.parse(currentLocation.latitude.toString()),double.parse(currentLocation.longitude.toString()));
    // get a LatLng out of the LocationData object
    var destPosition = LatLng(double.parse(destinationLocation.latitude.toString()),double.parse(destinationLocation.longitude.toString()));
    // add the initial source location pin
    _markers.add(Marker(
        markerId: const MarkerId('Your Location'),
        position: pinPosition,
        infoWindow: const InfoWindow(title: 'Your Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        ),
    ));
    // destination pin
    _markers.add(Marker(
        markerId: const MarkerId('MANA Pet Hospital'),
        position: destPosition,
        infoWindow: const InfoWindow(title: 'MANA Pet Hospital'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        ),
    ));
    // set the route lines on the map from source to destination
    // for more info follow this tutorial
    setPolylines();
  }
  void setPolylines() async {
    PolylineResult pllr = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(currentLocation.latitude as double, currentLocation.longitude as double),
      PointLatLng(destinationLocation.latitude as double, destinationLocation.longitude as double));
    List<PointLatLng> result = pllr.points;
    if(result.isNotEmpty){
        for (var point in result) {
          polylineCoordinates.add(
              LatLng(point.latitude,point.longitude)
          );
        }
      setState(() {
        _polylines.add(Polyline(
          width: 5, // set the width of the polylines
          polylineId: const PolylineId('poly'),
          color: Colors.red, 
          points: polylineCoordinates
          ));
      });
    }
  }
  void updatePinOnMap() async {
    
    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    CameraPosition cPosition = CameraPosition(
    zoom: 15.0,
    tilt: 0,
    bearing: 0,
    target: LatLng(currentLocation.latitude as double, currentLocation.longitude as double),
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    setState(() {
        // updated position
        var pinPosition = LatLng(currentLocation.latitude as double, currentLocation.longitude as double);
        
        // the trick is to remove the marker (by id)
        // and add it again at the updated location
        _markers.removeWhere(
        (m) => m.markerId.value == 'Your Location');
        _markers.add(Marker(
          markerId: const MarkerId('Your Location'),
          position: pinPosition, // updated position
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueViolet,
          ),
        ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
        ],
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  const CameraPosition(target: LatLng(13.7738824,100.3340543), zoom: 12),
        markers: _markers,
        polylines: _polylines,
        onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            // my map has completed being created;
            // i'm ready to show the pins on the map
            showPinsOnMap();
        }
      ),
    );
  }
}

// Marker manaMarker = Marker(
//   markerId: const MarkerId('MANA Pet Hospital'),
//   position: const LatLng(13.7738824, 100.3340543),
//   infoWindow: const InfoWindow(title: 'MANA Pet Hospital'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );