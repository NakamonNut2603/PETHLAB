// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pethlab/hospital.dart';
import 'package:pethlab/hospitalData.dart';

class HospitalLocation extends StatefulWidget {
  const HospitalLocation({Key? key}) : super(key: key);

  @override
  State<HospitalLocation> createState() => HospitalLocationState();
}

class HospitalLocationState extends State<HospitalLocation> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = <Marker>{};
  late LocationData currentLocation;
  late BitmapDescriptor currentMarker;
  late BitmapDescriptor hospitalMarker;
  late Location location;
  String googleAPIKey = 'AIzaSyBsu9ooQdRvFSQsn4SM_Ttl2e2CGFDZDlk';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      location = Location();
      setInitialLocation();
    });
  }

  void setInitialLocation() async {
    LocationData cLoc = await location.getLocation();
    setState(() {
        currentLocation = cLoc;
    });
    createMarkerIcon();
  }

  void createMarkerIcon() async {
    currentMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        "assets/person.png",
    );
    hospitalMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        "assets/hospital.png",
    );
    createMarker();
  }

  void createMarker() {
    var pinPosition = LatLng(double.parse(currentLocation.latitude.toString()),double.parse(currentLocation.longitude.toString()));
    Set<Marker> new_marker = <Marker>{};
    new_marker.add(Marker(
      markerId: const MarkerId('Your Location'),
      position: pinPosition,
      infoWindow: const InfoWindow(title: 'Your Location'),
      icon: currentMarker
    ));
    for(int i=0 ; i<hospitals.length ; i++) {
      pinPosition = LatLng(double.parse(hospitals[i].lat), double.parse(hospitals[i].long));
      new_marker.add(Marker(
        markerId: MarkerId(hospitals[i].name),
        position: pinPosition,
        infoWindow: InfoWindow(title: hospitals[i].name),
        icon: hospitalMarker
      ));
    }
    setState(() {
      _markers = new_marker;
    });
  }
  
  Widget _buildGoogleMap(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        myLocationEnabled: true,
        compassEnabled: true,
        tiltGesturesEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition:  const CameraPosition(target: LatLng(13.7562625,100.5023907), zoom: 11),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        }
      ),
    );
  }

  void _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15)));
  }

  @override
  @mustCallSuper
  @protected
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      location = Location();
      setInitialLocation();
    });
  }

  Widget _buildHospitalCard(Hospital hospital) {
    return SizedBox(
      height: 160,
      child: Card(
        color: Color(0xFFE0E0E0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            children: <Widget>[
              Image.asset(hospital.img, width: 150),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  SizedBox (
                    width: 163,
                    child: (
                      Text(hospital.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                    ),
                  ),
                  SizedBox (
                    width: 163,
                    child: (
                      Text(hospital.address, style: TextStyle(fontSize: 10))
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 163,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                double lat = double.parse(hospital.lat);
                                double long = double.parse(hospital.long);
                                _gotoLocation(lat, long);
                              },
                              child: Icon(IconData(0xe3ac, fontFamily: 'MaterialIcons'))
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/hospitalinfo', arguments: hospital);
                              },
                              child: Icon(IconData(0xe33d, fontFamily: 'MaterialIcons'))
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/direction', arguments: hospital);
                              },
                              child: Icon(IconData(0xe1d1, fontFamily: 'MaterialIcons')),
                            ),
                          )
                        ],
                      )
                    ),
                  )
                ],
              )  
            ],
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
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
              margin: EdgeInsets.all(10),
              height: 250,
              child: ListView.builder(
                itemCount: hospitals.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: _buildHospitalCard(hospitals[index])
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
