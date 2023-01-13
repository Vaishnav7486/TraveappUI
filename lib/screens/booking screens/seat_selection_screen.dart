import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';
import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/screens/booking%20screens/flight_list_screen.dart';

class SeatSelectionScreen extends StatelessWidget {
  const SeatSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const SizedBox(height: default_padding * 4),
            SeatSelectionTopBar(),
            const SizedBox(height: default_padding * 2),
            SeatTypeSelectionBar(),
            const SizedBox(height: default_padding),
            SeatColorInstruction(),
            const SizedBox(height: default_padding),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.green,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        seatLetterList.length,
                        (index) => Text(
                              seatLetterList[index],
                              style: TextStyle(fontWeight: FontWeight.w700),
                            )),
                  ),
                )
              ],
            ),
            SeatSelectionPortion_icons(),
            SizedBox(height: 20)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 160,
        child: Column(
          children: [
            Container(
              height: 1,
              color: grey2,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: default_padding),
            Container(
                padding: EdgeInsets.symmetric(horizontal: default_padding),
                child: SelectedSeatsAndTotalPrice()),
            SizedBox(height: default_padding),
            CustomButton1(buttonText: "Proceed", onPressed: () {}),
            SizedBox(height: default_padding),
          ],
        ),
      ),
    );
  }
}

class SelectedSeatsAndTotalPrice extends StatelessWidget {
  const SelectedSeatsAndTotalPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: default_padding),
          child: Icon(
            Icons.weekend_outlined,
            size: default_fontsize * 2,
            color: Colors.green.shade400,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Selected Seats",
                      style: TextStyle(
                          fontSize: default_fontsize,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  SizedBox(height: default_padding / 3),
                  Text("10-E,  10-F",
                      style: TextStyle(
                          fontSize: default_fontsize * 1.3,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$194*2",
                      style: TextStyle(
                          fontSize: default_fontsize * 1.1,
                          fontWeight: FontWeight.w600,
                          color: primaryColor)),
                  SizedBox(height: default_padding / 3),
                  Text("\$382.00",
                      style: TextStyle(
                          fontSize: default_fontsize * 1.5,
                          fontWeight: FontWeight.w800)),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class SeatSelectionPortion_icons extends StatelessWidget {
  const SeatSelectionPortion_icons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
            children: List.generate(
                11,
                (index) => Container(
                      color: Colors.red.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                              fontSize: default_fontsize,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff0000A4)),
                        ),
                      ),
                    ))),
        Expanded(
            child: Container(
          color: Colors.blue.shade200,
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(), shrinkWrap: true,
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this would produce 2 rows.
            crossAxisCount: 3,
            // Generate 100 Widgets that display their index in the List
            children: List.generate(33, (index) {
              return Container(
                color: Colors.amber,
                child: Icon(Icons.weekend, color: Colors.white),
              );
            }),
          ),
        )),
        SizedBox(width: default_padding),
        Expanded(
            child: Container(
          color: Colors.blue.shade300,
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(), shrinkWrap: true,
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this would produce 2 rows.
            crossAxisCount: 3,
            // Generate 100 Widgets that display their index in the List
            children: List.generate(26, (index) {
              return Container(
                color: Colors.amber,
                child: Icon(Icons.weekend, color: Colors.white),
              );
            }),
          ),
        )),
        SizedBox(width: default_padding),
        Expanded(
            child: Container(
          color: Colors.blue.shade400,
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(), shrinkWrap: true,
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this would produce 2 rows.
            crossAxisCount: 3,
            // Generate 100 Widgets that display their index in the List
            children: List.generate(33, (index) {
              return Container(
                color: Colors.amber,
                child: Icon(Icons.weekend, color: Colors.white),
              );
            }),
          ),
        )),
      ],
    );
  }
}

var seatLetterList = [
  "A",
  "B",
  "C",
  "",
  "D",
  "E",
  "F",
  "",
  "G",
  "H",
  "I",
];

class SeatColorInstruction extends StatelessWidget {
  const SeatColorInstruction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: default_padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.weekend_outlined,
                size: default_fontsize * 2,
                color: Colors.green.shade300,
              ),
              SizedBox(width: default_padding / 1.5),
              Text(
                "Selected",
                style: TextStyle(
                    fontSize: default_fontsize, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.weekend_outlined,
                size: default_fontsize * 2,
                color: Colors.red.shade200,
              ),
              SizedBox(width: default_padding / 1.5),
              Text("Booked",
                  style: TextStyle(
                      fontSize: default_fontsize, fontWeight: FontWeight.w600))
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.weekend_outlined,
                size: default_fontsize * 2,
                color: Colors.grey.shade300,
              ),
              SizedBox(width: default_padding / 1.5),
              Text("Available",
                  style: TextStyle(
                      fontSize: default_fontsize, fontWeight: FontWeight.w600))
            ],
          )
        ],
      ),
    );
  }
}

class SeatTypeSelectionBar extends StatefulWidget {
  const SeatTypeSelectionBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SeatTypeSelectionBar> createState() => _SeatTypeSelectionBarState();
}

class _SeatTypeSelectionBarState extends State<SeatTypeSelectionBar> {
  @override
  Widget build(BuildContext context) {
    var selectedSeatType = 'EC';

    return Container(
      width: 360,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(default_BRadius / 2)),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedSeatType = "BC";
                });
              },
              child: Container(
                margin: EdgeInsets.all(default_padding / 4),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(default_BRadius / 2)),
                child: Center(
                  child: Text("Business Class",
                      style: TextStyle(fontWeight: FontWeight.w700)),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedSeatType = "EC";
                });
              },
              child: Container(
                margin: EdgeInsets.all(default_padding / 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(default_BRadius / 2)),
                child: Center(
                  child: Text(
                    "Ecomomy Class",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SeatSelectionTopBar extends StatelessWidget {
  const SeatSelectionTopBar({
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
              icondata: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: textGrey,
              ),
              onIconButtonTap: () {}),
          TitleText(
            text: "Flights List",
          ),
          iconButtonWOpacity(
              icondata: Icon(
                Icons.more_vert,
                color: textGrey,
              ),
              onIconButtonTap: () {}),
        ],
      ),
    );
  }
}
