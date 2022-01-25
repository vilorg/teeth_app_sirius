import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
