import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:teeth_app_sirius/constants.dart';
import 'package:teeth_app_sirius/screens/faq/faq_screen.dart';
import 'package:teeth_app_sirius/screens/home/home_screen.dart';
import 'package:teeth_app_sirius/screens/statistic/statistic_screen.dart';
import 'package:teeth_app_sirius/screens/timer/timer_screen.dart';
import 'package:teeth_app_sirius/screens/todo/todo_screen.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  int _selectedIndex = 1;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await _navigatorKeys[_selectedIndex].currentState!.maybePop(),
      child: Scaffold(
        extendBody: true,
        key: _key,
        bottomNavigationBar: buildBottomMenu(),
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
            _buildOffstageNavigator(4),
          ],
        ),
      ),
    );
  }

  void _next() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => const GeneralScreen()));

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return const [
          TodoScreen(),
          StatisticScreen(),
          HomeScreen(),
          FaqScreen(),
          TimerScreen(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }

  Widget buildBottomMenu() {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      child: CurvedNavigationBar(
        index: _selectedIndex,
        onTap: (value) => setState(
          () => _selectedIndex = value,
        ),
        backgroundColor: Colors.transparent,
        color: kSecondaryBoyColor,
        height: 60,
        items: [
          Icon(Icons.check_circle_rounded),
          Icon(Icons.signal_cellular_alt),
          Icon(Icons.home),
          Icon(Icons.question_answer_rounded),
          Icon(Icons.access_time_filled),
        ],
        animationDuration: Duration(milliseconds: 400),
      ),
    );
  }
}
