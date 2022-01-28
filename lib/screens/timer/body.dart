import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isStart = false;
  bool isPause = false;

  CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularCountDownTimer(
            duration: 120,
            initialDuration: 0,
            controller: _controller,
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            ringColor: Colors.white,
            ringGradient:
                LinearGradient(colors: [Color(0xFFD8E0E6), Colors.white]),
            fillColor: kPrimaryBoyColor.withOpacity(0.4),
            fillGradient: kTimerBoyGradient,
            backgroundColor: kSecondaryBoyColor,
            backgroundGradient: null,
            strokeWidth: 20.0,
            strokeCap: StrokeCap.round,
            textStyle: TextStyle(
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textFormat: CountdownTextFormat.MM_SS,
            isReverse: true,
            isReverseAnimation: true,
            isTimerTextShown: true,
            autoStart: false,
            onStart: () {},
            onComplete: () {
              setState(() {
                isStart = false;
              });
            },
          ),
          SizedBox(height: 4 * kDeffaultPadding),
          GestureDetector(
            onTap: () {
              if (!isStart) {
                _controller.start();
                setState(() {
                  isStart = true;
                });
              } else if (!isPause) {
                setState(() {
                  isPause = true;
                });
                _controller.pause();
              } else {
                _controller.restart();
                setState(() {
                  isPause = false;
                  isStart = true;
                });
              }
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: kSecondaryBoyColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  isStart
                      ? (isPause ? Icons.replay_outlined : Icons.stop)
                      : Icons.play_arrow,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
