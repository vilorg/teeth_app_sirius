import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/start/build_app_bar.dart';
import 'package:teeth_app_sirius/screens/start/set_avatar.dart';

class SetAge extends StatefulWidget {
  final bool isGerl;
  final String name;

  const SetAge({
    Key? key,
    required this.isGerl,
    required this.name,
  }) : super(key: key);

  @override
  State<SetAge> createState() => _SetAgeState();
}

class _SetAgeState extends State<SetAge> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = "";
    super.initState();
  }

  var maskFormatter = MaskTextInputFormatter(mask: '##', filter: {
    "#": RegExp(r'[0-9]'),
  });

  late String name;

  @override
  Widget build(BuildContext context) {
    name = "мальчика";
    if (widget.isGerl) name = "девочки";

    var inputName = SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextField(
        controller: _controller,
        inputFormatters: [maskFormatter],
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

    var btnValue = SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        onPressed: () {
          if (_controller.text.length >= 1)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SetAvatar(
                  name: widget.name,
                  age: int.parse(_controller.text),
                  isGerl: widget.isGerl,
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

    var subTitle = Text(
      "Напишите пожалуйста возраст в месяцах",
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .subtitle2!
          .copyWith(color: Colors.black54),
    );

    var title = Text(
      "Возраст $name\n",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline6,
    );

    return Scaffold(
      appBar: buildAppBar(context),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title,
            const SizedBox(height: 2 * kDeffaultPadding),
            inputName,
            const SizedBox(height: kDeffaultPadding),
            subTitle,
            const SizedBox(height: kDeffaultPadding),
            btnValue,
          ],
        ),
      ),
    );
  }
}
