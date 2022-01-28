import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TeethPositioned extends StatelessWidget {
  const TeethPositioned({
    Key? key,
    required this.height,
    required this.width,
    required this.isVisible,
    required this.path,
    required this.scale,
    required this.setVisible,
  }) : super(key: key);

  final double height;
  final double width;
  final bool isVisible;
  final String path;
  final double scale;
  final VoidCallback setVisible;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: height,
      left: width,
      child: GestureDetector(
        onTap: setVisible,
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: isVisible ? 1 : 0,
          child: Transform.scale(
            scale: scale,
            child: SvgPicture.asset(
              path,
              color: null,
            ),
          ),
        ),
      ),
    );
  }
}
