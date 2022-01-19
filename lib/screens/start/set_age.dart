import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/start/build_app_bar.dart';
import 'package:teeth_app_sirius/screens/start/set_avatar.dart';

class SetAge extends StatelessWidget {
  final Color color;
  const SetAge({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputName = SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        cursorColor: Colors.transparent,
        showCursor: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          counter: SizedBox(),
        ),
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
        maxLength: 15,
        keyboardType: TextInputType.number,
      ),
    );

    return Scaffold(
      appBar: buildAppBar(context),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Возраст мальчика\n",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 2 * kDeffaultPadding),
            inputName,
            const SizedBox(height: kDeffaultPadding),
            Text(
              "Напишите пожалуйста возраст в месяцах",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.black54),
            ),
            const SizedBox(height: kDeffaultPadding),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetAvatar(
                        color: color,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Далее",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
