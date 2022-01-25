import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

class NextVisit extends StatelessWidget {
  const NextVisit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: kDeffaultPadding),
        Icon(
          Icons.medical_services,
          color: kPrimaryBoyColor,
          size: 50,
        ),
        SizedBox(width: kDeffaultPadding),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Следующее посещение врача: ",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                TextSpan(
                  text: "30.02.2022 ",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black54,
                      ),
                ),
                TextSpan(
                  text: "изменить",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: kPrimaryBoyColor,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: kDeffaultPadding),
      ],
    );
  }
}
