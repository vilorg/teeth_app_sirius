import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'teeth_positioned.dart';

class DentalPartBase extends StatelessWidget {
  const DentalPartBase({
    Key? key,
    required this.isVisible,
    required this.setVisible,
  }) : super(key: key);
  final List<bool> isVisible;
  final Function setVisible;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;
    double height = width * 187 / 277;
    double scale = width / 277;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: SvgPicture.asset("assets/icons/teeth/base.svg"),
          ),
          TeethPositioned(
            height: height * 0.08,
            width: width * 0.04,
            isVisible: isVisible[0],
            path: "assets/icons/teeth/1_5.svg",
            scale: scale,
            setVisible: () => setVisible(0),
          ),
          TeethPositioned(
            height: height * 0.08,
            width: width * 0.79,
            isVisible: isVisible[1],
            path: "assets/icons/teeth/2_5.svg",
            scale: scale,
            setVisible: () => setVisible(1),
          ),
          TeethPositioned(
            height: height * 0.395,
            width: width * 0.095,
            isVisible: isVisible[2],
            path: "assets/icons/teeth/1_4.svg",
            scale: scale,
            setVisible: () => setVisible(2),
          ),
          TeethPositioned(
            height: height * 0.395,
            width: width * 0.755,
            isVisible: isVisible[3],
            path: "assets/icons/teeth/2_4.svg",
            scale: scale,
            setVisible: () => setVisible(3),
          ),
          TeethPositioned(
            height: height * 0.63,
            width: width * 0.195,
            isVisible: isVisible[4],
            path: "assets/icons/teeth/1_3.svg",
            scale: scale,
            setVisible: () => setVisible(4),
          ),
          TeethPositioned(
            height: height * 0.63,
            width: width * 0.69,
            isVisible: isVisible[5],
            path: "assets/icons/teeth/2_3.svg",
            scale: scale,
            setVisible: () => setVisible(5),
          ),
          TeethPositioned(
            height: height * 0.74,
            width: width * 0.25,
            isVisible: isVisible[6],
            path: "assets/icons/teeth/1_2.svg",
            scale: scale,
            setVisible: () => setVisible(6),
          ),
          TeethPositioned(
            height: height * 0.74,
            width: width * 0.62,
            isVisible: isVisible[7],
            path: "assets/icons/teeth/2_2.svg",
            scale: scale,
            setVisible: () => setVisible(7),
          ),
          TeethPositioned(
            height: height * 0.8,
            width: width * 0.38,
            isVisible: isVisible[8],
            path: "assets/icons/teeth/1_1.svg",
            scale: scale,
            setVisible: () => setVisible(8),
          ),
          TeethPositioned(
            height: height * 0.8,
            width: width * 0.505,
            isVisible: isVisible[9],
            path: "assets/icons/teeth/2_1.svg",
            scale: scale,
            setVisible: () => setVisible(9),
          ),
        ],
      ),
    );
  }
}
