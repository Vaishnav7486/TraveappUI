import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui3travelapp/constants/constants.dart';
import 'package:ui3travelapp/screens/booking%20screens/flight_list_screen.dart';
import 'package:ui3travelapp/screens/booking%20screens/passenger_details_screen.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: default_padding * 1.5),
            PaymentDetailsTopBar(),
            SizedBox(height: default_padding * 1.5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: default_padding),
              child: Column(
                children: [
                  SelectedSeatsAndTotalPrice2(),
                  SizedBox(height: default_padding * 1.5),
                  ExpansionTileCardInPaymentScreen()
                ],
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: default_padding * 1.5),
        height: 55,
        child: CustomButton1(
          buttonText: "Confirm Your Booking",
          onPressed: () {
            Navigator.pushNamed(context, "TicketConfirmationSplash");
          },
        ),
      ),
    );
  }
}

class ExpansionTileCardInPaymentScreen extends StatefulWidget {
  const ExpansionTileCardInPaymentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpansionTileCardInPaymentScreen> createState() =>
      _ExpansionTileCardInPaymentScreenState();
}

class _ExpansionTileCardInPaymentScreenState
    extends State<ExpansionTileCardInPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    String? paymentMethod;
    return ExpansionTileCard(
      title: Text(
        "Contact Details",
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
              Row(children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: default_padding / 2),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: primaryColor,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/icons/visa.png"))),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/icons/mastercard.png"))),
                )
                // RadioListTile(
                //     value: "cardpayment",
                //     groupValue: paymentMethod,
                //     onChanged: (value) {
                //       setState(() {
                //         paymentMethod = value.toString();
                //       });
                //     }),
                ,
                Text(
                  "Credit/Debit Card",
                  style: TextStyle(
                      fontSize: default_fontsize, fontWeight: FontWeight.w600),
                )
              ]),
              SizedBox(height: default_padding),
              Text(
                "Name on Card",
                style: TextStyle(fontWeight: FontWeight.w500, color: textGrey),
              ),
              SizedBox(height: default_padding / 2),
              CustomTextfield1(text: "Eg: MARK SOMENAME"),
              SizedBox(height: default_padding),
              Text(
                "Card Number",
                style: TextStyle(fontWeight: FontWeight.w500, color: textGrey),
              ),
              SizedBox(height: default_padding / 2),
              CustomTextfield1(text: "XXXX XXXX XXXX XX25"),
              SizedBox(height: default_padding),
              Text("Expiry Date",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, color: textGrey)),
              SizedBox(height: default_padding / 2),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "MM/YYYY",
                          hintStyle: TextStyle(color: grey1),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)))),
                    ),
                  ),
                  Container(
                      height: 58,
                      padding:
                          EdgeInsets.symmetric(horizontal: default_padding),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                      ),
                      child: Icon(
                        FluentIcons.calendar_ltr_24_regular,
                        color: grey1,
                      ))
                ],
              ),
              SizedBox(height: default_padding),
              Text("CVV Number",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, color: textGrey)),
              SizedBox(height: default_padding / 2),
              CustomTextfield1(text: "XXX"),
              SizedBox(height: default_padding),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: default_padding / 2),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: primaryLight,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  width: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/icons/paypal.png"))),
                ),
                SizedBox(width: default_padding / 2),
                Text(
                  "Paypal",
                  style: TextStyle(
                      fontSize: default_fontsize, fontWeight: FontWeight.w600),
                )
              ]),
            ],
          ),
        )
      ],
    );
  }
}

class PaymentDetailsTopBar extends StatelessWidget {
  const PaymentDetailsTopBar({
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
            text: "Payment Details",
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
