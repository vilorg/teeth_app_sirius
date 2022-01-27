import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/model/model_screen.dart';

class HeaderAvatar extends StatelessWidget {
  const HeaderAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            child: Image.asset(
              "assets/images/background.png",
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
              "assets/images/avatar.png",
              width: 200,
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
        ],
      ),
    );
  }
}
