import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui3travelapp/constants/constants.dart';

class SignUpIntro extends StatelessWidget {
  const SignUpIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://wallpaperaccess.com/full/1314060.jpg'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 400),
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(default_BRadius * 3),
                      topRight: Radius.circular(default_BRadius * 3))),
              child: Center(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: default_padding * 2),
                child: Text(
                  "The new adventure begins here,",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32),
                ),
              )),
            ))
          ],
        ),
      ),
    );
  }
}
