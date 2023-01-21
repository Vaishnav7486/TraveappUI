import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/screens/booking%20screens/flight_list_screen.dart';

class PassengerDetailsScreen extends StatelessWidget {
  const PassengerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: default_padding * 4),
            PassengerSelectionTopBar(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: default_padding),
              child: Column(
                children: [
                  SizedBox(height: default_padding * 1.5),
                  InformationText1(),
                  SizedBox(height: default_padding * 1.5),
                  SelectedSeatsAndTotalPrice2(),
                  SizedBox(height: default_padding * 1.5),
                  ExpansionTileDetailCollecting1(
                    titletext: "Contact Details",
                  ),
                  SizedBox(height: default_padding / 2),
                  ExpansionTileDetailCollecting1(
                    titletext: "01: Passenger Details",
                  ),
                  SizedBox(height: default_padding / 2),
                  ExpansionTileDetailCollecting1(
                    titletext: "02: Passenger Details",
                  ),
                  SizedBox(height: default_padding),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 55,
          margin: EdgeInsets.symmetric(vertical: default_padding),
          child: CustomButton1(
              buttonText: "Proceed to Continue",
              onPressed: () {
                Navigator.pushNamed(context, "PaymentDetailsScreen");
              })),
    );
  }
}

class ExpansionTileDetailCollecting1 extends StatelessWidget {
  const ExpansionTileDetailCollecting1({
    Key? key,
    required this.titletext,
  }) : super(key: key);

  final String titletext;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      title: Text(
        titletext,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      trailing: Icon(
        Icons.expand_more,
        color: Colors.white,
      ),
      animateTrailing: true,
      baseColor: Colors.black,
      expandedColor: Colors.black,
      expandedTextColor: Colors.white,
      elevation: 0,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: default_BRadius / 2,
            vertical: default_BRadius,
          ),
          // height: 80,
          decoration: BoxDecoration(
              color: lightBlueGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NameInput(),
              SizedBox(height: default_padding),
              Text(
                "Email ID",
                style: TextStyle(fontWeight: FontWeight.w500, color: textGrey),
              ),
              SizedBox(height: default_padding / 2),
              CustomTextfield1(text: "example@xyz.com"),
              SizedBox(height: default_padding),
              Text(
                "Contact Number",
                style: TextStyle(fontWeight: FontWeight.w500, color: textGrey),
              ),
              SizedBox(height: default_padding / 2),
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 58,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(default_BRadius / 2),
                            topLeft: Radius.circular(default_BRadius / 2))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      "assets/icons/indian_flag.png"))),
                        ),
                        Text(
                          "+91",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 4),
                        Container(
                          height: 30,
                          width: 1,
                          color: grey1,
                          padding: EdgeInsets.symmetric(horizontal: 2),
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "00000 00000",
                          hintStyle: TextStyle(color: grey1),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius: BorderRadius.only(
                                  bottomRight:
                                      Radius.circular(default_BRadius / 2),
                                  topRight:
                                      Radius.circular(default_BRadius / 2)))),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "First Name",
                style: TextStyle(fontWeight: FontWeight.w500, color: textGrey),
              ),
              SizedBox(height: default_padding / 2),
              CustomTextfield1(
                text: "Jose",
              ),
            ],
          ),
        ),
        SizedBox(width: default_padding / 2),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Second Name",
                style: TextStyle(fontWeight: FontWeight.w500, color: textGrey),
              ),
              SizedBox(height: default_padding / 2),
              CustomTextfield1(text: "Kungiya")
            ],
          ),
        )
      ],
    );
  }
}

class CustomTextfield1 extends StatelessWidget {
  const CustomTextfield1({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: text,
          hintStyle: TextStyle(color: grey1),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(default_BRadius / 2))),
    );
  }
}

class SelectedSeatsAndTotalPrice2 extends StatelessWidget {
  const SelectedSeatsAndTotalPrice2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: default_padding / 1.5,
        horizontal: default_padding / 1.5,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: grey2),
          borderRadius: BorderRadius.circular(default_BRadius / 2)),
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
                  Text("\$194*2 Person",
                      style: TextStyle(
                          fontSize: default_fontsize * 1.05,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  SizedBox(height: default_padding / 3),
                  Text("\$382.00",
                      style: TextStyle(
                          fontSize: default_fontsize * 1.6,
                          fontWeight: FontWeight.w800,
                          color: primaryColor)),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class InformationText1 extends StatelessWidget {
  const InformationText1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      """Here you have to enter details for the main passenger and co-passengers""",
      style: TextStyle(
        fontSize: default_fontsize,
        color: textGrey,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class PassengerSelectionTopBar extends StatelessWidget {
  const PassengerSelectionTopBar({
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
              onIconButtonTap: () {
                Navigator.pop(context);
              }),
          TitleText(
            text: "Passenger Details",
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
