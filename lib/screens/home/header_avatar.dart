import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/home/camera_app.dart';
import 'package:teeth_app_sirius/screens/model/model_screen.dart';

class HeaderAvatar extends StatelessWidget {
  const HeaderAvatar({
    Key? key,
    required this.isGerl,
    required this.toTeeth,
  }) : super(key: key);

  final bool isGerl;
  final VoidCallback toTeeth;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            child: Image.asset(
              isGerl
                  ? "assets/images/backgroundGerl.png"
                  : "assets/images/backgroundBoy.png",
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            width: double.infinity,
            height: 200,
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 100,
            bottom: 0,
            child: Image.asset(
              isGerl
                  ? "assets/images/avatarGerl.png"
                  : "assets/images/avatarBoy.png",
              width: 200,
              height: 200,
            ),
          ),
          Positioned(
            top: kDeffaultPadding * 2,
            right: kDeffaultPadding,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModelScreen(),
                    ));
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.settings,
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: kDeffaultPadding * 2,
            left: kDeffaultPadding,
            child: InkWell(
              onTap: ()  =>toTeeth

             ,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.view_module_rounded,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
