import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_grocery_shop/helper/constants.dart';

const SOURCE_LOCATION = LatLng(23.7136, 90.4278);
const DEST_LOCATION = LatLng(23.8223, 90.3654);
const CAMERA_ZOOM = 16.0;
const CAMERA_TILT = 80.0;
const CAMERA_BEARING = 30.0;

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  //For controlling google map
  final Completer<GoogleMapController> _controller = Completer();

  //Custom Marker Icon
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;

  //A set of marker
  final Set<Marker> _markers = <Marker>{};

  late LatLng currentLocation;
  late LatLng destinationLocation;

  final Set<Polyline> _polyLines = <Polyline>{};

  //Coordinates for each of the polyline
  final List<LatLng> _polyLineCoordinates = [];

  //PolylinePoint reference
  late PolylinePoints polylinePoints;

  @override
  void initState() {
    polylinePoints = PolylinePoints();

    //Set up initial location
    setInitialLocation();
    //Set up custom marker icon
    setSourceAndDestinationMarker();
  }

  void setInitialLocation() {
    currentLocation = LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);
    destinationLocation = LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  }

  void setSourceAndDestinationMarker() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0), "assets/imgs/source_pin_android.png");
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0), "assets/imgs/destination_pin_android.png");
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition cameraPosition =
        const CameraPosition(target: SOURCE_LOCATION, bearing: CAMERA_BEARING, tilt: CAMERA_TILT, zoom: CAMERA_ZOOM);

    return Scaffold(
        body: Stack(
      children: [
        //Fill the entire position of Map
        Positioned.fill(
          child: GoogleMap(
            myLocationEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
            initialCameraPosition: cameraPosition,
            markers: _markers,
            polylines: _polyLines,
            onMapCreated: (controller) {
              //Call the controller
              _controller.complete(controller);

              //Show markers
              showMarkers();

              //Show polyLines
              setPolyLines();
            },
          ),
        ),
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    //Make the image rounded
                    ClipOval(
                      child: Image.asset(
                        "assets/imgs/cat1_2.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rassel Chicken House",
                            style: GoogleFonts.ubuntu(fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "2 Km from your destination",
                            style: GoogleFonts.ubuntu(
                                color: Colors.black.withOpacity(0.4), fontSize: 16.0, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.map,
                      color: kPrimaryColor,
                      size: 40.0,
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  void showMarkers() {
    setState(() {
      _markers.add(Marker(markerId: const MarkerId("sourcePin"), position: currentLocation, icon: sourceIcon));

      _markers.add(
          Marker(markerId: const MarkerId("destinationPin"), position: destinationLocation, icon: destinationIcon));
    });
  }

  void setPolyLines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyDAzloJ2i3aG6EEvbjf1himsgLU0p20wc0",
        PointLatLng(currentLocation.latitude, currentLocation.longitude),
        PointLatLng(destinationLocation.latitude, destinationLocation.longitude));

    debugPrint("result status:" + result.status.toString());

    if (result.status == "OK") {
      for (var element in result.points) {
        _polyLineCoordinates.add(LatLng(element.latitude, element.longitude));
      }

      setState(() {
        _polyLines.add(
            Polyline(polylineId: PolylineId("polyline"), color: Colors.red, points: _polyLineCoordinates, width: 10));
      });
    }
  }
}
