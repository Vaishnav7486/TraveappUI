import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/screens/booking%20screens/flight_list_screen.dart';

class TicketScreen extends StatelessWidget {
  TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          paddingSeperator(),
          OriginPixelMarking(),
          DestinationPixelMarking(),
          BarcodeContainer(),
          InfoGrid(
              ticketRelatedData1: ticketRelatedData1,
              ticketRelatedData2: ticketRelatedData2)
        ]),
      ),
      bottomNavigationBar: TicketscreenBottomNavBar(),
    );
  }

  final List ticketRelatedData1 = [
    "TICKET OWNER",
    "",
    "FLIGHT",
    "CLASS",
    "FROM",
    "TO",
    "SEAT",
    "DATE",
    "BOARDING TIME",
    "GATE",
  ];
  final List ticketRelatedData2 = [
    "MEET TRIVEDI",
    "",
    "AIRBUS - 390B",
    "BUSINESS CLASS",
    "NEW YORK CITY",
    "DENVER",
    "10E, 10F",
    "08 OCTOBER, 2022",
    "14:58",
    "03",
  ];
}

class TicketscreenBottomNavBar extends StatelessWidget {
  const TicketscreenBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: default_padding),
        height: 55,
        child: CustomButton1(buttonText: "Download Ticket", onPressed: () {}));
  }
}

class InfoGrid extends StatelessWidget {
  const InfoGrid({
    Key? key,
    required this.ticketRelatedData1,
    required this.ticketRelatedData2,
  }) : super(key: key);

  final List ticketRelatedData1;
  final List ticketRelatedData2;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      padding: EdgeInsets.symmetric(horizontal: default_padding),
      child: GridView.count(
        // padding: EdgeInsets.symmetric(
        //   horizontal: default_padding,
        //   vertical: default_padding * 2,
        // ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 2.6,
        children: List.generate(
            10,
            (index) => Container(
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: default_padding),
                  // color: Colors.red,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticketRelatedData1[index],
                        style: TextStyle(
                            fontSize: default_fontsize,
                            color: textGrey,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        ticketRelatedData2[index],
                        style: TextStyle(
                            fontSize: default_fontsize,
                            color: textGreyDark,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}

class BarcodeContainer extends StatelessWidget {
  const BarcodeContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: default_padding),
        child: Image(image: AssetImage("assets/icons/barcode.png")),
      ),
    );
  }
}

class DestinationPixelMarking extends StatelessWidget {
  const DestinationPixelMarking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: primaryLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/dottedlines3-50.png"))),
          ),
          Text(
            "DNR",
            style: TextStyle(
                color: Colors.white, fontSize: 140, fontFamily: "Mojang"),
          ),
        ],
      ),
    );
  }
}

class OriginPixelMarking extends StatelessWidget {
  const OriginPixelMarking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "NYC",
            style: TextStyle(
                color: Colors.white, fontSize: 140, fontFamily: "Mojang"),
          ),
          Container(
            height: 4,
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/dottedlines2.png"))),
          ),
        ],
      ),
    );
  }
}

class paddingSeperator extends StatelessWidget {
  const paddingSeperator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.black,
    );
  }
}


//  "meet trivedi", "", "AIRBUS - 390B", "business class", "new york city", "denver", "10E, 10F","08 october, 2022", "14:15", "03"