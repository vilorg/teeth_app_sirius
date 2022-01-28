import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/general/general_screen.dart';
import 'package:teeth_app_sirius/screens/start/build_app_bar.dart';
import 'package:teeth_app_sirius/screens/start/questions.dart';

class Readiness extends StatelessWidget {
  const Readiness({
    Key? key,
    required this.isGerl,
    required this.date,
    required this.name,
    required this.age,
  }) : super(key: key);

  final bool isGerl;
  final DateTime date;
  final String name;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Text(
            "Заполнение информации",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: isGerl ? kPrimaryGirlColor : kPrimaryBoyColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDeffaultPadding),
            child: Text(
              "Для анализа зубов заполните\nпервичную информацию",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDeffaultPadding),
            child: Image.asset("assets/images/readiness.png",
                fit: BoxFit.fitWidth),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: kDeffaultPadding),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 90,
            child: ElevatedButton(
              onPressed: () async {
                var box = await Hive.openBox("startBox");
                box.put("name", name);
                box.put("isGerl", isGerl);
                box.put("isFirst", false);
                box.put("age", age);
                box.put("teethUp", [
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                ]);
                box.put("teethDown", [
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                ]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Questions(isGerl: isGerl),
                    ));
              },
              child: Text(
                "Заполнить сейчас",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    isGerl ? kPrimaryGirlColor : kPrimaryBoyColor),
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
              onPressed: () async {
                var box = await Hive.openBox("startBox");
                box.put("name", name);
                box.put("isGerl", isGerl);
                box.put("isFirst", false);
                box.put("age", age);
                box.put("teethUp", [
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                ]);
                box.put("teethDown", [
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                ]);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GeneralScreen(),
                  ),
                );
              },
              child: Text(
                "Заполнить позже",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: isGerl ? kPrimaryGirlColor : kPrimaryBoyColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: isGerl ? kPrimaryGirlColor : kPrimaryBoyColor,
                        width: 3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
