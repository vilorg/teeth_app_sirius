import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

class BtnAnalys extends StatelessWidget {
  const BtnAnalys({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDeffaultPadding),
      width: double.infinity,
      child: ElevatedButton(
        child: Padding(
          padding: EdgeInsets.all(kDeffaultPadding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.moving_rounded,
                size: kDeffaultPadding * 2,
              ),
              SizedBox(width: kDeffaultPadding),
              Text(
                "Прогноз через 5 лет",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                    ),
              )
            ],
          ),
        ),
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kPrimaryBoyColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.black12, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
