import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/start/set_name.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  late AnimationController _controllerGirl;
  late Animation<double> _animationGirl;
  late AnimationController _controllerBoy;
  late Animation<double> _animationBoy;

  bool isSelect = false;
  bool isGirl = false;

  @override
  void dispose() {
    _controllerGirl.dispose();
    _controllerBoy.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controllerGirl = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animationGirl = CurvedAnimation(
      parent: _controllerGirl,
      curve: Curves.easeOut,
    );
    _controllerBoy = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animationBoy = CurvedAnimation(
      parent: _controllerBoy,
      curve: Curves.easeOut,
    );
    super.initState();
  }

  Color btnColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    if (isGirl && isSelect)
      btnColor = kPrimaryGirlColor;
    else if (!isGirl && isSelect)
      btnColor = kPrimaryBoyColor;
    else
      btnColor = kTextColor;

    var girl = Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 45,
            color: Colors.black12,
            spreadRadius: 35,
            offset: const Offset(0, -20),
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 2 * kDeffaultPadding),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: kDeffaultPadding / 2,
              bottom: kDeffaultPadding / 2,
            ),
            child: GestureDetector(
              onTap: () {
                _controllerGirl.forward();
                _controllerBoy.reverse();
                setState(() {
                  isGirl = true;
                  isSelect = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        isSelect & isGirl ? Colors.green : Colors.transparent,
                    width: 3,
                  ),
                ),
                child: Image.asset("assets/images/girl.png"),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ScaleTransition(
              scale: _animationGirl,
              child: Image.asset("assets/images/access.png"),
            ),
          ),
        ],
      ),
    );

    var boy = Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 45,
            color: Colors.black12,
            spreadRadius: 35,
            offset: const Offset(0, -20),
          ),
        ],
      ),
      margin: EdgeInsets.only(right: 2 * kDeffaultPadding),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: kDeffaultPadding / 2,
              bottom: kDeffaultPadding / 2,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isGirl = false;
                  isSelect = true;
                });
                _controllerGirl.reverse();
                _controllerBoy.forward();
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        isSelect & !isGirl ? Colors.green : Colors.transparent,
                    width: 3,
                  ),
                ),
                child: Image.asset("assets/images/boy.png"),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            child: Positioned(
              bottom: 0,
              right: 0,
              child: ScaleTransition(
                scale: _animationBoy,
                child: Image.asset("assets/images/access.png"),
              ),
            ),
          ),
        ],
      ),
    );

    var choose = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        girl,
        boy,
      ],
    );

    var arrowPrev = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDeffaultPadding * 2,
        vertical: kDeffaultPadding,
      ),
      child: GestureDetector(
        onTap: () => setState(() {
          isSelect = false;
          isGirl = false;
          _controllerBoy.reverse();
          _controllerGirl.reverse();
        }),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black54, width: 2),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            isSelect ? arrowPrev : SizedBox(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(flex: 2),
                  choose,
                  const SizedBox(height: 3 * kDeffaultPadding),
                  Text(
                    "Выберите\nпол ребёнка",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 2 * kDeffaultPadding),
                  Text(
                    " “ Выберите пол ребёнка для\nподбора темы приложения ”",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: kDeffaultPadding),
                  SvgPicture.asset("assets/icons/pointsFirst.svg"),
                  const SizedBox(height: 2 * kDeffaultPadding),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDeffaultPadding),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (isSelect)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetName(
                                color: isGirl
                                    ? kPrimaryGirlColor
                                    : kPrimaryBoyColor,
                              ),
                            ),
                          );
                      },
                      child: Text(
                        "Начать",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(btnColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
