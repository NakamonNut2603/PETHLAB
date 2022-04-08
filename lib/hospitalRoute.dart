// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pethlab/hospital.dart';

class HospitalRoute extends StatefulWidget {
  const HospitalRoute({Key? key}) : super(key: key);

  @override
  State<HospitalRoute> createState() => HospitalRouteState();
}

class HospitalRouteState extends State<HospitalRoute> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = <Marker>{};
  final Set<Polyline> _polylines = <Polyline>{};
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  late LocationData currentLocation;
  late BitmapDescriptor currentMarker;
  late BitmapDescriptor hospitalMarker;
  late Location location;
  late Hospital hospital;
  String googleAPIKey = 'AIzaSyBsu9ooQdRvFSQsn4SM_Ttl2e2CGFDZDlk';

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      location = Location();
      polylinePoints = PolylinePoints();
      setInitialLocation();
    });
  }
  Future<void> setInitialLocation() async {
    LocationData cLoc = await location.getLocation();
    setState(() {
      currentLocation = cLoc;
    });
    createMarkerIcon();
  }
  Future<void> createMarkerIcon() async {
    BitmapDescriptor cMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        "assets/person.png",
    );
    BitmapDescriptor hMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        "assets/hospital.png",
    );
    setState(() {
      currentMarker = cMarker;
      hospitalMarker = hMarker;
    });
    showPinsOnMap();
  }
  void showPinsOnMap() {
    double cLat = double.parse(currentLocation.latitude.toString());
    double cLong = double.parse(currentLocation.longitude.toString());
    double hLat = double.parse(hospital.lat);
    double hLong = double.parse(hospital.long);
    var pinPosition = LatLng(cLat, cLong);
    var destPosition = LatLng(hLat, hLong);
    Set<Marker> new_marker = <Marker>{};
    new_marker.add(Marker(
      markerId: const MarkerId('Your Location'),
      position: pinPosition,
      infoWindow: const InfoWindow(title: 'Your Location'),
      icon: currentMarker
    ));
    new_marker.add(Marker(
      markerId: MarkerId(hospital.name),
      position: destPosition,
      infoWindow: InfoWindow(title: hospital.name),
      icon: hospitalMarker
    ));
    setState(() {
      _markers = new_marker;
    });
    setPolylines();
  }
  Future<void> setPolylines() async {
    double cLat = double.parse(currentLocation.latitude.toString());
    double cLong = double.parse(currentLocation.longitude.toString());
    double hLat = double.parse(hospital.lat);
    double hLong = double.parse(hospital.long);
    PolylineResult pllr = await polylinePoints.getRouteBetweenCoordinates(
        googleAPIKey,
        PointLatLng(cLat, cLong),
        PointLatLng(hLat, hLong));
    List<PointLatLng> result = pllr.points;
    if(result.isNotEmpty){
      for (var point in result) {
        polylineCoordinates.add(
            LatLng(point.latitude,point.longitude)
        );
      }
      setState(() {
        _polylines.add(Polyline(
            width: 8,
            polylineId: const PolylineId('poly'),
            color: Colors.red,
            points: polylineCoordinates
        ));
      });
    }
  }
  Future<void> updatePinOnMap() async {
    CameraPosition cPosition = CameraPosition(
      zoom: 15.0,
      tilt: 0,
      bearing: 0,
      target: LatLng(currentLocation.latitude as double, currentLocation.longitude as double),
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    if(mounted) {
      setState(() {
        var pinPosition = LatLng(currentLocation.latitude as double, currentLocation.longitude as double);
        _markers.removeWhere(
                (m) => m.markerId.value == 'Your Location');
        _markers.add(Marker(
          markerId: const MarkerId('Your Location'),
          position: pinPosition, // updated position
          icon: currentMarker
        ));
      });
    }
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
          onMapCreated: (GoogleMapController controller) async {
            _controller.complete(controller);
            location.onLocationChanged.listen((LocationData cLoc) {
              setState(() {
                currentLocation = cLoc;
              });
              updatePinOnMap();
            });
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    hospital = ModalRoute.of(context)!.settings.arguments as Hospital;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF04999f),
        title: const Text('PETHLAB'),
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 170,
              child: SizedBox(
                height: 160,
                child: Card(
                  color: const Color(0xFFE0E0E0),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: <Widget>[
                        Image.asset(hospital.img, width: 150),
                        const SizedBox(width: 5),
                        Column(
                          children: [
                            SizedBox (
                              width: 163,
                              child: (
                                Text(hospital.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                              ),
                            ),
                            SizedBox(height: 5),
                            SizedBox (
                              width: 163,
                              child: (
                                Text(hospital.address, style: TextStyle(fontSize: 10))
                              ),
                            ),
                            SizedBox(height: 3),
                            SizedBox (
                              width: 163,
                              child: (
                                Text("Distance 5.3 km.", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10))
                              ),
                            ),
                          ],
                        )  
                      ],
                    ),
                  ),
                )
              )
            ),
          )
        ],
      ),
    );
  }
}