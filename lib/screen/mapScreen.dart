import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.address
  });
}

class MapScreen extends StatefulWidget {
  final PlaceLocation location;
  final bool isReadonly;

  MapScreen({
    this.location = const PlaceLocation (
      latitude: -22.907104,
      longitude: -47.063240,
    ),
    this.isReadonly = false,
  });
  
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  LatLng _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione o local'),
        actions: <Widget>[
          if(!widget.isReadonly)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickedPosition == null ? null : () {
                Navigator.of(context).pop(_pickedPosition);
              }
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng( 
            widget.location.latitude,
            widget.location.longitude
          ),
          zoom: 13,
        ),
        onTap: widget.isReadonly ? null : _selectPosition,
        markers: _pickedPosition == null ? null : {
          Marker(
            markerId: MarkerId('p1'),
            position: _pickedPosition,
          )
        },
      )
    );
  }
}