import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ui3travelapp/constants/constants.dart';

class ScreenWithBottomNav extends StatelessWidget {
  const ScreenWithBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: []),
      ),
      bottomNavigationBar: const GNav(
          // style: GnavStyle.oldSchool,
          rippleColor: primaryULight,
          hoverColor: primaryULight,
          tabBorderRadius: 16,
          // curve: Curves.easeOutExpo,
          color: grey1,
          activeColor: primaryColor,
          gap: 12,
          textSize: 32,
          textStyle: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: default_padding,
              color: primaryColor),

          // iconSize: 32,

          tabs: [
            GButton(
              icon: FluentIcons.home_28_regular,
              text: "Home",
            ),
            GButton(
              icon: FluentIcons.search_28_regular,
              text: "Search",
            ),
            GButton(
              icon: Icons.notifications_none_outlined,
              text: "Nofication",
            ),
            GButton(
              icon: FluentIcons.person_28_regular,
              text: "Account",
            ),
          ]),
    );
  }
}
