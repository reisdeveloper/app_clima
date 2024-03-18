import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../config/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
   super.initState();
   getLocation();
  }

  Future<void> getLocation() async {
    Location location = Location();
    try {
      await location.getCurrentLocation();
      setState(() {
       print("Longitude do usuário: ${location.longitude}");
       print("Lagitude do usuário: ${location.latitude}");
       print("Localização do usuário: ${location.longitude} ${location.latitude}");

      });
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Page")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  getLocation();
                },
                child: const Text("Mostre-me minha posição"),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
