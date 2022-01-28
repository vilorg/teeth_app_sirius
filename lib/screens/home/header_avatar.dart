import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

class HeaderAvatar extends StatelessWidget {
  const HeaderAvatar({
    Key? key,
    required this.isGerl,
    required this.toTeeth,
    required this.toModel,
    required this.isComplete,
  }) : super(key: key);

  final bool isGerl;
  final VoidCallback toTeeth;
  final VoidCallback toModel;
  final bool isComplete;

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
              onTap: toModel,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.view_module,
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: kDeffaultPadding * 2,
            left: kDeffaultPadding,
            child: isComplete
                ? InkWell(
                    onTap: toTeeth,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.qr_code,
                        size: 30,
                      ),
                    ),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
