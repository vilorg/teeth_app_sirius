import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/start/build_app_bar.dart';
import 'package:teeth_app_sirius/screens/start/data_question.dart';
import 'package:teeth_app_sirius/screens/start/question_one.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  List answer = [];
  List<DataQuestion> data = getQuestions();

  List<Widget> dataPaste = [];

  @override
  void initState() {
    for (int i = 0; i < data.length; i++) {
      if (!data[i].isLow) answer.add(0);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dataPaste = [];
    for (int i = 0; i < data.length; i++) {
      if (!data[i].isLow)
        dataPaste.add(QuestionOne(
          color: widget.color,
          setAnswer: (value) => setState(() => answer[i] = value),
          question: data[i].title,
          variants: data[i].variants,
          weight: data[i].weight,
        ));
    }
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: kDeffaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                Text(
                  "Добро пожаловать",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: kDeffaultPadding / 4),
                Row(
                  children: [
                    Text(
                      "zubki.u.malytki",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold, color: widget.color),
                    ),
                    SizedBox(width: kDeffaultPadding / 2),
                    Image.asset("assets/images/teethQuestions.png"),
                  ],
                ),
              ] +
              dataPaste +
              [
                Container(
                  padding: EdgeInsets.symmetric(vertical: kDeffaultPadding),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {
                      print(answer.reduce((value, element) => value + element));
                    },
                    child: Text(
                      "Далее",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(widget.color),
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
