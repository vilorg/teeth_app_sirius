import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/general/general_screen.dart';
import 'package:teeth_app_sirius/screens/home/fake_screen.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key, required this.cameras, required this.points})
      : super(key: key);

  final List<CameraDescription>? cameras;
  final double points;

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  bool isLoaded = false;
  late CameraController controller;
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras![0], ResolutionPreset.max);
    controller.initialize().then((_) {
      setState(() {});
      if (!mounted) {
        return;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      backgroundColor: kPrimaryBoyColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Center(
                child: CameraPreview(controller),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FakeScreen(points: widget.points),
                        ),
                        (route) => false),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.circle_outlined,
                            color: kSecondaryBoyColor),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    "assets/images/mask.png",
                    width: 250,
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
