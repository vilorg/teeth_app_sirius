import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:teeth_app_sirius/screens/general/general_screen.dart';

class FakeScreen extends StatelessWidget {
  final double points;
  const FakeScreen({Key? key, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sendData();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => GeneralScreen(),
          ),
          (route) => false),
    );
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> sendData() async {
    var box = await Hive.openBox("startBox");
    box.put("scores", points + 1);
  }
}
