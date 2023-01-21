import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/dymmy%20data/dymmydatas.dart';

class FlightListScreen extends StatelessWidget {
  const FlightListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                // height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1568713489957-0f7ac1058b4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=894&q=80'))),
                child: Column(
                  children: [
                    const SizedBox(height: default_padding),
                    const FlightListTopBar(),
                    const SizedBox(height: default_padding),
                    const OriginAndDestinationContainer(),
                    const SizedBox(height: default_padding * 1.5),
                    FlightResultSort(),
                    const SizedBox(height: default_padding),
                  ],
                ),
              ),
              SizedBox(height: default_padding * 1.5),
              FlightCardList(),
              // FlightDetailCard(
              //     OriginLoc: "somethinf",
              //     OriginTime: 1.25,
              //     DestinationLoc: "sample loc",
              //     DestinationTime: 125.55,
              //     durationHour: 4,
              //     durationMin: 25,
              //     flightLogoURL: "flightLogoURL",
              //     ticketRate: 215,
              //     ticketClass: "ticketClass"),
              SizedBox(height: default_padding * 1.5),
            ],
          ),
        ),
      ),
    );
  }
}

class FlightCardList extends StatelessWidget {
  const FlightCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: flightListData.length,
        itemBuilder: (context, index) {
          return FlightDetailCard(
              OriginLoc: flightListData[index]["originLoc"].toString(),
              OriginTime: flightListData[index]["originTime"],
              DestinationLoc:
                  flightListData[index]["destinationLoc"].toString(),
              DestinationTime: flightListData[index]["destinationTime"],
              durationHour: flightListData[index]["durationH"],
              durationMin: flightListData[index]["durationM"],
              flightLogoURL: flightListData[index]["flightLogoURL"].toString(),
              ticketRate: flightListData[index]["ticketRate"],
              ticketClass: flightListData[index]["ticketClass"].toString());
        });
  }
}

class FlightDetailCard extends StatefulWidget {
  const FlightDetailCard({
    Key? key,
    required this.OriginLoc,
    required this.OriginTime,
    required this.DestinationLoc,
    required this.DestinationTime,
    required this.durationHour,
    required this.durationMin,
    required this.flightLogoURL,
    required this.ticketRate,
    required this.ticketClass,
    int personCount = 1,
  }) : super(key: key);

  final String OriginLoc;
  final double OriginTime;
  final String DestinationLoc;
  final double DestinationTime;
  final int durationHour;
  final int durationMin;
  final String flightLogoURL;
  final double ticketRate;
  final String ticketClass;

  @override
  State<FlightDetailCard> createState() => _FlightDetailCardState();
}

class _FlightDetailCardState extends State<FlightDetailCard> {
  final personCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: default_padding),
      child: GestureDetector(
        onTap: (() {
          ShowBottomSheetFunction(context);
        }),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: default_padding),
          padding: EdgeInsets.symmetric(horizontal: default_padding),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(default_BRadius),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade100,
                    offset: Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 0)
              ],
              border: Border.all(color: grey1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: default_padding / 1.5),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                  height: 50,
                  width: 80,
                  child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage(widget.flightLogoURL)),
                  // mark2
                ),
                Text(
                  '\$${widget.ticketRate}',
                  style: TextStyle(
                      fontSize: default_padding * 1.8,
                      color: primaryColor,
                      fontWeight: FontWeight.w900),
                )
              ]),
              SizedBox(height: default_padding / 1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlightTimeAndOrigin(
                      OriginLoc: widget.OriginLoc,
                      flightTime: widget.OriginTime.toString()),
                  FlightDurationAndSeatType(
                      durationHour: widget.durationHour,
                      durationMin: widget.durationMin,
                      ticketClass: widget.ticketClass),
                  FlightTimeAndDestination(
                      flightTime: widget.DestinationTime.toString(),
                      OriginLoc: widget.DestinationLoc)
                ],
              ),
              SizedBox(height: default_padding * 1.8),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        FluentIcons.person_24_regular,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "$personCount",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    WidgetSpan(
                        child: SizedBox(
                      width: default_padding,
                    )),
                    WidgetSpan(
                      child: Icon(
                        FluentIcons.arrow_right_12_regular,
                        size: default_fontsize * 1.2,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "  One way",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ])),
              SizedBox(
                height: default_padding * 1.5,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> ShowBottomSheetFunction(BuildContext context) {
    var itsObject1 = NoOfSeatsSelected();

    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(default_BRadius * 1.5),
          topRight: Radius.circular(default_BRadius * 1.5),
        )),
        context: context,
        builder: (BuildContext context) {
          return Container(
            // height: 200,
            decoration: BoxDecoration(),
            child: Column(
              children: [
                SizedBox(height: default_padding * 3.5),
                Text(
                  "How many passengers are travelling?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: default_fontsize * 1.5),
                ),
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/icons/flight_ticket_logo.png')),
                ),
                NoOfSeatsSelected(),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: default_padding,
                      vertical: default_padding / 1.5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 120,
                          child: Image(
                              fit: BoxFit.contain,
                              image: AssetImage(widget.flightLogoURL)),
                        ),
                        Text(
                          '\$${widget.ticketRate}',
                          // mark tickcet rate
                          style: TextStyle(
                              fontSize: default_padding * 1.8,
                              color: primaryColor,
                              fontWeight: FontWeight.w900),
                        )
                      ]),
                ),
                CustomButton1(
                  buttonText: "Book Now",
                  onPressed: () {
                    Navigator.pushNamed(context, "SeatSelectionScreen");
                  },
                ),
              ],
            ),
          );
        });
  }
}

class NoOfSeatsSelected extends StatefulWidget {
  const NoOfSeatsSelected({
    Key? key,
  }) : super(key: key);

  @override
  State<NoOfSeatsSelected> createState() => _NoOfSeatsSelectedState();
}

class _NoOfSeatsSelectedState extends State<NoOfSeatsSelected> {
  var noOfSeatsSelected = 0;
  var seatNoReturn;
  bool selected = false;

  int get getSeatCount {
    return noOfSeatsSelected;
  }

  int seatnogetterx() {
    return seatNoReturn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: default_padding),
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  noOfSeatsSelected = index;
                  // selected = !selected;
                  print(noOfSeatsSelected + 1);
                  seatNoReturn = noOfSeatsSelected + 1;
                  print("$seatNoReturn  seat no return");
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: default_padding / 3),
                // height: 50,
                width: 35,
                decoration: BoxDecoration(
                    color: index != noOfSeatsSelected
                        ? Colors.white
                        : primaryLight,
                    border: index != noOfSeatsSelected
                        ? Border.all(color: Colors.grey.shade200)
                        : null,
                    borderRadius: BorderRadius.circular(default_BRadius / 2)),
                child: Center(
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: default_fontsize * 1.2,
                        color: index != noOfSeatsSelected
                            ? Colors.black87
                            : Colors.white),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: default_padding * 2.2),
        // height: 55,
        width: 320,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(default_BRadius / 2),
            boxShadow: [
              BoxShadow(
                  color: primaryLight,
                  offset: Offset(0, 2),
                  // spreadRadius: 5,
                  blurRadius: 10),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: default_padding * 1,
          ),
          child: Center(
            child: Text(
              buttonText,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: default_fontsize * 1.2,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}

class FlightDurationAndSeatType extends StatelessWidget {
  const FlightDurationAndSeatType({
    Key? key,
    required this.durationHour,
    required this.durationMin,
    required this.ticketClass,
  }) : super(key: key);

  final int durationHour;
  final int durationMin;
  final String ticketClass;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$durationHour $durationMin',
          style: TextStyle(color: textGrey),
        ),
        Image(image: AssetImage("assets/icons/dotArrowIcon.png")),
        Text(ticketClass, style: TextStyle(color: textGrey)),
      ],
    );
  }
}

class FlightTimeAndOrigin extends StatelessWidget {
  const FlightTimeAndOrigin({
    Key? key,
    required this.flightTime,
    required this.OriginLoc,
  }) : super(key: key);

  final String flightTime;
  final String OriginLoc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          flightTime,
          style: TextStyle(
              fontSize: default_padding * 1.6, fontWeight: FontWeight.w700),
        ),
        Text(
          OriginLoc,
          style: TextStyle(
              fontSize: default_padding,
              color: textGrey,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class FlightTimeAndDestination extends StatelessWidget {
  const FlightTimeAndDestination({
    Key? key,
    required this.flightTime,
    required this.OriginLoc,
  }) : super(key: key);

  final String flightTime;
  final String OriginLoc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          flightTime,
          style: TextStyle(
              fontSize: default_padding * 1.6, fontWeight: FontWeight.w700),
        ),
        Text(
          OriginLoc,
          style: TextStyle(
              fontSize: default_padding,
              color: textGrey,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class FlightResultSort extends StatefulWidget {
  const FlightResultSort({
    Key? key,
  }) : super(key: key);

  @override
  State<FlightResultSort> createState() => _FlightResultSortState();
}

class _FlightResultSortState extends State<FlightResultSort> {
  List<String> items = [
    "Fastest",
    "Next Flight",
    "Cheap",
    "Ecomony Class",
    "Business Class"
  ];

  String dropdownValue = "Fastest";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: default_padding * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(text: "6 Flights Found:"),
              Row(
                children: [
                  Text(
                    'Sort by:',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(width: default_padding / 2),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                        elevation: 0,
                        icon: Icon(Icons.expand_more_sharp),
                        borderRadius: BorderRadius.circular(default_BRadius),
                        dropdownColor: lightBlueGrey,
                        style: TextStyle(
                            fontSize: default_fontsize,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        value: dropdownValue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        }),
                  )
                ],
              )
            ],
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(default_BRadius)),
            child: Icon(
              Icons.swap_vert,
              color: Colors.white,
              size: default_fontsize * 2,
            ),
          )
        ],
      ),
    );
  }
}

class OriginAndDestinationContainer extends StatelessWidget {
  const OriginAndDestinationContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: default_padding * 2, vertical: default_padding * 1.5),
      margin: EdgeInsets.symmetric(horizontal: default_padding),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(default_BRadius)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OriginLocation(
            place: "New York",
            mainPlace: "USA",
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: default_BRadius * 1.5,
            child: SizedBox(
              height: default_fontsize,
              width: default_fontsize,
              child:
                  Image(image: AssetImage('assets/icons/left_right_icon.png')),
            ),
          ),
          DestinationLocation(place: "Denver", mainPlace: "Colorado")
        ],
      ),
    );
  }
}

class OriginLocation extends StatelessWidget {
  const OriginLocation({
    Key? key,
    required this.place,
    required this.mainPlace,
  }) : super(key: key);

  final String place;
  final String mainPlace;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          place,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: default_fontsize * 1.2),
        ),
        SizedBox(height: default_padding / 3),
        Text(mainPlace,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
      ],
    );
  }
}

class DestinationLocation extends StatelessWidget {
  const DestinationLocation({
    Key? key,
    required this.place,
    required this.mainPlace,
  }) : super(key: key);

  final String place;
  final String mainPlace;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          place,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: default_fontsize * 1.2),
        ),
        SizedBox(height: default_padding / 3),
        Text(mainPlace,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
      ],
    );
  }
}

class FlightListTopBar extends StatelessWidget {
  const FlightListTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: default_padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconButtonWOpacity(
              icondata: Icon(Icons.arrow_back_ios_new_rounded),
              onIconButtonTap: () {
                Navigator.pop(context);
              }),
          TitleText(
            text: "Flights List",
          ),
          iconButtonWOpacity(
              icondata: Icon(Icons.search), onIconButtonTap: () {}),
        ],
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: default_fontsize * 1.2, fontWeight: FontWeight.w700),
    );
  }
}

class iconButtonWOpacity extends StatelessWidget {
  const iconButtonWOpacity({
    Key? key,
    required this.icondata,
    required this.onIconButtonTap,
  }) : super(key: key);

  final Icon icondata;
  final VoidCallback onIconButtonTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onIconButtonTap,
      child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(default_BRadius),
              border: Border.all(color: grey2)),
          child: icondata),
    );
  }
}
