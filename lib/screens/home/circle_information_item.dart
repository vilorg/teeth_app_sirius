import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

class CircleInformationItem extends StatelessWidget {
  const CircleInformationItem({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);

  final int count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black12,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              count.toString(),
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black54),
        )
      ],
    );
  }
}
