import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../varaible/varaible.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  status() async {
    calendarPermissionStatus = await Permission.calendar.status;
    locationPermissionStatus = await Permission.location.status;
    cameraPermissionStatus = await Permission.camera.status;
    microphonePermissionStatus = await Permission.microphone.status;
  }

  @override
  initState() {
    super.initState();
    status();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permission'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('check_permission');
        },
        child: const Icon(Icons.perm_device_info_sharp),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  PermissionStatus status = await Permission.location.request();
                  setState(() {
                    locationPermissionStatus = status;
                  });
                },
                child: Container(
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Location Permission',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () async {
                  PermissionStatus status = await Permission.calendar.request();
                  setState(() {
                    calendarPermissionStatus = status;
                  });
                },
                child: Container(
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                    ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Calendar Permission',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () async {
                  PermissionStatus status = await Permission.camera.request();
                  setState(() {
                    cameraPermissionStatus = status;
                  });
                },
                child: Container(
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Camera Permission',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () async {
                  PermissionStatus status =
                      await Permission.microphone.request();
                  setState(() {
                    microphonePermissionStatus = status;
                  });
                },
                child: Container(
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                   color: Colors.blue,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Microphone Permission',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

