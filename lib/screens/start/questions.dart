import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/general/general_screen.dart';
import 'package:teeth_app_sirius/screens/home/camera_app.dart';
import 'package:teeth_app_sirius/screens/start/build_app_bar.dart';
import 'package:teeth_app_sirius/screens/start/data.dart';
import 'package:teeth_app_sirius/screens/start/question_many.dart';
import 'package:teeth_app_sirius/screens/start/question_one.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key, required this.isGerl}) : super(key: key);

  final bool isGerl;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  List answer = [];
  List<bool> isAnswered = [];
  List<DataQuestion> data = getQuestions2();

  List<Widget> dataPaste = [];

  @override
  void initState() {
    for (int i = 0; i < data.length; i++) {
      // if (!data[i].isLow)
      answer.add(0);
      isAnswered.add(false);
    }
    super.initState();
  }

  bool isArea = true;

  @override
  Widget build(BuildContext context) {
    var setArea = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: kDeffaultPadding / 3,
                horizontal: kDeffaultPadding,
              ),
              margin: EdgeInsets.symmetric(vertical: kDeffaultPadding),
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDeffaultPadding),
                color: widget.isGerl ? kPrimaryGirlColor : kPrimaryBoyColor,
              ),
              child: Text(
                "В каком регионе вы живёте?",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Image.asset(
            "assets/images/setArea.png",
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: kDeffaultPadding),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 90,
            child: ElevatedButton(
              onPressed: () => setState(() => isArea = false),
              child: Text(
                "Определить локацию",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color:
                          widget.isGerl ? kPrimaryGirlColor : kPrimaryBoyColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: widget.isGerl
                            ? kPrimaryGirlColor
                            : kPrimaryBoyColor,
                        width: 3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    dataPaste = [];

    for (int i = 0; i < data.length; i++) {
      // if (!data[i].isLow)
      if (data[i].isMany) {
        dataPaste.add(QuestionMany(
          color: widget.isGerl ? kPrimaryGirlColor : kPrimaryBoyColor,
          setAnswer: (value) => setState(() => answer[i] = value),
          question: data[i].title,
          weight: data[i].weight,
          variants: data[i].variants,
        ));
        isAnswered[i] = true;
      } else
        dataPaste.add(QuestionOne(
          color: widget.isGerl ? kPrimaryGirlColor : kPrimaryBoyColor,
          setAnswer: (value) => setState(() => answer[i] = value),
          question: data[i].title,
          variants: data[i].variants,
          weight: data[i].weight,
          setBool: () => isAnswered[i] = true,
        ));
    }

    var title = Text(
      "Добро пожаловать",
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
    );

    var subTitle = Row(
      children: [
        Text(
          "zubki.u.malytki",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
                color: widget.isGerl ? kPrimaryGirlColor : kPrimaryBoyColor,
              ),
        ),
        SizedBox(width: kDeffaultPadding / 2),
        Image.asset("assets/images/teethQuestions.png"),
      ],
    );

    var btnValue = Container(
      padding: EdgeInsets.symmetric(vertical: kDeffaultPadding),
      width: MediaQuery.of(context).size.width * 0.7,
      height: 90,
      child: ElevatedButton(
        onPressed: () async {
          bool key = true;
          for (bool i in isAnswered) {
            if (!i) key = false;
          }
          if (key) {
            await availableCameras().then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraApp(
                    cameras: value,
                    points: answer.reduce((value, element) => value + element),
                  ),
                ),
              ),
            );
          } else
            print("error");
        },
        child: Text(
          "Далее",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              widget.isGerl ? kPrimaryGirlColor : kPrimaryBoyColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: kDeffaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: isArea
              ? ([
                  title,
                  SizedBox(height: kDeffaultPadding / 4),
                  subTitle,
                  setArea,
                ])
              : ([
                    title,
                    SizedBox(height: kDeffaultPadding / 4),
                    subTitle,
                  ] +
                  dataPaste +
                  [
                    btnValue,
                  ]),
        ),
      ),
    );
  }
}
