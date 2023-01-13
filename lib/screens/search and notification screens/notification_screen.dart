import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/screens/home%20screen/homescreen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: default_padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: default_padding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifications",
                  style: TextStyle(
                      fontSize: default_fontsize * 1.5,
                      fontWeight: FontWeight.w800),
                ),
                iconButton1(icondata: Icon(Icons.menu), onIconButtonTap: () {})
              ],
            ),
            SizedBox(height: default_padding / 2),
            Divider(color: grey1),
            Container(
                padding: EdgeInsets.symmetric(vertical: default_padding),
                child: Text(
                  "March 01, 2022",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: default_fontsize,
                  ),
                )),
            GestureDetector(
              onTap: () {},
              child: ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: Text(
                      "50%",
                      style: TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: primaryULight,
                      borderRadius: BorderRadius.circular(default_BRadius),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://peakvisor.com/img/news/Himalayas-Kanchenjunga.jpg"))),
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "Welcome reward upto 50%",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
                subtitle: Text(
                  "Get upto 50% discount on your first booking",
                  style: TextStyle(fontSize: default_fontsize / 1.2),
                ),
                trailing: Icon(Icons.more_vert),
              ),
            )
          ],
        ),
      )),
    );
  }
}
