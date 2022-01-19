import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

class QuestionOne extends StatefulWidget {
  const QuestionOne({
    Key? key,
    required this.color,
    required this.setAnswer,
    required this.question,
    required this.variants,
    required this.weight,
  }) : super(key: key);

  final Function setAnswer;
  final Color color;
  final List<String> variants;
  final List<double> weight;
  final String question;

  @override
  State<QuestionOne> createState() => _QuestionOneState();
}

class _QuestionOneState extends State<QuestionOne> {
  List<Widget> data = [];
  int select = 0;

  @override
  Widget build(BuildContext context) {
    data = [];
    for (int i = 0; i < widget.variants.length; i++) {
      data.add(buildAnswer(context, widget.variants[i], () {
        setState(() => select = i + 1);
        widget.setAnswer(widget.weight[i]);
      }, i + 1));
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDeffaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: kDeffaultPadding / 3,
              horizontal: kDeffaultPadding,
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDeffaultPadding),
              color: widget.color,
            ),
            child: Text(
              widget.question,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(kDeffaultPadding),
            child: Column(
              children: data,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAnswer(
      BuildContext context, String text, VoidCallback setAnswer, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDeffaultPadding / 2),
      child: GestureDetector(
        onTap: setAnswer,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: index == select ? Color(0xFF8BC34A) : widget.color,
                  width: 3,
                ),
                color: index == select ? Color(0xFF8BC34A) : Colors.white,
              ),
              child: index == select
                  ? Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                  : SizedBox(),
            ),
            SizedBox(width: kDeffaultPadding),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.black54),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    height: 2,
                    color: widget.color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
