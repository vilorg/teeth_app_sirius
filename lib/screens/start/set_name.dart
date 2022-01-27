import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/start/build_app_bar.dart';
import 'package:teeth_app_sirius/screens/start/set_age.dart';

class SetName extends StatefulWidget {
  final bool isGirl;
  const SetName({
    Key? key,
    required this.isGirl,
  }) : super(key: key);

  @override
  State<SetName> createState() => _SetNameState();
}

class _SetNameState extends State<SetName> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var inputName = SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextField(
        controller: _controller,
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
        keyboardType: TextInputType.name,
      ),
    );

    var btnValue = SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        onPressed: () {
          if (_controller.text.length > 1)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SetAge(
                  isGerl: widget.isGirl,
                  name: _controller.text,
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
              widget.isGirl ? kPrimaryGirlColor : kPrimaryBoyColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );

    var subTitle = Text(
      "Введите имя вашего ребёнка",
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .subtitle2!
          .copyWith(color: Colors.black54),
    );

    var title = Text(
      "Имя вашего\nребёнка",
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
