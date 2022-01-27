import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/start/build_app_bar.dart';
import 'package:teeth_app_sirius/screens/start/readiness.dart';

class SetLastVisit extends StatefulWidget {
  const SetLastVisit({
    Key? key,
    required this.isGerl,
    required this.name,
    required this.age,
  }) : super(key: key);

  final bool isGerl;
  final String name;
  final int age;

  @override
  State<SetLastVisit> createState() => _SetLastVisitState();
}

class _SetLastVisitState extends State<SetLastVisit> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(mask: '*#.?#.20##', filter: {
      "#": RegExp(r'[0-9]'),
      "*": RegExp(r'[0-3]'),
      "?": RegExp(r'[0-1]'),
    });

    var title = Text(
      "Последнее посещение\nстоматолога?",
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(fontWeight: FontWeight.bold),
    );

    var image = Padding(
      padding: const EdgeInsets.all(kDeffaultPadding),
      child: Image.asset("assets/images/seatDentist.png"),
    );

    var underImage = Text(
      "Последнее посещение",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline5!.copyWith(
          color: widget.isGerl ? kPrimaryGirlColor : kPrimaryBoyColor,
          fontWeight: FontWeight.bold),
    );

    var textEdit = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4 * kDeffaultPadding,
        vertical: 2 * kDeffaultPadding,
      ),
      child: TextField(
        controller: _controller,
        inputFormatters: [maskFormatter],
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          hintText: "31.12.2021",
          hintStyle: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.black38, fontWeight: FontWeight.normal),
        ),
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );

    var subTitle = Text(
      "Сделайте запись посещения\nв отделе “История посещения”",
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: Colors.black54),
    );

    var btnHistory = Container(
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

    var btnNext = Container(
      padding: EdgeInsets.symmetric(vertical: kDeffaultPadding),
      width: MediaQuery.of(context).size.width * 0.7,
      height: 90,
      child: ElevatedButton(
        onPressed: () {
          if (_controller.text.length == 10) {
            List date = _controller.text.split(".");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Readiness(
                  isGerl: widget.isGerl,
                  age: widget.age,
                  date: DateTime.parse(date[2] + "-" + date[1] + "-" + date[0]),
                  name: widget.name,
                ),
              ),
            );
          }
        },
        child: Text(
          "Далее",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: widget.isGerl ? kPrimaryGirlColor : kPrimaryBoyColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: widget.isGerl ? kPrimaryGirlColor : kPrimaryBoyColor,
                width: 3,
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title,
              image,
              underImage,
              textEdit,
              subTitle,
              btnHistory,
              btnNext,
            ],
          ),
        ),
      ),
    );
  }
}
