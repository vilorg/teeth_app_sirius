import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/general/general_screen.dart';

import 'body.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({Key? key}) : super(key: key);

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  bool isGerl = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            child: Icon(Icons.arrow_back_outlined),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GeneralScreen(),
                  ),
                  (route) => false);
            },
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                isGerl ? kSecondaryGirlColor : kSecondaryBoyColor,
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Body(),
        ),
      ),
    );
  }

  Future<void> getData() async {
    var box = await Hive.openBox("startBox");

    setState(() {
      isGerl = box.get("isGerl");
    });
  }
}
