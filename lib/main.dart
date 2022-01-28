import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teeth_app_sirius/screens/general/general_screen.dart';
import 'package:teeth_app_sirius/screens/start/start_screen.dart';

import 'constants.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Зубки у малютки",
      theme: ThemeData(
        backgroundColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: isFirst(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) return StartScreen();
            return GeneralScreen();
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text(
                  "App finished with error. Restart app or type to my telegram @vilorg",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Future<bool> isFirst() async {
    var box = await Hive.openBox("startBox");
    var isFirst = box.get("isFirst");
    if (isFirst == null) return true;
    return false;
  }
}
