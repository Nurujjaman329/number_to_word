import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class UserLocationScreen extends StatefulWidget {
  @override
  _UserLocationScreenState createState() => _UserLocationScreenState();
}

class _UserLocationScreenState extends State<UserLocationScreen> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  // Method to request location and get the current position
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, show a message or handle accordingly
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission is denied, handle it accordingly
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle accordingly
      return;
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Location'),
      ),
      body: Center(
        child: _currentPosition != null
            ? Text(
                'Latitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}')
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _determinePosition, // Refresh location on button press
        child: Icon(Icons.location_searching),
      ),
    );
  }
}
