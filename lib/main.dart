import 'package:flutter/material.dart';
import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/screens/booking%20screens/flight_list_screen.dart';
import 'package:flutter/services.dart';
import 'package:ui3travelapp/screens/booking%20screens/passenger_details_screen.dart';
import 'package:ui3travelapp/screens/booking%20screens/payment_details_screen.dart';
import 'package:ui3travelapp/screens/booking%20screens/search_flight_screen.dart';
import 'package:ui3travelapp/screens/booking%20screens/seat_selection_screen.dart';
import 'package:ui3travelapp/screens/booking%20screens/ticket_confirmation_splash.dart';
import 'package:ui3travelapp/screens/booking%20screens/ticket_screen.dart';
import 'package:ui3travelapp/screens/home%20screen/homescreen.dart';
import 'package:ui3travelapp/screens/home%20screen/location_selected_screen.dart';
import 'package:ui3travelapp/screens/search%20and%20notification%20screens/notification_screen.dart';
import 'package:ui3travelapp/screens/search%20and%20notification%20screens/scarch_screen.dart';
import 'package:ui3travelapp/screens/signup%20screens/signup_intro.dart';

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
      debugShowCheckedModeBanner: false,
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
      home: HomeScreen(),
      routes: {
        "HomeScreen": (context) => HomeScreen(),
        "LocationSelectedScreen": (context) => LocationSelectedScreen(),
        "SearchFlightScreen": (context) => SearchFlightScreen(),
        "FlightListScreen": (context) => FlightListScreen(),
        "SeatSelectionScreen": (context) => SeatSelectionScreen(),
        "PassengerDetailsScreen": (context) => PassengerDetailsScreen(),
        "PaymentDetailsScreen": (context) => PaymentDetailsScreen(),
        "TicketConfirmationSplash": (context) => TicketConfirmationSplash(),
        "TicketScreen": (context) => TicketScreen(),
      },
    );
  }
}
