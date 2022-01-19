import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/start/build_app_bar.dart';
import 'package:teeth_app_sirius/screens/start/readiness.dart';

class SetLastVisit extends StatelessWidget {
  const SetLastVisit({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(mask: '*#.?#.20##', filter: {
      "#": RegExp(r'[0-9]'),
      "*": RegExp(r'[0-3]'),
      "?": RegExp(r'[0-1]'),
    });

    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Последнее посещение\nстоматолога?",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(kDeffaultPadding),
                child: Image.asset("assets/images/seatDentist.png"),
              ),
              Text(
                "Последнее посещение",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: color, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4 * kDeffaultPadding,
                  vertical: 2 * kDeffaultPadding,
                ),
                child: TextField(
                  inputFormatters: [maskFormatter],
                  decoration: InputDecoration(
                    hintText: "31.12.2021",
                    hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black38, fontWeight: FontWeight.normal),
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Сделайте запись посещения\nв отделе “История посещения”",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black54),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: kDeffaultPadding),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "История посещения",
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
              Container(
                padding: EdgeInsets.symmetric(vertical: kDeffaultPadding),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Readiness(color: color,),
                        ));
                  },
                  child: Text(
                    "Далее",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: color, width: 3),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
