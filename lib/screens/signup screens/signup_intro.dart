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
          color: primaryULight,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://wallpaperaccess.com/full/1314060.jpg'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: SizedBox()),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(default_BRadius * 3),
                      topRight: Radius.circular(default_BRadius * 3))),
              child: Column(
                children: [
                  SizedBox(height: default_padding * 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: default_padding * 2),
                    child: Text(
                      "The new adventure begins here,",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: default_fontsize * 2,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: default_padding * 2),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: default_padding * 4),
                    child: Text(
                      "You are incredible, so, we have a fantastic trip just for you. You never knew about this trip list",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: default_fontsize),
                    ),
                  ),
                  SizedBox(height: default_padding * 2),
                  GestureDetector(onTap: () => Navigator.pushNamed(context, 'HomeScreen'),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: primaryLight,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: default_fontsize * 2,
                      ),
                    ),
                  ),
                  SizedBox(height: default_padding * 5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
