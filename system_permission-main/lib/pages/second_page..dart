import 'dart:async';
import 'package:flutter/material.dart';
import '../model/modelsclass.dart';
import '../varaible/varaible.dart';


class permission_page extends StatefulWidget {
  const permission_page({Key? key}) : super(key: key);
  @override
  State<permission_page> createState() => _permission_pageState();
}
class _permission_pageState extends State<permission_page> {
  @override
  initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }




  List<Detail> permissionList = <Detail>[
    Detail(
        name: "Calendar",
        icon: Icon(
          Icons.date_range,
          color: Colors.grey[700],
          size: 27,
        ),
        isAllow: (calendarPermissionStatus.toString().split(".")[1] == "denied")
            ? false
            : true),
    Detail(
        name: "Camera",
        icon: Icon(
          Icons.camera_alt_outlined,
          color: Colors.grey[700],
          size: 27,
        ),
        isAllow: (cameraPermissionStatus.toString().split(".")[1] == "denied")
            ? false
            : true),
    Detail(
        name: "Files",
        icon: Icon(
          Icons.file_copy_outlined,
          color: Colors.grey[700],
          size: 27,
        ),
        isAllow: true),
    Detail(
        name: "Location",
        icon: Icon(
          Icons.location_on_outlined,
          color: Colors.grey[700],
          size: 27,
        ),
        isAllow: (locationPermissionStatus.toString().split(".")[1] == "denied")
            ? false
            : true),
    Detail(
        name: "Microphone",
        icon: Icon(
          Icons.mic_none_rounded,
          color: Colors.grey[700],
          size: 27,
        ),
        isAllow: (microphonePermissionStatus.toString().split(".")[1] == "denied")
            ? false
            : true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Text(
                  'ALLOWED',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: permissionList
                  .map((e) => (e.isAllow)
                  ? Padding(
                padding: const EdgeInsets.only(
                    bottom: 10, left: 20, top: 20),
                child: Row(
                  children: [
                    e.icon,
                    const SizedBox(width: 28),
                    Text(
                      e.name,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
                  : Container())
                  .toList(),
            ),
            const Divider(
              height: 1.5,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Text(
                  'NOT ALLOWED',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: permissionList
                  .map((e) => (e.isAllow == false)
                  ? Padding(
                padding: const EdgeInsets.only(
                    bottom: 10, left: 20, top: 20),
                child: Row(
                  children: [
                    e.icon,
                    const SizedBox(width: 28),
                    Text(
                      e.name,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
                  : Container())
                  .toList(),
            ),
            const SizedBox(height: 20),
            const Divider(
              height: 1.5,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
  Widget myPermission({required String perName, required String perStatus}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            perName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          (perStatus.split(".")[1] == "denied")
              ? const Text(
            "Don't Allow",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue),
          )
              : const Text(
            "Allow",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
