import 'package:flutter/material.dart';
import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/screens/home%20screen/homescreen.dart';
import 'package:ui3travelapp/screens/home%20screen/location_selected_screen.dart';
import 'package:ui3travelapp/screens/signup%20screens/signup_intro.dart';
import 'package:flutter/services.dart';
import 'package:overlay_group_avatar/overlay_group_avatar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Quicksand',
        textTheme: Theme.of(context).textTheme.apply(
            // fontSizeFactor: 1,
            // fontSizeDelta: 2,
            ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // or from RGB
          primary: primaryColor,
          secondary: primaryLight,
        ),
      ),
      home: LocationSelectedScreen(),
    );
  }
}
