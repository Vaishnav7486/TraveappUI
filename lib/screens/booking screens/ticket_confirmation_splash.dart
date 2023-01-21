import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui3travelapp/constants/constants.dart';

class TicketConfirmationSplash extends StatefulWidget {
  const TicketConfirmationSplash({super.key});

  @override
  State<TicketConfirmationSplash> createState() =>
      _TicketConfirmationSplashState();
}

class _TicketConfirmationSplashState extends State<TicketConfirmationSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 1500),
        () => Navigator.pushReplacementNamed(context, "TicketScreen"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/bluetick.png'))),
            ),
            SizedBox(height: default_padding),
            Text(
              """Your trip ticket has been
booked successfully.""",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textGreyDark,
                  fontWeight: FontWeight.w500,
                  fontSize: default_fontsize),
            )
          ],
        ),
      ),
    );
  }
}
