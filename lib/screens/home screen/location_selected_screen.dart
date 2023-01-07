import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/screens/home%20screen/homescreen.dart';

class LocationSelectedScreen extends StatelessWidget {
  const LocationSelectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: default_padding / 1.5),
            ImageCardL(),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Denver Mountains",
                      style: TextStyle(
                        fontSize: default_fontsize * 1.5,
                      ),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.location_on_outlined,
                        size: default_fontsize,
                        color: textRed,
                      )),
                      TextSpan(
                          text: "Denver, Colorado",
                          style: TextStyle(color: textRed))
                    ]))
                  ],
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}

class ImageCardL extends StatelessWidget {
  const ImageCardL({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: default_padding),
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/Tajmahal.jpg')
                //  NetworkImage(
                //     'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bW91bnRhaW5zfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),
                ),
            borderRadius: BorderRadius.circular(default_BRadius * 1.8),
          ),
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: default_padding),
          child: LocationFlightDestinationcard(),
        ),
        Positioned(
          top: default_padding,
          left: default_padding * 2,
          child: iconButtonTransparent(
            iconname: Icons.arrow_back_ios_new_rounded,
            iconcolor: Colors.white,
            onButtonPressed: () {},
          ),
        ),
        Positioned(
          top: default_padding,
          right: default_padding * 2,
          child: iconButtonTransparent(
            iconname: Icons.favorite_border_outlined,
            iconcolor: Colors.red,
            onButtonPressed: () {},
          ),
        ),
      ],
    );
  }
}

class LocationFlightDestinationcard extends StatelessWidget {
  const LocationFlightDestinationcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: default_padding),
      child: Container(
        alignment: Alignment.center,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(default_BRadius)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: default_padding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: default_padding / 1.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: default_padding / 4),
                    Text(
                      "New York",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize * 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              verticalLineSeperatorL48(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: default_padding / 1.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flight Rest",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: default_padding / 4),
                    Text(
                      "Chikago",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize * 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              verticalLineSeperatorL48(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: default_padding / 1.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Destination",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: default_padding / 4),
                    Text(
                      "Denver",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: default_fontsize * 1.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class verticalLineSeperatorL48 extends StatelessWidget {
  const verticalLineSeperatorL48({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 1,
      color: Colors.white,
    );
  }
}

class iconButtonTransparent extends StatelessWidget {
  const iconButtonTransparent({
    Key? key,
    required this.iconname,
    required this.iconcolor,
    required this.onButtonPressed,
  }) : super(key: key);

  final IconData iconname;
  final Color iconcolor;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(default_BRadius)),
        child: Icon(
          iconname,
          color: iconcolor,
        ),
      ),
    );
  }
}
